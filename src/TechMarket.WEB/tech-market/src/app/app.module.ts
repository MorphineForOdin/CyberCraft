import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { CoreModule } from './core/core.module';
import { LandingModule } from './pages/landing/landing.module';
import { LoginModule } from './pages/login/login.module';

@NgModule({
    declarations: [
        AppComponent
    ],
    imports: [
        BrowserModule,
        AppRoutingModule,
        CoreModule,
        LandingModule,
        LoginModule,
        HttpClientModule,
    ],
    providers: [],
    bootstrap: [
        AppComponent
    ]
})
export class AppModule { }
