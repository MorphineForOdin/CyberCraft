import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'tm-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

    menuOpened: boolean = true;
    authenticated: boolean = false;

    constructor() { }

    ngOnInit(): void { }

    burgerClick() {
        this.menuOpened = !this.menuOpened;
    }
}
