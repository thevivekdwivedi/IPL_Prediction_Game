import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SpreadCardComponent } from './spread-card.component';

describe('SpreadCardComponent', () => {
  let component: SpreadCardComponent;
  let fixture: ComponentFixture<SpreadCardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SpreadCardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SpreadCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
