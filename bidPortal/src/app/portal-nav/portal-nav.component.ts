import { Component } from '@angular/core';
import { BreakpointObserver, Breakpoints, BreakpointState } from '@angular/cdk/layout';
import { Observable } from 'rxjs';

//component imports
import { Page } from "../models/page";

//services imports
import { PagesService } from "../services/pages.service";

@Component({
  selector: 'portal-nav',
  templateUrl: './portal-nav.component.html',
  styleUrls: ['./portal-nav.component.css']
})
export class PortalNavComponent {
  title: string = 'IPL Prediction League';
  isHandset: Observable<BreakpointState> = this.breakpointObserver.observe(Breakpoints.Handset);
  constructor(private breakpointObserver: BreakpointObserver, private pagesService: PagesService) { }

  getPages(): Page[] {
    return this.pagesService.getPages();
  }
}
