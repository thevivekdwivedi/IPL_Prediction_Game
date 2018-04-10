const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var rosterModel = require('../models/roster');

/**
 * <p>This method returns the entire roster</p>
 */
router.get('/', (req, res) => {
    rosterModel.findAll().then(roster => {
        console.log("Roster list: " + roster);
        res.json(roster);
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
 */
router.get('/:matchID', (req, res) => {
    rosterModel.findById(req.params.matchID).then(match => {
        console.log("Match: " + match);
        res.json(match);
    });
});

router.post('/isnert', (req, res) => {
    console.log("Insert body: " + req.body);
    rosterModel.create({
        team1: req.body.team1,
        team2: req.body.team2,
        matchDate: req.body.matchDate,
        matchTime: req.body.matchTime,
    }).then(match => {
        res.json(match);
    });
});

module.exports = router;