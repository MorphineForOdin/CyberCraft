import React, { Component } from "react";
import { Slide } from "react-slideshow-image";
import axios from "axios";
import "./Slider.css";
import "react-slideshow-image/dist/styles.css";

class Slider extends Component {
    constructor() {
        super();
        this.slideRef = React.createRef();
        this.back = this.back.bind(this);
        this.next = this.next.bind(this);
        this.state = {
            current: 0,
            sliders: []
        };
    }

    back() {
        this.slideRef.current.goBack();
    }

    next() {
        this.slideRef.current.goNext();
    }    

    componentDidMount() {
        axios.get('https://localhost:5001/api/website/sliders').then(res => {
            this.setState({ sliders: res.data.sliderImages });

        });
    }    

    render() {
        const properties = {
            duration: 4000,
            autoplay: true,
            transitionDuration: 500,
            arrows: true,
            infinite: true,
            easing: "ease",
            indicators: () => <div className="indicator"></div>
        };

        return (
            <div className="slide-container">
                <Slide ref={this.slideRef} {...properties}>
                    {this.state.sliders.map((sliderImages) => (
                        <div
                            style={{
                                backgroundImage: `url(${sliderImages.imageUrl})`,
                                backgroundPosition: 'center',
                                backgroundSize: 'cover'
                            }}
                            key={sliderImages.id} className="each-slide"
                        >
                        </div>
                    ))}
                </Slide>
            </div>
        );
    }
}

export default Slider;
