import React from "react";
import "./ProductDisplay.css";
import { dataServiceObj } from "../services/data.service";
import { useState, useEffect } from "react";
import { useNavigate, useLocation } from "react-router-dom";
import { CartdataServiceObj } from "../services/Cartdata.service";
import Navbar from "./Navbar";
import Footer from "./Footer";


function ProductDisplay() {
  const [product, setProduct] = useState({});
  const [wishlistArray, setWishlistArray] = useState([]);

  let url = "http://localhost:5073/api/Products/";
  const url2= "http://localhost:3700/wishlist/";
  const navigate = useNavigate();
  const location = useLocation();

  //Using sessionStorage to pass productID of selected Product from Products page
  const prodID = sessionStorage.getItem("productID");

  useEffect(() => {
    dataServiceObj
      .getById(url, prodID)
      .then((res) => {
        setProduct(res.data);
        sessionStorage.removeItem("productID");
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  function addToCart() {
    let newObj = {};
                newObj.prod_no = product.productId;
                newObj.image = product.productPicture;
                newObj.product = product.pname;
                newObj.qty = 1;
                newObj.amount = product.price;
                newObj.subtotal = product.price;
    CartdataServiceObj.addProduct(newObj)
                    .then(() => {
                        alert("Item Added to cart");
                        navigate('/AddCart'); // Redirect to the same page
                    })
                    .catch((error) => {
                        console.error("Error adding item to cart:", error);
                    });
  }

  function wishlist() {
          let newObj = {};
          newObj.prod_no = product.productId;
          newObj.image = product.productPicture;
          newObj.product = product.pname;
          newObj.amount = product.price;

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
  
 
  return (
    <>
      <Navbar/>
      <div className="page-container">
      <div className="product-container">
        <div className="product-image">
          <img src={product.productPicture} alt="Product" />
        </div>
        <div className="product-details">
          <h2>{product.pname}</h2>
          <p>Brand: {product.brand}</p>
          <p>Price: Rs. {product.price}</p>
          <div className="buttons">
            <button className="buy-now" onClick={addToCart}>Add to Cart</button>
            <button className="wishlist" onClick={wishlist}>Add to Wishlist</button>
          </div>
        </div>
      </div>
    </div>
    <Footer/>
    </>
  );
}

export default ProductDisplay;
