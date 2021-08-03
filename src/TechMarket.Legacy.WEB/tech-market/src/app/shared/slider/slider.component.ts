import { Component, Input, OnInit } from '@angular/core';
import { SliderImage } from 'src/app/models';

@Component({
    selector: 'tm-slider',
    templateUrl: './slider.component.html',
    styleUrls: ['./slider.component.scss']
})
export class SliderComponent {

    @Input() images: SliderImage[] = <SliderImage[]>[];

    i: number = 0;

    getSlide() {
        return this.images[this.i].imageUrl;
    }

    getSlideLink() {
        return this.images[this.i].linkUrl;
    }

    getPrev() {
        this.i = this.i === 0 ? 0 : this.i - 1;
    }

    getNext() {
        this.i = this.i === this.images.length - 1 ? this.i : this.i + 1;
    }
}
