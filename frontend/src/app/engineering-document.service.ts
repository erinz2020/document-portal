import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { EngineeringDocument } from './engineering-document.model';

@Injectable({
  providedIn: 'root'
})
export class EngineeringDocumentService {
  constructor(private readonly http: HttpClient) {}

  getDesignCriteria(): Observable<EngineeringDocument[]> {
    return this.http.get<EngineeringDocument[]>('/api/engineering-documents/design-criteria');
  }
}
