import React from 'react';
import Home from '../pages/home/Home';
import About from '../pages/about/About';
import Not_found from '../pages/not_found/Not_found';
import Product from '../../UI/product/Product';
import Category from '../pages/category/Category';
import {
    BrowserRouter as Router,
    Switch,
    Route
} from "react-router-dom";

class Main extends React.Component {
    render() {
        return (
            <div className='main w-100 h-100'>
                <Router>
                    <Switch>
                        <Route exact path="/category/:name" component={Category} />
                        <Route path="/about" component={About} />
                        <Route path="/product" component={Product} />
                        <Route exact path="/" component={Home} />
                        <Route component={Not_found} />
                    </Switch>
                </Router>
            </div>
        );
    }
}

export default Main;
