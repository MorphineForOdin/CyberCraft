import React, { useState } from "react";
import './Product.scss';
import { useHistory } from "react-router-dom";

const Product = (props) => {

  const [product, useData] = useState(props.data);
  const history = useHistory();

  return (
    <div className="row justify-content-center w-25 m-3">
      <div className="col-5"><a href="/products/"><img src={product.imageUrl} className="col-12 product_img width-100 height-50"></img></a></div>
      <div className="product_body text-center">
        <h5 className="my-1">{product.name}</h5>
        {product.quantity === null ? <p style={{ color: "red" }}>Expected</p> : <p style={{ color: "green" }}>In stock</p>}
        <p>{product.price} $</p>
        <button type="button" className="col-md-4 btn btn-dark rounded mx-1 my-1 p-1" disabled={product.quantity === null ? true : false} onClick={() => history.push("/cart")}>Buy</button>
        <button type="button" className="col-md-4 btn btn-dark rounded p-1" onClick={() => history.push("/")}>More</button>
      </div>
    </div>
  )
}

export default Product;