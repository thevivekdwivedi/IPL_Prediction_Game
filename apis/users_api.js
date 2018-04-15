const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var usersModel = require('../models/users');
var authentication = require('./authentication');

/**
 * <p>This method returns all the users.</p>
 * @author Vivek Dwivedi
 */
router.get('/', (req, res) => {
    usersModel.findAll({
        attributes: {
            exclude: ['apiKey']
        }
    }).then(users => {
        console.log("User list: " + users);
        res.json(users);
    });
});

/**
 * <p>This method returns a particular user</p>
 * @author Vivek Dwivedi
 */
router.get('/:userID', (req, res) => {
    usersModel.findOne({
        where: {
            userID: req.params.userID
        },
        attributes: {
            exclude: ['apiKey']
        }
    }).then(user => {
        console.log("User: " + user);
        res.json(user);
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
    var canUserBeCreated = authentication.isRequesterAuthorized(requester, apiKey);

    if (!authentication.isReuqesterAnAdmin(requester)) {
        newUserRole = "Player";
    }
    
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
    }
});

module.exports = router;