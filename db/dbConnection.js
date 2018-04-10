const Sequelize = require('sequelize');
const sequelize = new Sequelize('ipl','root','root', {
    host: 'localhost',
    dialect: 'mysql',
    pool: {
        max: 100,
        min: 1,
        idle: 10
    },
    define: {
        timestamps: false,
        freezeTableName: true
    }
});

sequelize.authenticate().then(()=>{
    console.log('Connection has been successfully established.');
}).catch(err => {
    console.error('Unable to connect to the database: ', err);
});

module.exports = sequelize;