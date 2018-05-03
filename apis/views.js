import { SSL_OP_MICROSOFT_BIG_SSLV3_BUFFER } from 'constants';

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
router.post('/leaderboard', (req, res) => {
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

/**
 * <p>This api is used to get the bid audits</p>
 * <p>If the user is admin and the request body does not have the first name provided,<br>
 * the entire bid audit is returned to the admin.<br>
 * If the user is admin and the request body does have the first name provided,<br>
 * the bid audit for the requested user is returned to the admin.</p>
 * <p>If the user is not an amdin, he/she will not have the authority to request for<br>
 * anyone else's bid audits. S/he will only be allwed to view their respective bid<br>
 * audit, provided that their first name is provided in the request.</p>
 * @author Vivek Dwivedi
 */
router.post('/bidAudit', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (null != req.body.firstName) {
            shouldAccessBeAllowed = false;
        }
        if (shouldAccessBeAllowed) {
            db.query('select * from bidAudit;', {
                type: Sequelize.QueryTypes.SELECT
            }).then(bidAudit => {
                console.log("Bid Audit: " + bidAudit);
                res.json(bidAudit);
            }).catch(err => {
                errorMessage = "Unable to retrieve bid audit.";
                console.error(errorMessage);
                res.json(errorMessage);
            });
        } else {
            authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
                if (null != req.body.firstName) {
                    shouldAccessBeAllowed = false;
                }
                if (shouldAccessBeAllowed) {
                    db.query('select * from bidAudit where FirstName=' + req.body.firstName.toString() + ';', {
                        type: Sequelize.QueryTypes.SELECT
                    }).then(bidAudit => {
                        console.log("Bid Audit: " + bidAudit);
                        res.json(bidAudit);
                    }).catch(err => {
                        errorMessage = "Unable to retrieve bid audit.";
                        console.error(errorMessage);
                        res.json(errorMessage);
                    });
                } else {
                    res.json(authentication.userUnauthorizedAccessString());
                }
            }).catch(err => {
                res.json(authentication.unauthorizedAccessRequestString());
            });
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This api is used to get the spreads for all the games</p>
 * @author Vivek Dwivedi
 */
router.post('/spread', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    
    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (null != req.body.matchID) {
            shouldAccessBeAllowed = false;
        }
        if (shouldAccessBeAllowed) {
            db.query('select * from spread;', {
                type: Sequelize.QueryTypes.SELECT
            }).then(spread => {
                console.log("Spread: " + spread);
                res.json(spread);
            }).catch(err => {
                errorMessage = "Unable to retrieve spread.";
                console.error(errorMessage);
                res.json(errorMessage);
            });
        } else {
            authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
                if (null != req.body.matchID) {
                    shouldAccessBeAllowed = false;
                }
                if (shouldAccessBeAllowed) {
                    db.query('select * from spread where matchID=' + req.body.matchID + ';', {
                        type: Sequelize.QueryTypes.SELECT
                    }).then(spread => {
                        console.log("Spread: " + spread);
                        res.json(spread);
                    }).catch(err => {
                        errorMessage = "Unable to retrieve spread.";
                        console.error(errorMessage);
                        res.json(errorMessage);
                    });
                } else {
                    res.json(authentication.userUnauthorizedAccessString());
                }
            }).catch(err => {
                res.json(authentication.unauthorizedAccessRequestString());
            });
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;