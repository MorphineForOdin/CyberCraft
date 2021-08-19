import React from 'react';
import '../not_found/Not_found.scss';

const Not_found = () => {
    return (
        <div className="container">
            <div className="row">
                <div className="col-12 text-center">
                    <h1 className="my-3">404</h1>
                </div>
                <div className="col-12 four_zero_four_bg" ></div>
                <div className="col-12 text-center contant_box_404">
                    <h3 className="h2"> Look like you're lost</h3>
                    <p>the page you are looking for not avaible!</p>
                    <div className="row justify-content-center ">
                        <div className="col-3 col-md-2">
                            <a href="/" className="btn btnNotFound border border-dark text-dark w-100 p-2" role="button">Go home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Not_found;
