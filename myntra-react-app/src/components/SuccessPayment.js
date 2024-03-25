import React from "react";
import "./SuccessPayment.css";
import Navbar from "./Navbar";
import Footer from "./Footer";

function PaymentSuccess() {
  return (
    <>
    <Navbar/>
    <div className="successpayment-container">
      <h2>Payment Successful!</h2>
      <p>Your payment has been processed successfully.</p>
      <p>Thank you for your purchase!</p>
    </div>
    <Footer/>
    </>
  );
}

export default PaymentSuccess;
