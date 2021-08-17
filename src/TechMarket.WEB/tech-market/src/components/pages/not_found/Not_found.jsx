import React from 'react';
import '../not_found/Not_found.scss';
import { Button } from 'react-bootstrap';

const Not_found = () => {
    return (
        <section className="page_404">
            <div className="text_center ">
                <h1 className="mt-3">404</h1>
            </div>
            <div className="four_zero_four_bg"></div>
            <div className="contant_box_404 mt-n5">
                <h3 className="h2"> Look like you're lost</h3>
                <p>the page you are looking for not avaible!</p>
                <a href="/"><Button variant="outline-secondary">Go home</Button>{' '}</a>
            </div>
        </section>
    );
}

export default Not_found;
