// import React from 'react';
// import ReactDOM from 'react-dom/client';
// import './index.css';
// import App from './App';
// import reportWebVitals from './reportWebVitals';
// import { BrowserRouter } from 'react-router-dom';

// const root = ReactDOM.createRoot(document.getElementById('root'));
// root.render(
//   <React.StrictMode>
//     <BrowserRouter>
//       <App />
//     </BrowserRouter>

//   </React.StrictMode>
// );

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import reportWebVitals from "./reportWebVitals";

import { BrowserRouter as Router, Routes, Route, Link } from "react-router-dom";

import Login from "./components/Login";
import SignUp from "./components/SignUp";
import Logout from "./components/Logout";
import ProtectedRoute from "./components/ProtectedRoute";
import AddCart from "./components/AddCart";
import AddProduct from "./components/AddProduct";
import Men from "./components/Men";
import Women from "./components/Women";
import Unisex from "./components/Unisex";
import ProductDisplay from "./components/ProductDisplay";
import PaymentSuccess from "./components/SuccessPayment";
import Payment from "./components/Payment";
import AdminAddProduct from "./components/AdminAddProduct";
import ShowSubCategories from "./components/ShowSubcategories";
import Searching from "./components/Searching";
import AddWishlist from "./components/AddWishlist";
import NotFound from "./components/Error404";

const routing = (
  <Router>
    <Routes>
      <Route path="/" element={<App />} />
      <Route
        path="/Searching"
        element={
          <ProtectedRoute returnUrl="/Searching">
            <Searching />
          </ProtectedRoute>
        }
      />
      <Route
        path="/AddProduct"
        element={
          <ProtectedRoute returnUrl="/AddProduct">
            <AddProduct />
          </ProtectedRoute>
        }
      />
      <Route
        path="/AddWishlist"
        element={
          <ProtectedRoute returnUrl="/AddWishlist">
            <AddWishlist />
          </ProtectedRoute>
        }
      />
      <Route
        path="/Men"
        element={
          <ProtectedRoute returnUrl="/Men">
            <Men />
          </ProtectedRoute>
        }
      />
      <Route
        path="/Women"
        element={
          <ProtectedRoute returnUrl="/Women">
            <Women />
          </ProtectedRoute>
        }
      />
      <Route
        path="/Unisex"
        element={
          <ProtectedRoute returnUrl="/Unisex">
            <Unisex />
          </ProtectedRoute>
        }
      />

      <Route
        path="/PaymentSuccess"
        element={
          <ProtectedRoute returnUrl="/PaymentSuccess">
            <PaymentSuccess />
          </ProtectedRoute>
        }
      />
      <Route
        path="/AdminAddProduct"
        element={
          <ProtectedRoute returnUrl="/AdminAddProduct">
            <AdminAddProduct />
          </ProtectedRoute>
        }
      />

      <Route
        path="Payment"
        element={
          <ProtectedRoute returnUrl="/Payment">
            <Payment />
          </ProtectedRoute>
        }
      />

      <Route
        path="ShowSubCategories"
        element={
          <ProtectedRoute returnUrl="/ShowSubCategories">
            <ShowSubCategories />
          </ProtectedRoute>
        }
      />

      <Route
        path="AddCart"
        element={
          <ProtectedRoute returnUrl="/AddCart">
            <AddCart />
          </ProtectedRoute>
        }
      />

      <Route
        path="ProductDisplay"
        element={
          <ProtectedRoute returnUrl="/ProductDisplay">
            <ProductDisplay />
          </ProtectedRoute>
        }
      />

      <Route path="*" element={<NotFound />} />
      <Route path="/" element={<App />} />
      <Route path="/Login" element={<Login />} />
      <Route path="/SignUp" element={<SignUp />} />
      <Route path="/Logout" element={<Logout />} />
    </Routes>
  </Router>
);

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(<React.StrictMode>{routing}</React.StrictMode>);

reportWebVitals();
