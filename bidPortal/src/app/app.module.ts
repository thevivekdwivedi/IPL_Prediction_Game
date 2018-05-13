import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { PortalNavComponent } from "./portal-nav/portal-nav.component";
import { PortalFooterComponent } from './portal-footer/portal-footer.component';
import { HomePageComponent } from './home-page/home-page.component';
import { LeaderboardPageComponent } from './leaderboard-page/leaderboard-page.component';
import { SpreadPageComponent } from './spread-page/spread-page.component';
import { SettingsPageComponent } from './settings-page/settings-page.component';
import { LoginPageComponent } from './login-page/login-page.component';
import { AdministrationPageComponent } from './administration-page/administration-page.component';
import { BidCardComponent } from "./home-page/bid-card/bid-card.component";
import { LeaderboardCardComponent } from './home-page/leaderboard-card/leaderboard-card.component';
import { SpreadCardComponent } from './home-page/spread-card/spread-card.component';
import { AppRoutingModule } from './app-routing/app-routing.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { LayoutModule } from '@angular/cdk/layout';
import { MatToolbarModule, MatButtonModule, MatSidenavModule, MatIconModule, MatListModule, MatGridListModule, MatCardModule, MatMenuModule } from '@angular/material';
import { DashboardPageComponent } from './dashboard-page/dashboard-page.component';

@NgModule({
  declarations: [
    AppComponent,
    PortalFooterComponent,
    HomePageComponent,
    LeaderboardPageComponent,
    SpreadPageComponent,
    SettingsPageComponent,
    LoginPageComponent,
    AdministrationPageComponent,
    BidCardComponent,
    LeaderboardCardComponent,
    SpreadCardComponent,
    PortalNavComponent,
    DashboardPageComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    LayoutModule,
    MatToolbarModule,
    MatButtonModule,
    MatSidenavModule,
    MatIconModule,
    MatListModule,
    MatGridListModule,
    MatCardModule,
    MatMenuModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
