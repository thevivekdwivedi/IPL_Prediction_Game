const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var matchDecisionsModel = require('../models/matchDecisions');
var authentication = require("./authentication");

var requester, apiKey, errorMessage;

/**
 * <p>This API is used to retrieve all the match decisions</p>
 * @author Vivek Dwivedi
 */
router.post('/',(req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            matchDecisionsModel.findAll().then(stauses => {
                res.json(statuses);
            }).catch(err => {
                res.json("Could not retrieve match decisions: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This API is used to insert a new match decision.</p>
 * <p>Only Admin users are allowed access to this.</p>
 * @author Vive DWivedi
 */
router.post('/insert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    
    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            matchDecisionsModel.create({
                decisionID: req.body.decisionID,
                decisionName: req.body.decisionName
            }).then(bidStatus => {
                res.json(bidStatus);
            }).catch(err => {
                res.json("Could not insert decision into matchDecisions: " + err);
            })
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;