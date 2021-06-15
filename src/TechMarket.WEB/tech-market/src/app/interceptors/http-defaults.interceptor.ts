import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpRequest, HttpHandler, HttpEvent } from '@angular/common/http';

import { Observable } from 'rxjs';

@Injectable()
export class HttpDefaultsInterceptor implements HttpInterceptor {

    intercept(request: HttpRequest<any>, nextHandler: HttpHandler): Observable<HttpEvent<any>> {
        const requestWithAuthCookies = request.clone({ withCredentials: true });
        return nextHandler.handle(requestWithAuthCookies);
    }
}
