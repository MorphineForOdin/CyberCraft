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
                        <Row>
                            <Col sm={12} md={5}>
                                <button type="button" className="btn btn-success w-100">Buy</button>
                            </Col>
                        </Row>

                        <ul className='mt-2'>
                            <h4>Attributes:</h4>
                            <span className='h5'>{attributesList}</span>
                        </ul>
                    </Col>
                    <Col>
                        <div>Description: {prod.description}</div>
                    </Col>
                </Row>
            </Container>
        </div>
    )
}

export default Product
