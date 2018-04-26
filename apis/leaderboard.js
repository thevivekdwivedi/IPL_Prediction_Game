const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

var authentication = require('./authentication');

var requester, apiKey, errorMessage;

/**
 * <p>This api is used to get the leaderboard for the season</p>
 * @author Vivek Dwivedi
 */
router.post('/', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
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
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;