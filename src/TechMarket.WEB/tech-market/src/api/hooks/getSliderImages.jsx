import axios from "axios";
import { useState, useEffect } from "react";

const { REACT_APP_API_URL } = process.env

export const useGetSliderImages = () => {

    const [sliders, setSliders] = useState([]);

    useEffect(() => {
        const fetchSliders = () => {
            axios.get(`${REACT_APP_API_URL}/website/sliders`)
                .then(res => setSliders(res.data.sliderImages))
        };
        fetchSliders();
    }, []);
    return { sliders };
}

export default useGetSliderImages
