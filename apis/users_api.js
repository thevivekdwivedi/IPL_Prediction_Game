const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var usersModel = require('../models/users');
var authentication = require('./authentication');

/**
 * <p>This method returns all the users.</p>
 * @author Vivek Dwivedi
 */
router.post('/', (req, res) => {
    console.log("req: " + req.body.requester + " " + req.body.apiKey);

    var requester = req.body.requester;
    var apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            usersModel.findAll().then(usersArray => {
                console.log("User array: " + usersArray);
                res.json(usersArray);
            }).catch(err => {
                console.error("Could not retrieve users data.");
                res.json(err);
            });
        } else {
            var errorMessage = "You are not authorized to access this.";
            console.error("Unathorized access request.");
            res.json(errorMessage);
        }
    }).catch(err => {
        console.error(err);
        res.json(err);
    });
});

/**
 * <p>This method returns a particular user</p>
 * @author Vivek Dwivedi
 */
router.post('/:userID', (req, res) => {
    var requester = req.body.requester;
    var apiKey = req.body.apiKey;
    var shouldAccessBeAllowed;

    if (requester == req.body.requester) {
        shouldAccessBeAllowed = authentication.isRequesterAuthorized(requester, apiKey);
    } else {
        shouldAccessBeAllowed = authentication.isRequesterAuthorizedAndAdmin(requester, apiKey);
    }

    shouldAccessBeAllowed.then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            usersModel.findOne({
                where: {
                    userID: req.params.userID
                }
            }).then(user => {
                console.log("User: " + user);
                res.json(user);
            }).catch(err => {
                var errorMessage = "You are not authorized to access this.";;
                console.error("Unauthorized access request.");
                res.json(errorMessage);
            });
        }
    });
});

/**
 * <p>This method inserts a particular user's detais.</p>
 * @author Vivek Dwivedi
 */
router.post('/insert', (req, res) => {
    var requester = req.body.requester;
    var apiKey = req.body.apiKey;
    var newUserRole = req.body.role;

    authentication.isReuqesterAnAdmin(requester).then(isAdmin => {
        if (!isAdmin) {
            newUserRole = "Player";
        }
        authentication.isRequesterAuthorized(requester, apiKey).then(canUserBeCreated => {
            if (canUserBeCreated) {
                usersModel.create({
                    userID: req.body.userID,
                    firstName: req.body.firstName,
                    lastName: req.body.lastName,
                    role: newUserRole,
                    apiKey: req.body.apiKey,
                    emaildID: req.body.emaildID
                }).then(user => {
                    res.json(user);
                    console.log("User has been added");
                }).catch(err => {
                    res.json(err);
                    console.log("User could not be created");
                });
            } else {
                res.json("You are not authorized to create a new user");
            }
        }).catch(err => {
            res.json("Unauthorized access request: " + err);
        })
    });
});

module.exports = router;