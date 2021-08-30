import React from 'react';
import { useParams } from 'react-router-dom';
import useGetProduct from '../../../api/get_product/get_product';
import Product from '../../../UI/product/Product';

const Category = () => {

  const { id } = useParams();
  const { data: product } = useGetProduct({ categoryId: id });

  return (
    <div className="container-fluid">
      <div className="row justify-content-center w-100 m-3">
        {product
          .map(prod => <div className="col-8 col-md-2" key={prod.id}>
            <Product data={prod}></Product> </div>)}
      </div>
    </div>
  );
}

export default Category;
