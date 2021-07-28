import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Auth } from '../models';

@Injectable({
    providedIn: 'root'
})

export class AuthService {

    constructor(private http: HttpClient) { }

    login(email: string, password: string): Observable<any> {
        return this.http.post('https://localhost:5001/api/auth/login',
            <Auth>{
                email: email,
                password: password
            });
    }

    isLoggedIn()
    {
        return false
    }
}
