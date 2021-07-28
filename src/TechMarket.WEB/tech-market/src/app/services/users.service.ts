import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { GetUsersResponse, User } from '../models';

const API_URL = 'https://localhost:5001/api/';

@Injectable({
    providedIn: 'root'
})
export class UsersService {

    constructor(private _httpClient: HttpClient) { }

    getAll(): Observable<User[]> {
        return this._httpClient
            .get<GetUsersResponse>(`https://localhost:5001/api/users`)
            .pipe(map(response => response.users));
    }

    getPublicContent(): Observable<any> {
        return this._httpClient.get(API_URL + 'all', { responseType: 'text' });
      }
}
