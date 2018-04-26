const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var bidsModel = require('../models/bids');
var authentication = require('../apis/authentication');

var requester, apiKey;

/**
 * <p>This method reutrns the entire bid</p>
 * @author Vivek Dwivedi
 */
router.post('/', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidsModel.findAll().then(bids => {
                console.log("Bids list: " + bids);
                res.json(bids);
            }).catch(err => {
                res.json("Could not retrieve bids: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This method returns a particular bid</p>
 * @author Vivek Dwivedi
 */
router.post('/:bidID', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidsModel.findById(req.params.bidID).then(bid => {
                console.log("Bid: " + bid);
                if (bid.userID.toString() == requester.toString()) {
                    res.json(bid);
                } else {
                    authentication.isReuqesterAnAdmin(requester).then(isAdmin => {
                        if (isAdmin) {
                            res.json(bid);
                        } else {
                            res.json(authentication.userUnauthorizedAccessString());
                        }
                    })
                }
            }).catch(err => {
                res.json("Could not retrieve bid: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This method inserts a bid into the table</p>
 * @author Vivek Dwivedi
 */
router.post('/insertBid', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidsModel.create({
                bidId: req.body.bidID,
                matchID: req.body.matchID,
                userID: req.body.userID,
                predictedResult: req.body.predictedResult,
                bidAmount: req.body.bidAmount
            }).then(bid => {
                res.json(bid);
                console.log("Bid has been placed.");
            }).catch(err => {
                res.json(err);
                console.log("Bid could not be placed: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This mehtod updates an existing bid</p>
 * @author Vivek Dwivedi
 */
router.put('/reviseBid', (req, res) => {
    console.log("update body: " + req.body);
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidsModel.update({
                predictedResult: req.body.predictedResult,
                bidAmount: req.body.bidAmount,
                revisedBid: true,
                timestamp: Sequelize.NOW
            }, {
                    where: {
                        bidID: req.body.bidID,
                        revisedBid: false
                    }
                }).then(revisedBid => {
                    res.json(true);
                    console.log("Bid has been revised");
                }).catch(err => {
                    res.json(err);
                    console.log("Bid could not be revised: " + err);
                });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;