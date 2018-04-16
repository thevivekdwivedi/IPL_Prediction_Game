const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var userCredsModel = require('../models/userCreds');

/**
 * <p>This method returns a particular user's credentials</p>
 */
router.get('/:userID', (req, res) => {
    userCredsModel.findById(req.params.userID, {
        attributes: {
            exclude: ['apiKey']
        }
    }).then(user => {
        console.log("User: " + user);
        res.json(user);
    });
});

/**
 * <p>This method inserts a particular user's credentials.</p>
 */
router.post('/insert', (req, res) => {
    userCredsModel.create({
        userID: req.body.userID,
        password: req.body.password,
        apiKey: req.body.apiKey
    }).then(user => {
        res.json(user);
    });
});

module.exports = router;