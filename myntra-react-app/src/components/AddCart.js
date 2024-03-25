import React, { useEffect, useState } from "react";
import { CartdataServiceObj } from "../services/Cartdata.service";
import "./AddCart.css";
import Navbar from "./Navbar";
import Footer from "./Footer";
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';

function AddCart() {
  const [cartArray, setCartArray] = useState([]);
  const [total, setTotal] = useState(0);

  useEffect(() => {
    // Fetch data from the server when component mounts
    CartdataServiceObj.getAllProducts()
      .then((res) => {
        setCartArray(res.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  useEffect(() => {
    // Calculate total whenever cartArray changes
    setTotal(calculateTotal());
  }, [cartArray]);

  const calculateTotal = () => {
    const total = cartArray.reduce((acc, item) => {
      return acc + item.qty * item.amount;
    }, 0);
    return total.toFixed(2);
  };

  const addToCart = (prod_no) => {

    const updatedCart = [...cartArray];
    let itemUpdated = false;

    // Check if an item with the same product name already exists in the cart
    updatedCart.forEach((item) => {
      if (item.prod_no === prod_no) {
        item.qty += 1;
        item.subtotal = item.qty * item.amount;
        itemUpdated = true;
        CartdataServiceObj.updateProduct(item);
      }
    
    });

    // If the item with the same product name doesn't exist, add it to the cart
    if (!itemUpdated) {
      const newItem = cartArray.find((item) => item.prod_no === prod_no);
      updatedCart.push({
        ...newItem,
        qty: 1,
        subtotal: newItem.amount,
      });
    }

    setCartArray(updatedCart);
  };

  const deleteFromCart = (prod_no) => {
    const updatedCart = cartArray
      .map((item) => {
        if (item.prod_no === prod_no) {
          item.qty -= 1;
          item.subtotal = item.qty * item.amount;

          if (item.qty === 0) {
            CartdataServiceObj.deleteProduct(prod_no)
              .then(() => {
                console.log("Item deleted from server");
              })
              .catch((error) => {
                console.error("Error deleting item from server:", error);
              });
            return null;
          }
          else{
            CartdataServiceObj.updateProduct(item);
          }
        }
        return item;
      })
      .filter(Boolean);

    setCartArray(updatedCart);
  };

  return (
    <>
      <Navbar/>
      <div className="cart-container">
      <h1 style={{textAlign:"center"}}>Cart Items</h1>
      <hr></hr>
      <div className="cart-cards">
        {cartArray.map((item) => (
          <div className="cart-card" key={item.prod_no}>
            <img
              src={item.image}
              alt={item.product}
              className="cart-product-img"
            />
            <div className="cart-details">
              <div className="cart-product-name">{item.product}</div>
              <div className="cart-amount">Amount: {item.amount}</div>
              <div className="cart-subtotal">Subtotal: {item.subtotal}</div>
            </div>
            <div className="cart-quantity">
              <button onClick={() => addToCart(item.prod_no)}>+</button>
              {item.qty}
              <button onClick={() => deleteFromCart(item.prod_no)}>-</button>
            </div>
          </div>
        ))}
      </div>
      <div className="cart-total">Total: {calculateTotal()}</div>
      <button className="Submit-btn"><Link to="/Payment" style={{textDecoration:"none",color:"white"}}>Done with Shopping?</Link></button>
    </div>
    <Footer/>
    </>
  );
}

export default AddCart;
