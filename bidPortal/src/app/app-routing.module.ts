import { NgModule } from '@angular/core';
import { RouterModule, Router, Routes } from "@angular/router";

import { HomePageComponent } from "./home-page/home-page.component";
import { AdminPageComponent } from "./admin-page/admin-page.component";
import { LeaderboardPageComponent } from "./leaderboard-page/leaderboard-page.component";
import { SpreadPageComponent } from "./spread-page/spread-page.component";
import { RulesPageComponent } from "./rules-page/rules-page.component";
import { LoginPageComponent } from "./login-page/login-page.component";
import { SettingsPageComponent } from "./settings-page/settings-page.component";

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: 'home',
    component: HomePageComponent
  },
  {
    path: 'admin',
    component: AdminPageComponent
  },
  {
    path: 'leaderboard',
    component: LeaderboardPageComponent
  },
  {
    path: 'spread',
    component: SpreadPageComponent
  },
  {
    path: 'rules',
    component: RulesPageComponent
  },
  {
    path: 'login',
    component: LoginPageComponent
  },
  {
    path: 'settings',
    component: SettingsPageComponent
  }
]
@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [RouterModule]
})
export class AppRoutingModule { }
