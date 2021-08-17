import React from 'react';
import './../footer/Footer.scss';
import { } from 'react-bootstrap';
import { NavLink, BrowserRouter } from "react-router-dom";
import { useGetCategories } from '../../api/get_categories/hooks/get_categories';

const Footer = () => {
    const { data: categories } = useGetCategories();

    return (
        <div className="footer_dark p-1 b-0">
            <footer>
                <BrowserRouter>
                    <div className="container">
                        <div className="row">
                            <div className="col-md-3 item d-none d-lg-block">
                                <h3 className="mt-0 mb-2 font-weight-bold">Categories</h3>
                                <ul className="mb-0 p-0">
                                    {categories.length === 0
                                        ? ' '
                                        : categories.filter(parent => parent.parentId === 1)
                                            .map((categ) => <li><NavLink to={categ.name} activeClassName="active" key={categ.id}>{categ.name}</NavLink></li>)}
                                </ul>
                            </div>
                            <div className="col-md-3 item d-none d-lg-block">
                                <h3 className="mt-0 mb-2 font-weight-bold">About</h3>
                                <ul className="p-0">
                                    <li><a href="#">Company</a></li>
                                    <li><a href="#">Team</a></li>
                                    <li><a href="#">Careers</a></li>
                                </ul>
                            </div>
                            <div className="col-sm-12 col-md-6 item text mb-4.5 mb-md-0">
                                <h3 className="mt-0 mb-2 font-weight-bold">Tech-market</h3>
                                <p className="mb-0">Praesent sed lobortis mi.
                                    Suspendisse vel placerat ligula.
                                    Vivamus ac sem lacus. Ut vehicula rhoncus elementum.
                                    Etiam quis tristique lectus.
                                    Aliquam in arcu eget velit pulvinar dictum vel in justo.
                                </p>
                            </div>
                        </div>
                        <p className="copyright text-center pt-4 mb-0">Tech-market © 2021</p>
                    </div>
                </BrowserRouter>
            </footer>
        </div>
    );
}

export default Footer;
