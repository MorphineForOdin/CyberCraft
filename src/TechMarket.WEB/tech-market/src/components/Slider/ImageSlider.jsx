import React, { useState } from 'react'
import "./ImageSlider.css"

const ImageSlider = ({ images }) => {

    const [current, setCurrent] = useState(0);
    const length = images.length;
    
    const getNext = () => {
        setCurrent(current === length - 1 ? 0 : current + 1);
    };

    const getPrev = () => {
        setCurrent(current === 0 ? length - 1 : current - 1);
    };

    return (
        <div className="slide_container" style={{
            backgroundImage: `url(${images[current]})`
        }}>
            <div className='buttons' onClick={getPrev}>PREV</div>
            <div className='buttons' onClick={getNext}>NEXT</div>
        </div>
    );
}

export default ImageSlider
