const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

var authentication = require('./authentication');

var requester, apiKey, errorMessage, shouldAccessBeAllowed;

/**
 * <p>This api is used to get the leaderboard for the season</p>
 * @author Vivek Dwivedi
 */
router.get('/', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    shouldAccessBeAllowed = authentication.isRequesterAuthorized(requester, apiKey);

    if (shouldAccessBeAllowed) {
        db.query('select * from leaderboard;', {
            type: Sequelize.QueryTypes.SELECT
        }).then(leaderboard => {
            console.log("Leaderboard: " + leaderboard);
            res.json(leaderboard);
        }).catch(err => {
            errorMessage = "Unable to retrieve leaderboard.";
            console.error(errorMessage);
            res.json(errorMessage);
        });
    } else {
        errorMessage = "You are not authorized to access this information.";
        console.error(errorMessage);
        res.json(errorMessage);
    }
})