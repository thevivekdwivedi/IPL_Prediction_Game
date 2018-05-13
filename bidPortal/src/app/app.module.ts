import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';


import { AppComponent } from './app.component';
import { PortalNavbarComponent } from './portal-navbar/portal-navbar.component';
import { HomePageComponent } from './home-page/home-page.component';
import { LeaderboardCardComponent } from './leaderboard-card/leaderboard-card.component';
import { SpreadCardComponent } from './spread-card/spread-card.component';
import { BidCardComponent } from './bid-card/bid-card.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { AppRoutingModule } from './/app-routing.module';
import { HomeComponent } from './home/home.component';
import { LeaderboardPageComponent } from './leaderboard-page/leaderboard-page.component';
import { SpreadPageComponent } from './spread-page/spread-page.component';
import { RulesPageComponent } from './rules-page/rules-page.component';
import { AdminPageComponent } from './admin-page/admin-page.component';
import { BidsPageComponent } from './bids-page/bids-page.component';
import { SettingsPageComponent } from './settings-page/settings-page.component';


@NgModule({
  declarations: [
    AppComponent,
    PortalNavbarComponent,
    HomePageComponent,
    LeaderboardCardComponent,
    SpreadCardComponent,
    BidCardComponent,
    LoginPageComponent,
    HomeComponent,
    LeaderboardPageComponent,
    SpreadPageComponent,
    RulesPageComponent,
    AdminPageComponent,
    BidsPageComponent,
    SettingsPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
