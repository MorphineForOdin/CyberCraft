import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'tm-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

    menuOpened: boolean = true;
    authenticated: boolean = true;

    constructor() { }

    ngOnInit(): void { }

    testAuth() {
        this.authenticated = !this.authenticated
    }

    burgerClick() {
        this.menuOpened = !this.menuOpened;
    }
}
