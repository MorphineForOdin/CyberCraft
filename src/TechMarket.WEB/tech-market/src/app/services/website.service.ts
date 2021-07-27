import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { GetSliderImagesResponse, SliderImage } from '../models';

@Injectable({
    providedIn: 'root'
})
export class WebsiteService {

    constructor(private _httpClient: HttpClient) { }

    getSliderImages(): Observable<SliderImage[]> {
        return this._httpClient
            .get<GetSliderImagesResponse>(`https://localhost:5001/api/website/sliders`)
            .pipe(map(response => response.sliderImages));
    }
}
