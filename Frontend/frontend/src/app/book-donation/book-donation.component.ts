// ============================================
// 📁 src/app/book-donation/book-donation.component.ts
// ============================================

import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router, ActivatedRoute } from '@angular/router';
import { HeaderComponent } from '../shared/header/header.component';

@Component({
  selector: 'app-book-donation',
  standalone: true,
  imports: [CommonModule, FormsModule, HeaderComponent],
  templateUrl: './book-donation.component.html',
  styleUrls: ['./book-donation.component.css']
})
export class BookDonationComponent implements OnInit {
  cartItems = 0;
  savedItems = 0;
  bookId: string | null = null;
  
  // ✨ SOLO LIBROS DE DONACIÓN - Datos simulados
  book = {
    id: 2,
    title: 'Fundamentos de programación Java',
    author: 'Varios Autores',
    price: 0,
    condition: 'Nuevo',
    donor: 'Ana García López',
    type: 'Donación',
    image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',
    category: 'Ciencias y tecnología',
    pages: 650,
    publishDate: '15/01/23',
    isbn: '9788441539580',
    editorial: 'ANAYA Multimedia',
    transaction: 'Donación',
    synopsis: 'Manual completo para aprender programación en Java desde cero. Incluye conceptos básicos, estructuras de datos, programación orientada a objetos y desarrollo de aplicaciones.',
    details: 'Este libro está diseñado para estudiantes y profesionales que desean dominar Java. Incluye ejercicios prácticos, ejemplos de código y proyectos reales para consolidar el aprendizaje.'
  };

  constructor(private router: Router, private route: ActivatedRoute) {}

  ngOnInit() {
    this.route.paramMap.subscribe(params => {
      this.bookId = params.get('id');
      if (this.bookId) {
        const numericId = parseInt(this.bookId, 10);
        if (isNaN(numericId)) {
          console.error('ID de libro inválido:', this.bookId);
          this.router.navigate(['/home']);
          return;
        }
        this.loadBookDetails(this.bookId);
      } else {
        console.error('No se proporcionó ID de libro');
        this.router.navigate(['/home']);
      }
    });

    this.route.queryParams.subscribe(params => {
      if (params['category']) {
        console.log('Categoría seleccionada desde book-donation:', params['category']);
        this.router.navigate(['/home'], { 
          queryParams: { category: params['category'] },
          replaceUrl: true 
        });
      }
      if (params['search']) {
        console.log('Búsqueda desde book-donation:', params['search']);
        this.router.navigate(['/home'], { 
          queryParams: { search: params['search'] },
          replaceUrl: true 
        });
      }
    });
  }

  loadBookDetails(bookId: string) {
    console.log('Cargando detalles del libro de donación ID:', bookId);
    
    const numericId = parseInt(bookId, 10);
    
    // ✨ SOLO LIBROS DE DONACIÓN - Datos simulados
    const donationBooksData = {
      2: {
        id: 2,
        title: 'Fundamentos de programación Java',
        author: 'Varios Autores',
        price: 0,
        condition: 'Nuevo',
        donor: 'Ana García López',
        type: 'Donación',
        image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=600&fit=crop',
        category: 'Ciencias y tecnología',
        pages: 650,
        publishDate: '15/01/23',
        isbn: '9788441539580',
        editorial: 'ANAYA Multimedia',
        transaction: 'Donación',
        synopsis: 'Manual completo para aprender programación en Java desde cero. Incluye conceptos básicos, estructuras de datos, programación orientada a objetos y desarrollo de aplicaciones.',
        details: 'Este libro está diseñado para estudiantes y profesionales que desean dominar Java. Incluye ejercicios prácticos, ejemplos de código y proyectos reales para consolidar el aprendizaje.'
      },
      8: {
        id: 8,
        title: 'Introducción a Python',
        author: 'Mark Lutz',
        price: 0,
        condition: 'Usado',
        donor: 'Pedro Martínez',
        type: 'Donación',
        image: 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400&h=600&fit=crop',
        category: 'Ciencias y tecnología',
        pages: 720,
        publishDate: '12/08/21',
        isbn: '9781449355739',
        editorial: 'O\'Reilly Media',
        transaction: 'Donación',
        synopsis: 'Guía completa para aprender Python desde cero. Cubre desde conceptos básicos hasta técnicas avanzadas de programación en Python.',
        details: 'Ideal para principiantes y programadores experimentados que quieren aprender Python. Incluye ejemplos prácticos y casos de uso reales.'
      },
      9: {
        id: 9,
        title: 'Matemáticas para Ingeniería',
        author: 'Erwin Kreyszig',
        price: 0,
        condition: 'Usado',
        donor: 'Laura Jiménez',
        type: 'Donación',
        image: 'https://images.unsplash.com/photo-1543002588-bfa74002ed7e?w=400&h=600&fit=crop',
        category: 'Ciencias y tecnología',
        pages: 1280,
        publishDate: '05/09/20',
        isbn: '9786073237932',
        editorial: 'Limusa Wiley',
        transaction: 'Donación',
        synopsis: 'Texto completo de matemáticas avanzadas para estudiantes de ingeniería. Incluye álgebra lineal, cálculo diferencial e integral, y ecuaciones diferenciales.',
        details: 'Reconocido mundialmente como uno de los mejores textos de matemáticas para ingeniería. Contiene teoría, ejemplos resueltos y ejercicios graduados.'
      }
    };

    const bookData = donationBooksData[numericId as keyof typeof donationBooksData];
    if (bookData) {
      this.book = bookData;
    } else {
      console.warn('Libro de donación no encontrado, usando datos por defecto');
    }

    // 🔌 AQUÍ INTEGRAR BACKEND - Solo libros de donación
    // this.donationService.getBookById(bookId).subscribe(...)
  }

  requestBook() {
    console.log('Solicitando libro:', this.book.title);
    this.showSuccessMessage(`Solicitud enviada para "${this.book.title}"`);
    
    // Mostrar modal o formulario de solicitud
    const requestMessage = `¡Hola ${this.book.donor}!\n\nMe interesa solicitar tu libro "${this.book.title}" que has puesto disponible para donación.\n\n¿Podrías confirmar si aún está disponible?\n\nGracias por tu generosidad.`;
    
    const shouldRequest = confirm(`¿Enviar solicitud de donación a ${this.book.donor}?\n\nSe abrirá un chat para coordinar la entrega del libro.`);
    
    if (shouldRequest) {
      // 🔌 AQUÍ INTEGRAR BACKEND - Sistema de solicitudes
      alert(`Solicitud enviada a ${this.book.donor}:\n\n${requestMessage}`);
    }
  }

  toggleSaveBook() {
    const wasLiked = this.isBookSaved();
    this.savedItems = wasLiked ? this.savedItems - 1 : this.savedItems + 1;
    
    const message = wasLiked 
      ? `"${this.book.title}" removido de guardados` 
      : `"${this.book.title}" guardado en favoritos`;
    
    console.log(message);
    this.showSuccessMessage(message);
  }

  isBookSaved(): boolean {
    return this.savedItems > 0;
  }

  goBack() {
    if (window.history.length > 1) {
      window.history.back();
    } else {
      this.router.navigate(['/home']);
    }
  }

  private showSuccessMessage(message: string) {
    console.log('✅', message);
  }

  onSearchPerformed(searchTerm: string) {
    console.log('Búsqueda desde book-donation:', searchTerm);
    this.router.navigate(['/home'], { 
      queryParams: { search: searchTerm },
      replaceUrl: true 
    });
  }
}