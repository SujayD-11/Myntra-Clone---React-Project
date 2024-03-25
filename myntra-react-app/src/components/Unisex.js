import React, { useEffect, useState } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { CartdataServiceObj } from "../services/Cartdata.service";
import './AddProduct.css'; // Import custom CSS file for styling
import { dataServiceObj } from "../services/data.service";
import Navbar from "./Navbar";
import wishlistImage from "../images/image.png";
import cartImage from "../images/cart2.png";
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Footer from "./Footer";
 
 
function Unisex() {
 
 
    const [prodArray, setProdArray] = useState([]);
    const navigate = useNavigate();
    const location = useLocation();
    const [wishlistArray, setWishlistArray] = useState([]);
 
    let url = "http://localhost:5073/api/Products";
    const url2= "http://localhost:3700/wishlist/";
 
    useEffect(() => {
        dataServiceObj.getByCat("Unisex")
            .then((res) => {
                setProdArray(res.data);
            })
            .catch((error) => {
                console.error("Error fetching data:", error);
            });
    }, []);
   
    function addToCart(prod_no) {
        const updatedCart = prodArray.map((item) => {
            if (item.productId === prod_no) {
                let newObj = {};
                newObj.prod_no = item.productId;
                newObj.image = item.productPicture;
                newObj.product = item.pname;
                newObj.qty = 1;
                newObj.amount = item.price;
                newObj.subtotal = item.price;
 
                CartdataServiceObj.addProduct(newObj)
                    .then(() => {
                        alert("Item Added to cart");
                        navigate('/AddCart'); // Redirect to the same page
                    })
                    .catch((error) => {
                        console.error("Error adding item to cart:", error);
                    });
            }
            return item;
        });
        setProdArray(updatedCart);
    }
 
    function wishlist(prod_no) {
        const updatedWishlist = prodArray.map((item) => {
            if (item.productId === prod_no) {
                let newObj = {};
                newObj.prod_no = item.productId;
                newObj.image = item.productPicture;
                newObj.product = item.pname;
                newObj.amount = item.price;
 
                console.log(newObj);
 
                dataServiceObj.add(url2, newObj)
                    .then(() => {
                        alert("Item Added to wishlist");
                        navigate(location.pathname);
                    })
                    .catch((error) => {
                        console.error("Error adding item to cart:", error);
                    });
            }
            return item;
        });
        setWishlistArray(updatedWishlist);
    }
 
    return (
        <div className="myContainer">
            <Navbar/>
            <br></br>
            <div className="product-grid">
                {prodArray.map((item) => (
                    <div key={item.productId} className="product-card">
                        <Link to="/ProductDisplay" > <img src={item.productPicture} alt={item.pname} onClick={() => sessionStorage.setItem("productID", item.productId)} height="270" width="200"/></Link>
                        <div className="product-info">
                            <p className="product-name">{item.pname}</p>
                            <p className="product-price">Rs. {item.price}</p>
                            {/* <button onClick={() => addToCart(item.productId)} className="add-to-cart-btn">Add to Cart</button> */}
                            <button onClick={() => addToCart(item.productId)} className="add-to-cart-btn">
                                <img src={cartImage} alt="Add to cart" width={35}/>
                            </button>
                            <button onClick={() => wishlist(item.productId)} className="wishlist-cart-btn">
                                <img src={wishlistImage} alt="Add to Wishlist" width={28}/>
                            </button>
                        </div>
                    </div>
                ))}
            </div>
            <br></br>
            <Footer/>
        </div>
    );
}
 
export default Unisex;