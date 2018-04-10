const express = require('express');
const router = express.Router();
const Sequelize = require('sequelize');

var teams = require('../models/teams');

/**
 * <p>This api is used to get all of the teams that are playing the IPL</p>
 */
router.get('/', (req, res) => {
    teams.findAll().then(teamList => {
        console.log("Team list: " + teamList);
        res.json(teamList);
    });
});

/**
 * <p>This api is used to get the details of just one particular team.</p>
 */
router.get('/:id', (req, res) => {
    teams.findById(req.params.id).then(team => {
        console.log("Team: " + team);
        res.json(team);
    });
});

/**
 * <p>This api is used to insert the details of a particular team</p>
 */
router.post('/insert', (req, res) => {
    console.log("Inser request body: " + req.body);
    teams.create({
        teamName: req.body.teamName.toString()
    }).then(team => {
        res.json(team);
    });
});
