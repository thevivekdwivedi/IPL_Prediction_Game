import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Observable, of } from 'rxjs';

import { User } from "./models/userModel";

@Injectable()
export class UserServiceService {
  user: User;

  constructor(private http: HttpClient) { }

  login(): void {
    
  }

  setUser(user: User): void {
    this.user = user;
  }

  isLoggedIn(): boolean {
    return true;
  }

  isAdmin(): boolean {
    return false;
  }

  getUser(): Observable<User> {
    return null;
  }

}
