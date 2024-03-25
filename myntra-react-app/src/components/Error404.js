// NotFound.js
import React from "react";
import "./Error404.css";
import Logo from './images/logo.png';

function NotFound() {
  return (
    <div className="error404-container">
      <img src={Logo} alt="Myntra Logo" className="logo" />
      <h2>-404-</h2>
    
      <h3>Page Not Found</h3>
      
      <p>We're sorry, the page you are looking for does not exist.</p>
    </div>
  );
}

export default NotFound;
