const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var usersModel = require('../models/users');

/**
 * <p>This method returns all the users.</p>
 */
router.get('/', (req, res) => {
    usersModel.findAll().then(users => {
        console.log("User list: " + users);
        res.json(users);
    });
});

/**
 * <p>This method returns a particular user</p>
 */
router.get('/:userID', (req, res) => {
    usersModel.findById(req.params.userID).then(user => {
        console.log("User: " + user);
        res.json(user);
    });
});

/**
 * <p>This method inserts a particular user's detais.</p>
 */
router.post('/insert', (req, res) => {
    usersModel.create({
        userID: req.body.userID,
        firstName: req.body.firstName,
        lastName: req.body.lastName
    }).then(user => {
        res.json(user);
    });
});

module.exports = router;