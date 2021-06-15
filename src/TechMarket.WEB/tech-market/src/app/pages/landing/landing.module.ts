import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LandingComponent } from './landing.component';
import { UsersService } from 'src/app/services';
import { LandingRoutingModule } from './landing-routing.module';

@NgModule({
    declarations: [
        LandingComponent
    ],
    imports: [
        CommonModule,
        LandingRoutingModule
    ],
    providers: [
      UsersService
    ]
})
export class LandingModule { }
