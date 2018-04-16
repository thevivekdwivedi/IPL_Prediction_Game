const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var teams = require('../models/teams');
var authentication = require('./authentication');

var requester, apiKey, errorMessage, shouldAccessBeAllowed;

/**
 * <p>This api is used to get all of the teams that are playing the IPL</p>
 * @author Vivek Dwivedi
 */
router.get('/', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    shouldAccessBeAllowed = authentication.isRequesterAuthorized(requester, apiKey);

    if (shouldAccessBeAllowed) { 
        teams.findAll().then(teamList => {
            console.log("Team list: " + teamList);
            res.json(teamList);
        }).catch(err => {
            errorMessage = "Teams could not be retrieved.";
            console.error(errorMessage);
            res.json(err);
        });
    } else {
        errorMessage = "You are not authorized to access this.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
});

/**
 * <p>This api is used to get the details of just one particular team.</p>
 * @author Vivek Dwivedi
 */
router.get('/:id', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    shouldAccessBeAllowed = authentication.isRequesterAuthorized(requester, apiKey);

    if (shouldAccessBeAllowed) {
        teams.findById(req.params.id).then(team => {
            console.log("Team: " + team);
            res.json(team);
        }).catch(err => {
            errorMessage = "Team could not be retrieved.";
            console.error(errorMessage);
            res.json(errorMessage);
        });
    } else {
        errorMessage = "You are not authorized to access this.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
});

/**
 * <p>This api is used to insert the details of a particular team</p>
 * @author Vivek Dwivedi
 */
router.post('/insert', (req, res) => {
    console.log("Insert request body: " + req.body);

    requester = req.body.requester;
    apiKey = req.body.apiKey;
    shouldAccessBeAllowed = authentication.isRequesterAuthorizedAndAdmin(requester, apiKey);

    if (shouldAccessBeAllowed) {
        teams.create({
            teamID: req.body.teamID,
            teamName: req.body.teamName
        }).then(team => {
            res.json(team);
        }).catch(err => {
            errorMessage = "Team could not be inserted.";
            console.error(errorMessage);
            res.json(errorMessage);
        });
    } else {
        errorMessage = "You are not authorized to access this.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
});

module.exports = router;