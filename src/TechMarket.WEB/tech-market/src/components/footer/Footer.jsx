import React from 'react';
import './../footer/Footer.scss';
import { NavLink, BrowserRouter } from "react-router-dom";
import { useGetCategories } from '../../api/get_categories/hooks/get_categories';

const Footer = () => {
    const { data: categories } = useGetCategories();

    return (
        <div className="footer_dark p-3 b-0">
            
            <footer>
                <BrowserRouter>
                    <div className="container">
                        <div className="row">
                            <div className="d-none d-lg-block col-3 item">
                                <h3 className="mt-0 mb-2 font-weight-bold text-left">Categories</h3>
                                <ul className="mb-0 p-0 list-unstyled">
                                    {categories.length === 0
                                        ? ' '
                                        : categories.filter(parent => parent.parentId === 1)
                                            .map((categ) => <li><NavLink to={categ.name} activeClassName="active" key={categ.id}>{categ.name}</NavLink></li>)}
                                </ul>
                            </div>
                            <div className="d-none d-lg-block col-md-3 item">
                                <h3 className="mt-0 mb-2 font-weight-bold text-left">About</h3>
                                <ul className="p-0 list-unstyled">
                                    <li><a href="#">Company</a></li>
                                    <li><a href="#">Team</a></li>
                                    <li><a href="#">Careers</a></li>
                                </ul>
                            </div>
                            <div className="col-12 col-md-6 item text mb-4 mb-md-0">
                                <h3 className="mt-0 mb-2 font-weight-bold text-left">Tech-market</h3>
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
