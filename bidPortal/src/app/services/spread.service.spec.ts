import { TestBed, inject } from '@angular/core/testing';

import { SpreadService } from './spread.service';

describe('SpreadService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [SpreadService]
    });
  });

  it('should be created', inject([SpreadService], (service: SpreadService) => {
    expect(service).toBeTruthy();
  }));
});
