import { useState, useEffect } from 'react';
import axios from 'axios';

const { REACT_APP_API_URL } = process.env

const useGetProductById = ({ id }) => {

    const [product, setProduct] = useState([]);

    useEffect(() => {
        const fetchProduct = () => {
            axios.get(`${REACT_APP_API_URL}/products/${id}`)
                .then(res => setProduct(res.data.product))
        };
        fetchProduct();
    }, [id]);
    return { product };
}

export default useGetProductById
