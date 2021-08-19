import React from 'react';
import '../not_found/Not_found.scss';

const Not_found = () => {
    return (
        <div className="container">
            <div className="row justify-content-center">
                <div className="col-12 text-center">
                    <h1 className="my-3">404</h1>
                </div>
                <div className="col-12 four_zero_four_bg" ></div>
                <div className="col-12 text-center mt-n5 contant_box_404">
                    <h3 className="h2"> Look like you're lost</h3>
                    <p>the page you are looking for not avaible!</p>
                    <div className="row justify-content-center ">
                        <div className="col-3 col-xl-1 button border border-dark text-center">
                            <a href="/" className="text-decoration-none text-dark p-2" >Go home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
}

export default Not_found;
