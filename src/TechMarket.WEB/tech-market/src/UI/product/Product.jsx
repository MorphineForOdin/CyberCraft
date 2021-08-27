import React, { useState } from "react";
import './Product.scss';
import { useHistory } from "react-router-dom";

const Product = (props) => {

  const [product] = useState(props.data);
  const history = useHistory();

  return (
    <div className="p-1">
      <div className="row text-center bg-light">
        <div className="col-12"><a href={`/product/${product.id}`}><img src={product.imageUrl} className="col-10 product_img py-2" alt={product.name}></img></a></div>
        <div className="text-center">
          <h6 className="my-3">{product.name}</h6>
          {product.quantity === 0 ? <p style={{ color: "red" }}>Expected</p> : <p style={{ color: "green" }}>In stock</p>}
          <p>{product.price} $</p>
          <button type="button" className="col-4 col-md-5 btn btn-dark rounded m-1 p-1" disabled={product.quantity === 0 ? true : false} onClick={() => history.push("/cart")}>Buy</button>
          <button type="button" className="col-4 col-md-5 btn btn-dark rounded m-1 p-1" onClick={() => history.push(`/product/${product.id}`)}>More</button>
        </div>
      </div>
    </div>
  )
}

export default Product;
