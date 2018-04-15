const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var bidsModel = require('../models/bids');

/**
 * <p>This method reutrns the entire bid</p>
 * @author Vivek Dwivedi
 */
router.get('/', (req, res) => {
    bidsModel.findAll().then(bids => {
        console.log("Bids list: " + bids);
        res.json(bids);
    });
});

/**
 * <p>This method returns a particular bid</p>
 * @author Vivek Dwivedi
 */
router.get('/:bidID', (req, res) => {
    bidsModel.findById(req.params.bidID).then(bid => {
        console.log("Bid: " + bid);
        res.json(bid);
    });
});

/**
 * <p>This method inserts a bid into the table</p>
 * @author Vivek Dwivedi
 */
router.post('/insertBid', (req, res) => {
    console.log("Insert body: " + req.body);
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
});

/**
 * <p>This mehtod updates an existing bid</p>
 * @author Vivek Dwivedi
 */
router.put('/reviseBid', (req, res) => {
    console.log("update body: " + req.body);
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
});

module.exports = router;