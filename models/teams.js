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
}, {
        getterMethods: {
            getTeamID() {
                return this.teamID;
            },
            getTeamName() {
                return this.teamName;
            }
        },
        setterMethods: {
            setTeamID(id) {
                this.teamID = id;
            },
            setTeamName(name) {
                this.teamName = name;
            }
        }
    });

module.exports = teams;