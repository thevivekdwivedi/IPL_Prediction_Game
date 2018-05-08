import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-bid-card',
  templateUrl: './bid-card.component.html',
  styleUrls: ['./bid-card.component.css']
})
export class BidCardComponent implements OnInit {
  selectorLabel: String;
  bidAmountLabel: String;
  placeBidButtonLabel: String;
  today: number;

  constructor() { }

  ngOnInit() {
    this.selectorLabel = "Match decision";
    this.bidAmountLabel = "Bid amount";
    this.placeBidButtonLabel = "Place bid";
    this.today = Date.now();
  }

}
