import { Injectable } from '@angular/core';

import { Page } from "../models/page";
import { Pages } from "../dataConstants/pages";

@Injectable({
  providedIn: 'root'
})
export class PagesService {

  constructor() { }

  getPages(): Page[] {
    return Pages;
  }
}
