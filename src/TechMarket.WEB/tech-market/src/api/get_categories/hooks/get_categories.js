import axios from "axios";
import { useState, useEffect } from "react";


 export const useGetCategories = () => 
 {
    const [data, setData] = useState ([]);

    useEffect ( () => 
    {
        const fetchData = async () => {
             axios.get('https://localhost:44318/api/products/categories')
            .then (respon => setData(respon.data.categories))
            .catch((err) => console.log(err))
        };
        fetchData();
    },[]);
return { data };
}
       
export default useGetCategories;