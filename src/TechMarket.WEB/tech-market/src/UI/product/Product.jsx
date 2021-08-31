import React, { useState } from "react";
import { useHistory } from "react-router-dom";
import './Product.scss';

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
          <div>
            <h6 className="m-2">{product.name}</h6>
          </div>
          <div>{product.quantity === 0 ?
            <span className="text-danger">Expected</span> : <span className="text-success">In stock</span>}
          </div>
          <div className="my-2">
            <span>{product.price} $</span>
          </div>
        </div>

        <div className="col-12 mb-4">
          <div className="row g-1">
            <div className="col-6">
              <button type="button"
                className="btn btn-dark btn-sm rounded w-100"
                disabled={product.quantity === 0} onClick={() => history.push("/cart")}>
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
