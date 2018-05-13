import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

//importing all the components
import { AdministrationPageComponent } from "../administration-page/administration-page.component";
import { HomePageComponent } from "../home-page/home-page.component";
import { LeaderboardPageComponent } from "../leaderboard-page/leaderboard-page.component";
import { LoginPageComponent } from "../login-page/login-page.component";
import { SettingsPageComponent } from "../settings-page/settings-page.component";
import { SpreadPageComponent } from "../spread-page/spread-page.component";
import { DashboardPageComponent } from "../dashboard-page/dashboard-page.component";

//setting up the routes
const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'admin',
    component: AdministrationPageComponent
  },
  {
    path: 'home',
    component: DashboardPageComponent
  },
  {
    path: 'leaderboard',
    component: LeaderboardPageComponent
  },
  {
    path: 'login',
    component: LoginPageComponent
  },
  {
    path: 'settings',
    component: SettingsPageComponent
  },
  {
    path: 'spread',
    component: SpreadPageComponent
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes)
  ],
  declarations: [],
  exports: [RouterModule]
})
export class AppRoutingModule { }
