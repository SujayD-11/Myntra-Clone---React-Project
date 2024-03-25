import React from "react";
import './Banner.css';
function Footer(){
    return(
        <>
        <div className="footer-wrapper">
            <footer className="footer">
                <div className="footer-content">
                    <div className="footer-section">
                        <h3>Follow Us</h3>
                        <ul>
                            <li><a href="/">Facebook</a></li>
                            <li><a href="/">Twitter</a></li>
                            <li><a href="/">Instagram</a></li>
                        </ul>
                    </div>
                    <div className="footer-section">
                        <h3>Company</h3>
                        <ul>
                            <li><a href="/">About Us</a></li>
                            <li><a href="/">Contact Us</a></li>
                            <li><a href="/">Privacy Policy</a></li>
                        </ul>
                    </div>
                </div>
                <div className="footer-bottom">
                    <p>&copy; 2024 Myntra Clone. All rights reserved.</p>
                </div>
            </footer>
        </div>
        </>
    );
}
export default Footer;