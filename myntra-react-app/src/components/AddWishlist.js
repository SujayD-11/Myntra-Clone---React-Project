import React, { useEffect, useState } from "react";
import { dataServiceObj } from "../services/data.service";
import { CartdataServiceObj } from "../services/Cartdata.service";
import "./AddWishlist.css";
import cartImage3 from "../images/cart2.png";
import deleteImage from "./images/delete.png";
import Navbar from "./Navbar";
import Footer from "./Footer";

function AddWishlist() {
  const [wishlistArray, setWishlistArray] = useState([]);
  const [cartArray, setCartArray] = useState([]);

  const url = "http://localhost:3700/wishlist/";

  useEffect(() => {
    // Fetch data from the server when component mounts
    dataServiceObj
      .getAll(url)
      .then((res) => {
        setWishlistArray(res.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  function addToCart(prod_no) {
    const selectedItem = wishlistArray.find((item) => item.prod_no === prod_no);
    if (selectedItem) {
      // Check if the item is already in the cart
      const isItemInCart = cartArray.some((item) => item.prod_no === prod_no);
      if (isItemInCart) {
        alert("Item is already in the cart");
        return;
      }

      const newItem = {
        ...selectedItem,
        qty: 1,
      };
      CartdataServiceObj.addProduct(newItem)
        .then(() => {
          alert("Item Added to cart");
          const updatedCart = wishlistArray.map((item) =>
            item.prod_no === prod_no ? newItem : item
          );
          setWishlistArray(updatedCart);
        })
        .catch((error) => {
          console.error("Error adding item to cart:", error);
          alert("The item is already in cart");
        });
    } else {
      console.error("Item not found in wishlist array");
    }
  }

  function removeFromWishlist(prod_no) {
    dataServiceObj
      .del(url, prod_no) // Send DELETE request to remove item from wishlist
      .then(() => {
        console.log("Item removed from wishlist:", prod_no);
        const updatedWishlist = wishlistArray.filter(
          (item) => item.prod_no !== prod_no
        );
        setWishlistArray(updatedWishlist);
        alert("Item removed from wishlist");
      })
      .catch((error) => {
        console.error("Error removing item from wishlist:", error);
        alert("Error removing item from wishlist. See console for details.");
      });
  }

  return (
    <>
      <Navbar />
      <div className="wishlist-container">
      <h1 style={{textAlign:"center"}}>Wishlist</h1>
      <hr></hr>
        <div className="wishlist-cards">
          {wishlistArray.map((item) => (
            <div className="cart-card" key={item.prod_no}>
              <img
                src={item.image}
                alt={item.product}
                className="cart-product-img"
              />
              <div className="cart-details">
                <div className="cart-product-name">{item.product}</div>
                <div className="cart-amount">Amount: {item.amount}</div>
              </div>
              <div className="wishlist-cart-quantity">
                <button
                  onClick={() => addToCart(item.prod_no)}
                  className="wishlist-btn"
                >
                  <img src={cartImage3} alt="Add to cart" width={35} />
                </button>
                <button
                  onClick={() => removeFromWishlist(item.prod_no)}
                  className="wishlist-btn"
                >
                  <img src={deleteImage} alt="Add to cart" width={35} />
                </button>
              </div>
            </div>
          ))}
        </div>
      </div>
      <Footer/>
    </>
  );
}

export default AddWishlist;
