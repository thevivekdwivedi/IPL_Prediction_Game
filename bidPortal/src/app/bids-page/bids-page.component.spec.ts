import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BidsPageComponent } from './bids-page.component';

describe('BidsPageComponent', () => {
  let component: BidsPageComponent;
  let fixture: ComponentFixture<BidsPageComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BidsPageComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BidsPageComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
