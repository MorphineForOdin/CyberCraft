import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models';
import { UsersService } from 'src/app/services';

@Component({
    selector: 'tm-landing',
    templateUrl: './landing.component.html',
    styleUrls: ['./landing.component.scss']
})
export class LandingComponent implements OnInit {

    users: User[] = <User[]>[];

    constructor(private _usersService: UsersService) { }

    ngOnInit(): void {
        this._usersService
            .getAll()
            .subscribe(users => this.users = users);
    }
}
