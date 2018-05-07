import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-portal-navbar',
  templateUrl: './portal-navbar.component.html',
  styleUrls: ['./portal-navbar.component.css']
})
export class PortalNavbarComponent implements OnInit {
  isAdmin: boolean;

  constructor() { }

  ngOnInit() {
    this.isAdmin = false;
  }

}
