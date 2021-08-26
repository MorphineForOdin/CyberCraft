import React from 'react';
import { useParams } from 'react-router-dom';
import useGetProduct from '../../../api/get_product/get_product';
import Product from '../../../UI/product/Product';

const Category = () => {

  const { id } = useParams();
  const { data: product } = useGetProduct({ categoryId: id });

  return (
    <div className="row justify-content-center m-2">
      {product
        .map(prod => <Product data={prod} key={prod.id}></Product>)}
    </div>
  );
}

export default Category;
