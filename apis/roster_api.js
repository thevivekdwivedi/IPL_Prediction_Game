const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var rosterModel = require('../models/roster');
var authentication = require("../apis/authentication");

var requester, apiKey, errorMessage;

/**
 * <p>This method returns the entire roster</p>
 * @author Vivek Dwivedi
 */
router.post('/', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            rosterModel.findAll().then(roster => {
                console.log("Roster list: " + roster);
                res.json(roster);
            }).catch(err => {
                res.json("Could not retrieve roster: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

// router.get('/currentSeason', (req, res) => {
//     rosterModel.findAll({
//         where: {

//         }
//     })
// })

/**
 * <p>This method returns a particular match</p>
 * @author Vivek Dwivedi
 */
router.post('/:matchID', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            rosterModel.findById(req.params.matchID).then(match => {
                console.log("Match: " + match);
                res.json(match);
            }).catch(err => {
                res.json("Could not retrieve match: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This method inserts a match into the roster</p>
 * @author Vivek Dwivedi
 */
router.post('/isnert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            rosterModel.create({
                team1: req.body.team1,
                team2: req.body.team2,
                matchDate: req.body.matchDate,
                matchTime: req.body.matchTime,
                matchDecision: req.body.matchDecision,
                bidStatus: req.body.bidStatus
            }).then(match => {
                res.json(match);
            }).catch(err => {
                res.json("Could not insert match into roster: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;