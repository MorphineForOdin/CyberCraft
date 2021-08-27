import React from 'react';
import './../footer/Footer.scss';
import { useGetCategories } from '../../api/get_categories/hooks/get_categories';

const Footer = () => {
    const { data: categories } = useGetCategories();

    return (
        <div className="footer_dark p-2">
            <footer>
                <div className="container">
                    <div className="row">
                        <div className="col-3 d-none d-lg-block">
                            <h3 className="font-weight-bold text-left mt-0 mb-2">Categories</h3>
                            <ul className="list-unstyled mb-0 p-0">
                                {categories.length === 0
                                    ? ''
                                    : categories.filter(parent => parent.parentId === 1)
                                        .map((categ) => <li key={categ.id}><a className="categories_navlink text-decoration-none" href={`/category/${categ.id}`}>{categ.name}</a></li>)}
                            </ul>
                        </div>
                        
                        <div className="col-3 d-none d-lg-block">
                            <h3 className="font-weight-bold text-left mt-0 mb-2">About</h3>
                            <ul className="list-unstyled p-0 ">
                                <li><a className="about_link text-decoration-none" href="/">Company</a></li>
                                <li><a className="about_link text-decoration-none" href="/">Team</a></li>
                                <li><a className="about_link text-decoration-none " href="/">Careers</a></li>
                            </ul>
                        </div>

                        <div className="col-12 col-md-6 text mb-4 mb-md-0">
                            <h3 className="font-weight-bold text-left mt-0 mb-2 ">Tech-market</h3>
                            <p className="mb-0 opacity-75">Praesent sed lobortis mi.
                                Suspendisse vel placerat ligula.
                                Vivamus ac sem lacus. Ut vehicula rhoncus elementum.
                                Etiam quis tristique lectus.
                                Aliquam in arcu eget velit pulvinar dictum vel in justo.
                            </p>
                        </div>
                    </div>
                    <p className="copyright text-center pt-1 mb-0 opacity-50">Tech-market © 2021</p>
                </div>
            </footer>
        </div>
    );
}

export default Footer;
