import React, { useState } from "react";
import { useHistory } from "react-router-dom";

const Product = (props) => {

  const [product] = useState(props.data);
  const history = useHistory();

  return (
    <div className="p-1">

      <div className="row bg-light">

        <div className="col-12 text-center">
          <a href={`/product/${product.id}`}>
            <img src={product.imageUrl} className="w-75 py-2" alt={product.name} />
          </a>
        </div>

        <div className="col-12 text-center">
          <div className="row">
            <div className="col-12">
              <h6 className="m-2">{product.name}</h6>
            </div>
            <div className="col-12">{product.quantity === 0 ?
              <p style={{ color: "red" }}>Expected</p> : <p style={{ color: "green" }}>In stock</p>}
            </div>
            <div className="col-12">
              <p>{product.price} $</p>
            </div>
          </div>
        </div>

        <div className="col-12 mb-4">
          <div className="row g-1">
            <div className="col-6">
              <button type="button"
                className="btn btn-dark btn-sm rounded w-100"
                disabled={product.quantity === 0 ? true : false} onClick={() => history.push("/cart")}>
                Buy
              </button>
            </div>
            <div className="col-6">
              <button type="button"
                className="btn btn-dark btn-sm rounded w-100"
                onClick={() => history.push(`/product/${product.id}`)}>
                More
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default Product;
