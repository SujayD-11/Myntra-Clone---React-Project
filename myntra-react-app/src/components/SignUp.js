import React from "react";
import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import "./SignUp.css";
import { dataServiceObj } from "../services/data.service";
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Navbar from "./Navbar";
import Footer from "./Footer"
 
function SignUp() {
  const [email, setEmail] = useState("");
  const [pwd, setPassword] = useState("");
  const [confirmpwd, setConfirmPassword] = useState("");
  const [result, setResult] = useState("");
 
  let url = "http://localhost:5073/api/Customers";
 
  let navigate = useNavigate(); // for navigation using code
  let location = useLocation(); // for reading query string params
 
  function signUp_btnClick(){
    let custData = {
      email: email,
      password: pwd,
      houseNo: "string",
      streetName: "string",
      city: "string",
      state: "string",
      pincode: 0,
      customersId: 0,
    };
    if(pwd != confirmpwd){
      setResult("Passwords dont match. Re-check Passwords");
    }
    else if(pwd=="" && confirmpwd==""){
      setResult("Passwords cannot be empty");
    }
    else if(email==""){
      setResult("Email is required");
    }
    else{
      try {
        const resData = dataServiceObj.add(url,custData).catch((e) => {
          console.log(e.resposne);
        });
        alert("Successfully Signed Up. Please proceed to Login");
        navigate("/Login");
      } catch (error) {
        alert("There was something wrong with the Sign Up. Please refresh and try again");
        setResult("There was something wrong with the Sign Up. Please refresh and try again");
      }
    }
  }
 
  return (
    <>
    <Navbar/>
    <div className="signup-container">
      <h2>Sign Up</h2>
      <form>
        <div className="form-group">
          <label>First Name:</label>
          <input type="text" />
        </div>
        <div className="form-group">
          <label>Last Name:</label>
          <input type="text" />
        </div>
        <div className="form-group">
          <label>Email:</label>
          <input type="email" value={email}
          onChange={(event) => setEmail(event.target.value)}/>
        </div>
        <div className="form-group">
          <label>Password:</label>
          <input type="password" value={pwd}
          onChange={(args) => setPassword(args.target.value)}/>
        </div>
        <div className="form-group">
          <label>Confirm Password:</label>
          <input type="password" value={confirmpwd}
          onChange={(args) => setConfirmPassword(args.target.value)}/>
        </div>
        <input type="button" onClick={signUp_btnClick} value="Proceed"/>
      </form>
      <br />
      <p class="validation-result">{result}</p>
      <br/>
      <Link to="/Login">Already Signed Up? Login</Link>
    </div>
    <Footer/>
    </>
  );
}
 
export default SignUp;