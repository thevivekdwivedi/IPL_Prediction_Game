import { User } from './userModel';

export class Bid {
    bidID: number;
    matchID: number;
    user: User;
    bidAmount: number;
    winningAmount: number;

    constructor(matchID: number, bidAmount: number) {
        this.matchID = matchID;
        this.bidAmount = bidAmount;
        // this.user = user-service.getCurrentUser();
    }
}