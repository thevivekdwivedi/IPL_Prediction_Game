const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var userCredsModel = require('../models/userCreds');
var authentication = require('./authentication');

var requester, apiKey, errorMessage = "User credentials could not be retrieved.";

/**
 * <p>This method returns a particular user's credentials</p>
 * @author Vivek Dwivedi
 */
router.get('/:userID', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    var authorization;

    if (requester == req.params.userID) {
        authorization = authentication.isRequesterAuthorized(requester, apiKey);
    } else {
        authorization = authentication.isRequesterAuthorizedAndAdmin(requester, apiKey);
    }

    authorization.then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            userCredsModel.findById(req.params.userID).then(user => {
                console.log("User: " + user);
                res.json(user);
            }).catch(err => {
                console.error(errorMessage);
                res.json(err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    })
});

/**
 * <p>This method inserts a particular user's credentials.</p>
 * @author Vivek Dwivedi
 */
router.post('/insert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            userCredsModel.create({
                userID: req.body.userID,
                password: req.body.password,
                apiKey: req.body.apiKey
            }).then(user => {
                console.log("Inserted credentials: " + user);
                res.json(user);
            }).catch(err => {
                errorMessage = "Credentials could not be inserted.";
                console.error(errorMessage);
                res.json(err);
            })
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    })
});

module.exports = router;