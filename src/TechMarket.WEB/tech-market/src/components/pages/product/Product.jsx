import React from 'react';
import { Container, Col, Row } from 'react-bootstrap';
import { useParams } from "react-router-dom";
import useGetProductById from '../../../api/hooks/useGetProductById';
import './Product.scss';

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
                <Row className='mt-3'>
                    <Col xs={12} md={6}>
                        <h3 className='text-center'>{prod.name}</h3>
                    </Col>
                    <Col xs={6} md={4}>
                        {prod.quantity === 0
                            ? <span className='text-danger border border-danger p-1'>Expected</span>
                            : <span className='text-success border border-success p-1'>In stock</span>}
                    </Col>
                    <Col xs={6} md={2} className='text-end'>
                        <div>ID: {prod.id}</div>
                    </Col>
                    <Col className='d-flex justify-content-center mt-3' xs={12} md={6}>
                        <img width='80%' src={prod.imageUrl} alt='product' />
                    </Col>
                    <Col xs={12} md={6} className='mt-3'>
                        <h4>Price: ${prod.price}</h4>
                        <Row>
                            <Col sm={12} md={5}>
                                <button type="button" className="btn btn-dark w-100">Buy</button>
                            </Col>
                        </Row>
                        <ul className='mt-2'>
                            <h4>Attributes:</h4>
                            <h5>{attributesList}</h5>
                        </ul>
                    </Col>
                    <Col xs={12} className='mt-2'>
                        <div>Description: {prod.description}</div>
                    </Col>
                </Row>
            </Container>
        </div>
    )
}

export default Product
