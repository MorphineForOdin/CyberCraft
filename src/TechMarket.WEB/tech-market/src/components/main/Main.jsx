import React from 'react';
import {
    BrowserRouter as Router,
    Switch,
    Route
} from "react-router-dom";
import Home from '../pages/home/Home';
import About from '../pages/about/About';
import Not_found from '../pages/not_found/Not_found';
import Product from '../pages/product/Product';
import Category from '../pages/category/Category';
import '../main/Main.scss';

class Main extends React.Component {
    render() {
        return (
            <div className="container-fluid main w-100 h-100">
                <Router>
                    <Switch>
                        <Route exact path="/category/:id" component={Category} />
                        <Route path="/product/:id" children={<Product />} />
                        <Route path="/category" component={Category} />
                        <Route path="/about" component={About} />
                        <Route exact path="/" component={Home} />
                        <Route component={Not_found} />
                    </Switch>
                </Router>
            </div>
        );
    }
}

export default Main;
