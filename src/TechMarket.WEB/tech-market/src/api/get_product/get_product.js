import axios from "axios";
import {
  useState,
  useEffect
} from "react";

const {
  REACT_APP_API_URL
} = process.env;

export const useGetProduct = ({
  skip,
  take,
  categoryId
} = {}) => {
  const [data, setData] = useState([]);

  useEffect(() => {
    const fetchdata = async () => {
      axios.get(
          `${REACT_APP_API_URL}/products?` +
          (skip ? `skip=${skip}&` : '') +
          (take ? `take=${take}&` : '') +
          (categoryId ? `categoryId=${categoryId}` : ''))
        .then(response => setData(response.data.products))
        .catch((error) => error)
    };
    fetchdata();
  }, [skip, take, categoryId]);
  return {
    data
  };
}

export default useGetProduct;