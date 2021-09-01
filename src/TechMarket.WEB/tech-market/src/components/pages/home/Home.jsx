import React from 'react';
import PropTypes from 'prop-types';
import { Container, Col, Row } from 'react-bootstrap';
import ImageSlider from './../../Slider/ImageSlider';
import useGetSliderImages from './../../../api/hooks/getSliderImages';
import './Home.css';
import useGetProduct from '../../../api/get_product/get_product';
import Product from '../../../UI/product/Product';

const Home = () => {
    const { data : products } = useGetProduct();

    let images = useGetSliderImages().sliders.map(x => x.imageUrl);

    return (
        <div className='mt-2'>
            <ImageSlider images={images} />
            <Container className='mt-3'>
                <Row className='justify-content-between'>
                    <Col sm={12} md={2} lg={3} className='home_col'>
                        <h4 className='text-center'>Title#1</h4>
                        <ul>
                            <li>Lorem</li>
                            <li>Lorem, ipsum dolor.</li>
                            <li>Lorem ipsum dolor sit amet.</li>
                            <li>Lorem ipsum dolor, sit amet consectetur.</li>
                        </ul>
                    </Col >
                    <Col sm={12} md={4} className='home_col'>
                        <h4 className='text-center'>Title#2</h4>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Esse repellendus, animi quaerat corrupti corporis harum eveniet distinctio, laudantium temporibus cumque ea, molestiae sint cum voluptates. Nam possimus assumenda consectetur odio.</p>
                    </Col>
                    <Col sm={12} md={5} lg={4} className='home_col'>
                        <h4 className='text-center'>Title#3</h4>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem veritatis vero minus nesciunt iste animi repellendus pariatur commodi sint, sapiente soluta quaerat exercitationem ea officiis totam esse dolor ipsa, quam ratione porro? Quis neque iste ullam blanditiis labore sint dolorum maxime perspiciatis maiores. Adipisci, quos.</p>
                    </Col>
                </Row>
            </Container>
            <div className="container-fluid">
                <Row className="text-center w-100">
                    <span className="h1 text-dark shadow-sm rounded p-3 my-4">Best Products</span>
                    {products
                        .map(prod => <Col className="col-6 col-md-2" key={prod.id}>
                            <Product data={prod}></Product> </Col>)}
                </Row>
            </div>
        </div>
    );
};

ImageSlider.propTypes = {
    images: PropTypes.arrayOf(PropTypes.string).isRequired,
};

export default Home;
