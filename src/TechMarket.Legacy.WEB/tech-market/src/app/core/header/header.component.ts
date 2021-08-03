import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import {LoginComponent} from '../../pages/login/login.component'

@Component({
    selector: 'tm-header',
    templateUrl: './header.component.html',
    styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

    menuOpened: boolean = true;
    authenticated: boolean = false;

    constructor( private authService: AuthService, private loginComponent: LoginComponent) {
        this.authService.
    }

    ngOnInit(): void {
        if (!this.authService.isLoggedIn)
        {
            this.authenticated=false;
        }
        else
        {
            this.authenticated=true;
        }
    }

    burgerClick() {
        this.menuOpened = !this.menuOpened;
    }

}
