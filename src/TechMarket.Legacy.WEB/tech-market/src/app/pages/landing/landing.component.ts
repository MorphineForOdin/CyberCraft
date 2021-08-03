import { Component, OnInit } from '@angular/core';
import { SliderImage } from 'src/app/models';
import { WebsiteService } from 'src/app/services';

@Component({
    selector: 'tm-landing',
    templateUrl: './landing.component.html',
    styleUrls: ['./landing.component.scss']
})
export class LandingComponent implements OnInit {

    sliderImages: SliderImage[] = <SliderImage[]>[];

    constructor(private _websiteService: WebsiteService) { }

    ngOnInit(): void {
        this._websiteService
            .getSliderImages()
            .subscribe(images => this.sliderImages = images);
    }
}
