import React from 'react';
import { Container, Col, Row } from 'react-bootstrap';
import { useParams } from "react-router-dom";
import useGetProductById from '../../../api/hooks/useGetProductById';
import './Product.css';

const Product = () => {

    let { id } = useParams();
    let prod = useGetProductById({ id }).product;

    const attributesList = prod?.attributes
        ?.map((attributes) =>
            <li key={attributes.id}>{attributes.name}:
                {attributes.values.map(values => values.value)}</li>)

    return (
        <div>
            <Container>
                <Row>
                    <Col className='d-flex justify-content-center' sm={12} md={6}>
                        <img width='80%' src={prod.imageUrl} alt='product' />
                    </Col>
                    <Col sm={12} md={6}>
                        <h3 className='mt-3'>{prod.name}</h3>
                        <h4>Price: ${prod.price}</h4>
                        <button type="button" className="col-12 col-md-5 btn btn-success ">Buy</button>
                        <ul className='h5 mt-2'>
                            <h4>Attributes:</h4>
                            {attributesList}
                        </ul>
                    </Col>
                </Row>
                <Row>
                    <Col>
                        <div>Description: {prod.description}</div>
                    </Col>
                </Row>
            </Container>
        </div>
    )
}

export default Product
