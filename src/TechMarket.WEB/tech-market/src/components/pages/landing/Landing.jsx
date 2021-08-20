import React from 'react'
import ImageSlider from './../../Slider/ImageSlider'
import useGetSliderImages from '../../../api/hooks/getSliderImages'
import PropTypes from 'prop-types'

const Landing = () => {

    let imagesData = useGetSliderImages().sliders.map(x => x.imageUrl);

    return (
        <div>
            <ImageSlider images={imagesData} />
        </div>
    )
};

ImageSlider.propTypes = {
    images: PropTypes.arrayOf(PropTypes.string).isRequired,
};

export default Landing
