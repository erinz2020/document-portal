import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';
import { EngineeringDocument } from './engineering-document.model';
import { EngineeringDocumentService } from './engineering-document.service';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  documents: EngineeringDocument[] = [];
  error = '';
  loading = false;

  constructor(private readonly engineeringDocumentService: EngineeringDocumentService) {}

  loadDocuments(): void {
    this.loading = true;
    this.error = '';
    this.documents = [];

    this.engineeringDocumentService
      .getDesignCriteria()
      .subscribe({
        next: (documents) => {
          this.documents = documents;
          this.loading = false;
        },
        error: () => {
          this.error = 'Could not load engineering documents. Check the backend and database connection.';
          this.loading = false;
        }
      });
  }
}
