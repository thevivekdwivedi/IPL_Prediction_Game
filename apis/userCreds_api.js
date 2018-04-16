const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var userCredsModel = require('../models/userCreds');
var authentication = require('./authentication');

var requester, apiKey, shouldAccessBeAllowed, errorMessage;

/**
 * <p>This method returns a particular user's credentials</p>
 * @author Vivek Dwivedi
 */
router.get('/:userID', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    if (requester == req.params.userID) {
        shouldAccessBeAllowed = authentication.isRequesterAuthorized(requester, apiKey);
    } else {
        shouldAccessBeAllowed = authentication.isRequesterAuthorizedAndAdmin(requester, apiKey);
    }

    if (shouldAccessBeAllowed) {
        userCredsModel.findById(req.params.userID).then(user => {
            console.log("User: " + user);
            res.json(user);
        }).catch(err => {
            errorMessage = "User credentials could not be retrieved.";
            console.error(errorMessage);
            res.json(err);
        });
    } else {
        errorMessage = "You are not allowed to access this.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
});

/**
 * <p>This method inserts a particular user's credentials.</p>
 * @author Vivek Dwivedi
 */
router.post('/insert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    shouldAccessBeAllowed = authentication.isRequesterAuthorizedAndAdmin(requester, apiKey);

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
        errorMessage = "You are not allowed to access this.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
    
});

module.exports = router;