const Sequelize = require('sequelize');
const dbPassword = process.env.DB_PASSWORD;

const sequelize = new Sequelize('ipl','root',dbPassword.toString(), {
    host: 'localhost',
    dialect: 'mysql',
    port: 3306,
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