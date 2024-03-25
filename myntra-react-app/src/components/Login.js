import { useEffect, useState } from "react";
import { useLocation, useNavigate } from "react-router-dom";
import { tokenServiceObj } from "../services/token.service";
import { BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Navbar from "./Navbar";
import './Login.css';
import Footer from "./Footer"
 
function Login() {
  const [email, setEmail] = useState("");
  const [isAdmin, setIsAdmin] = useState(false);
  const [pwd, setPassword] = useState("");
  const [result, setResult] = useState("");
 
 
  const handleChange = event => {
    if (event.target.checked) {
      console.log('✅ Checkbox is checked');
    } else {
      console.log('⛔️ Checkbox is NOT checked');
    }
    setIsAdmin(current => !current);
  };
 
  if(isAdmin){
    var tokenData = {
      adminId: 0,
      username: email,
      password:pwd
    }
    var tokenUrl = "http://localhost:5073/api/LoginAdmin";
  }
  else{
    var tokenData = {
      email: email,
      password: pwd,
      houseNo: "string",
      streetName: "string",
      city: "string",
      state: "string",
      pincode: 0,
      customersId: 0,
    };
    var tokenUrl = "http://localhost:5073/api/Login";
  }
  async function getTokenData() {
    try {
      const resData = await tokenServiceObj.add(tokenUrl, tokenData);
      sessionStorage.setItem("user-token", resData.data.token);
    } catch (error) {
      console.log(error);
      setResult("Invalid User Id or Password");
    }
  }
  // useEffect(() => {
  //     fetch('google.com');
  // },[])
 
  let navigate = useNavigate(); // for navigation using code
  let location = useLocation(); // for reading query string params
 
  async function loginButton_click() {
   
    // console.log("strReturnUrl: "+strReturnUrl);
    await getTokenData();
    const queryString = location.search; // returns the query string from the current url
    let strReturnUrl = new URLSearchParams(queryString).get("returnUrl");
 
    if (strReturnUrl == null || strReturnUrl== "") {
      strReturnUrl = "/";
    }
    const userToken = sessionStorage.getItem("user-token");

    if(email==""){
      setResult("Username / Email is Required");
    }
    else if(pwd==""){
      setResult("Password is Required");
    }
    else if (!userToken || userToken === "undefined") {
      setResult("Invalid User Id or Password");
    }
    else {
      if(!isAdmin){
        sessionStorage.setItem('role','customer');
        navigate(strReturnUrl);
      }
      else{
        sessionStorage.setItem('role','admin');
        navigate("/ShowSubcategories");
      }
    }
  }
 
  return (
    <>
    <Navbar/>
      <div className="login-container">
      <h2>Login</h2>
      <form>
        <div className="form-group">
          <label class="lblUsernameEmail">Username/Email:</label>
          <input type="email" value={email}
          onChange={(event) => setEmail(event.target.value)}/>
        </div>
        <div className="form-group">
          <label class="lblPassword">Password:</label>
          <input type="password" value={pwd}
          onChange={(args) => setPassword(args.target.value)}/>
        </div>
        <div className="checkbox-group">
          <input type="checkbox" value={isAdmin} onChange={handleChange} id="admin" />
          <label htmlFor="admin">Admin Login</label>
        </div>
        <input type="button" onClick={loginButton_click} value="Login" />
      </form>
      <br/>
      <p class="validation-result">{result}</p>
      <br/>
      <Link to="/SignUp">New User? Sign Up</Link>
    </div>
    <Footer/>
    </>
  );
}
 
export default Login;