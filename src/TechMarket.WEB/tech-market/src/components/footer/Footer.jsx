import React from 'react';
import './../footer/Footer.scss';
import { } from 'react-bootstrap';
import { useGetCategories } from '../../api/get_categories/hooks/get_categories';


const Footer = () => {
    const { data: categories } = useGetCategories();

    return (
        <div className="footer-dark">
            <footer>
                <div className="container">
                    <div className="row">
                        <div className="col-sm-6 col-md-3 item">
                            <h3>Categories</h3>
                            <ul>
                                {categories.length === 0
                                    ? ' '
                                    : categories.filter(parent => parent.parentId === 1)
                                        .map((categ) => <li><a href="#">{categ.name}</a></li>)}
                            </ul>
                        </div>
                        <div className="col-sm-6 col-md-3 item">
                            <h3>About</h3>
                            <ul>
                                <li><a href="#">Company</a></li>
                                <li><a href="#">Team</a></li>
                                <li><a href="#">Careers</a></li>
                            </ul>
                        </div>
                        <div className="col-md-6 item text">
                            <h3>Tech-market</h3>
                            <p>Praesent sed lobortis mi. Suspendisse vel placerat ligula. Vivamus ac sem lacus. Ut vehicula rhoncus elementum. Etiam quis tristique lectus. Aliquam in arcu eget velit pulvinar dictum vel in justo.</p>
                        </div>
                    </div>
                    <p className="copyright">Tech-market © 2021</p>
                </div>
            </footer>
        </div>

    );
}

export default Footer;