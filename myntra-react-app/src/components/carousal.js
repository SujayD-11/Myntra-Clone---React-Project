import React from "react";
// import {Carousal} from 'react-bootstrap';
import car from './images/carousaldemo.jpg';
import car1 from './images/carousal1.jpg';
import banner3 from './images/banner3.jpg';
import car2 from './images/carousal2.jpg';
import car3 from './images/carousal3.jpg';
import './carousal.css';

function Caro(){
    return (
        <div id="carouselExampleSlidesOnly" className="carousel slide" data-bs-ride="carousel" data-bs-interval="1200">
          <div className="carousel-inner">
            <div className="carousel-item active">
              <img src={car} className="d-block w-100" alt="..." />
            </div>
            <div className="carousel-item">
              <img src={banner3} className="d-block w-100" alt="..." />
            </div>
            <div className="carousel-item">
              <img src={car1} className="d-block w-100" alt="..." />
            </div>
            <div className="carousel-item">
              <img src={car2} className="d-block w-100" alt="..." />
            </div>
            <div className="carousel-item">
              <img src={car3} className="d-block w-100" alt="..." />
            </div>

            {/* <div className="carousel-item active">
              <img src={car} className="d-block w-100" alt="..." />
            </div> */}
          </div>
        </div>
      );
}
export default Caro;