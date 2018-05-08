import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PortalNavbarComponent } from './portal-navbar/portal-navbar.component';
import { HomePageComponent } from './home-page/home-page.component';
import { LeaderboardCardComponent } from './leaderboard-card/leaderboard-card.component';
import { SpreadCardComponent } from './spread-card/spread-card.component';
import { BidCardComponent } from './bid-card/bid-card.component';


@NgModule({
  declarations: [
    AppComponent,
    PortalNavbarComponent,
    HomePageComponent,
    LeaderboardCardComponent,
    SpreadCardComponent,
    BidCardComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
