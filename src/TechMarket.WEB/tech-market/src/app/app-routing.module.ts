import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [
    { path: 'login', loadChildren: () => import('./pages/login/login.module').then(m => m.LoginModule) },
    { path: 'products', loadChildren: () => import('./pages/products/products.module').then(m => m.ProductsModule) },
    { path: 'cart', loadChildren: () => import('./pages/cart/cart.module').then(m => m.CartModule) },
    { path: '', loadChildren: () => import('./pages/landing/landing.module').then(m => m.LandingModule) }
];

@NgModule({
    imports: [RouterModule.forRoot(routes)],
    exports: [RouterModule]
})
export class AppRoutingModule { }
