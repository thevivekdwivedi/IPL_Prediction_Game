const Sequelize = require('sequelize');
const db = require('../db/dbConnection');

const teams = db.define('teams', {
    teamID: {
        type: Sequelize.STRING(5),
        primaryKey: true
    },
    teamName: {
        type: Sequelize.STRING(80),
        allowNull: false,
        unique: true
    }
});

module.exports = teams;