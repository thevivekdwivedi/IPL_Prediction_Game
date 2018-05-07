const router = express.Router();
const Sequelize = require('sequelize');

var bidStatusesModel = require('../models/bidStatuses');
var authentication = require("./authentication");

var requester, apiKey, errorMessage;

/**
 * <p>This API is used to retrieve all the bid statuses</p>
 * @author Vivek Dwivedi
 */
router.post('/',(req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;

    authentication.isRequesterAuthorized(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidStatusesModel.findAll().then(stauses => {
                res.json(statuses);
            }).catch(err => {
                res.json("Could not retrieve statuses: " + err);
            });
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

/**
 * <p>This API is used to insert a new bid status.</p>
 * <p>Only Admin users are allowed access to this.</p>
 * @author Vive DWivedi
 */
router.post('/insert', (req, res) => {
    requester = req.body.requester;
    apiKey = req.body.apiKey;
    
    authentication.isRequesterAuthorizedAndAdmin(requester, apiKey).then(shouldAccessBeAllowed => {
        if (shouldAccessBeAllowed) {
            bidStatusesModel.create({
                statusID: req.body.statusID,
                statusName: req.body.statusName
            }).then(bidStatus => {
                res.json(bidStatus);
            }).catch(err => {
                res.json("Could not insert status into bidStatuses: " + err);
            })
        } else {
            res.json(authentication.userUnauthorizedAccessString());
        }
    }).catch(err => {
        res.json(authentication.unauthorizedAccessRequestString());
    });
});

module.exports = router;