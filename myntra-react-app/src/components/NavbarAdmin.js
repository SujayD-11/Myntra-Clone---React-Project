import React from "react";
import './Navbar.css';
import logo from './images/logo.png';
import lens from './images/lens.png';
import account from './images/account.png';
import wishlist from './images/wishlist.png';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

function NavbarAdmin(){
    const loginLogout = () => {
        if (sessionStorage.getItem('user-token') == null) {
            return <h3><Link to="/Login" style={{textDecoration:'none',color:'black'}}>Login</Link></h3>
        } else {
            return <h3><Link to="/Logout" style={{textDecoration:'none',color:'black'}}>Logout</Link></h3>
        }
      }
    return(
       
            <div className="navbar-admin">
                <Link to="/ShowSubcategories"><img src={logo} className="logo"/></Link>
                <div className="account-container">
                    <img src={account} className="account"/>
                    {loginLogout()}  
                </div>
            </div>
       
    )
}
export default NavbarAdmin;