import React, { useEffect, useState } from "react";
import './Payment.css';
import card from '../images/cardsimages.png';
import Navbar from './Navbar';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { CartdataServiceObj } from '../services/Cartdata.service';

 
function Payment() {

  const [cartArray, setCartArray] = useState([]);
 
    useEffect(() => {
      //CartdataServiceObj.deleteAllProducts();
      //   CartdataServiceObj.getAllProducts()
      //       .then((res) => {
      //           setCartArray(res.data);
      //       })
      //       .catch((error) => {
      //           console.error("Error fetching data:", error);
      //       });
      //  try {
      //         cartArray.forEach(item => {
      //           CartdataServiceObj.deleteProduct(item.prod_no).then((resData) => {
                  
      //         });
      //         })
      //       }
      //        catch (error) {
      //         console.log(error);
      //       }
    }, []);

    
      useEffect(() =>{
    
        
  
    }, []);
  

  return (
    <>
    <Navbar/>
    <div className="page-container">
      <div className="payment-container">
        <form>
          <div className="row">
            <div className="col">
              <h3 className="title">Billing Address</h3>
              <div className="inputBox">
                <span>Full Name:</span>
                <input type="text" placeholder="John Doe" />
              </div>
              <div className="inputBox">
                <span>Email:</span>
                <input type="email" placeholder="john@example.com" />
              </div>
              <div className="inputBox">
                <span>Address:</span>
                <input type="text" placeholder="123 Main St" />
              </div>
              <div className="inputBox">
                <span>City:</span>
                <input type="text" placeholder="Anytown" />
              </div>
              <div className="flexbox">
                <div className="inputBox">
                  <span>State:</span>
                  <input type="text" placeholder="State" />
                </div>
                <div className="inputBox">
                  <span>Zip Code:</span>
                  <input type="text" placeholder="12345" />
                </div>
              </div>
            </div>
            <div className="col">
              <h3 className="title">Payment Details</h3>
              <div className="inputBox">
                <span>Cards Accepted:</span>
                <img src={card} height="45" className="card-container" alt="Accepted Cards" />
              </div>
              <div className="inputBox">
                <span>Name on Card:</span>
                <input type="text" placeholder="John Doe" />
              </div>
              <div className="inputBox">
                <span>Credit Card Number:</span>
                <input type="text" placeholder="1234 5678 9012 3456" />
              </div>
              <div className="flexbox">
                <div className="inputBox">
                  <span>Expiry Month:</span>
                  <input type="text" placeholder="MM" />
                </div>
                <div className="inputBox">
                  <span>Expiry Year:</span>
                  <input type="text" placeholder="YY" />
                </div>
                <div className="inputBox">
                  <span>CVV:</span>
                  <input type="text" placeholder="123" />
                </div>
              </div>
            </div>
          </div>
          <Link style={{textDecoration:"none"}} to="/PaymentSuccess"><button className="Submit-btn" >Proceed to Payment</button></Link>
        </form>
      </div>
    </div>
    </>
  );
}
 
export default Payment;
