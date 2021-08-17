import axios from "axios";
import { useState, useEffect } from "react";

const { REACT_APP_API_URL } = process.env

 export const useGetCategories = () => 
 {
    const [data, setData] = useState ([]);

    useEffect ( () => 
    {
        const fetchData = async () => {
             axios.get(`${REACT_APP_API_URL}/products/categories`)
                    .then (respon => setData(respon.data.categories))
                    .catch((err) => console.log(err))
        };
        fetchData();
    }, [] );
return { data };
}
       
export default useGetCategories;
