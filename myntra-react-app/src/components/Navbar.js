import React from "react";
import './Navbar.css';
import logo from './images/logo.png';
import lens from './images/lens.png';
import account from './images/account.png';
import wishlist from './images/wishlist.png';
import cart from '../images/cart.png';
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import { useState } from "react";
import { useNavigate } from "react-router-dom";
import { useEffect } from "react";
 
function Navbar(){

    const [productname, setProductname] = useState(""); //For searching
    const [counter, setCounter] = useState(0);
 
    const getProducts = async () => {
        let counter = 0
        let response = await fetch("http://localhost:3800/cart/");
        let products = await response.json()
        products.map((product) => {
          counter ++
        })
        setCounter(counter)
      }
   
      useEffect(() => {
        getProducts()
      }, [counter])

    const navigate = useNavigate();

    const loginLogout = () => {
        if (sessionStorage.getItem('user-token') == null) {
            return <h3><Link to="/Login" style={{textDecoration:'none',color:'black'}}>Login</Link></h3>
        } else {
            return <h3><Link to="/Logout" style={{textDecoration:'none',color:'black'}}>Logout</Link></h3>
        }
      }

      function goToSearching() {
        sessionStorage.setItem("ProductName", productname);
        navigate("/Searching");
      }

    return(
       
            <div className="navbar">
                <Link to="/"><img src={logo} className="logo"/></Link>
                 
                <h4><Link to="/Men" style={{textDecoration:'none',color:'black'}}>MEN</Link></h4>
                <h4><Link to="/Women" style={{textDecoration:'none',color:'black'}}>WOMEN</Link></h4>
                <h4><Link to="/Unisex" style={{textDecoration:'none',color:'black'}}>UNISEX</Link></h4>
                <h4><Link to="/AddProduct" style={{textDecoration:'none',color:'black'}}>STUDIO</Link></h4>
 
                <div className="search-container">
                    <img src={lens}  className="search-icon" onClick={() => goToSearching()}/>
                    <input className="search-input" onChange={(e) => setProductname(e.target.value)} placeholder="Search for products" required/>
                </div>
                <div className="account-container">
                    <img src={account} className="account"/>
                    {loginLogout()}  
                </div>
                <div className="logout-container">
                    <Link to="/AddCart"><img src={cart} className="logout-icon-cart" /></Link>
                    <h3 style={{textAlign:"center"}}>Cart<span className="my-counter">{counter}</span></h3>
                </div>
                <div className="logout-container">
                    <Link to="/AddWishlist"><img src={wishlist} className="logout-icon" /></Link>
                    <h3>Wishlist</h3>
                </div>
            </div>
       
    )
}
export default Navbar;