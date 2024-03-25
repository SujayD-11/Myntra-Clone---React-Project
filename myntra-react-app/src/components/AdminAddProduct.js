import "./admin.css";
import React, { useState } from "react";
//import { useParams, useLocation } from 'react-router-dom';
import { useEffect } from "react";
import { dataServiceObj } from "../services/data.service";
import NavbarAdmin from "./NavbarAdmin";
import NotFound from "./Error404";
import { Link} from "react-router-dom";
import { useLocation } from 'react-router-dom';

function AdminAddProduct() {

  const [prodArray, setProdArray] = useState([]);
  const [pname, setPname] = useState("");
  const [category, setCategory] = useState("");
  const [subCategory, setSubcategory] = useState("");
  const [brand, setBrand] = useState("");
  const [price, setPrice] = useState("");
  const [productPicture, setProductPicture] = useState("");
  const [productId, setProductId] = useState("");

  let url = "http://localhost:5073/api/Products/";

  const subcat = sessionStorage.getItem("SubCategory");

  useEffect(()=>{
    dataServiceObj
      .getBySubcat(subcat)
      .then((res) => {
        setProdArray(res.data);
        
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  },[]);


  function reRender(){
    dataServiceObj
      .getBySubcat(subcat)
      .then((res) => {
        setProdArray(res.data);
        
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }

  

  function selectProduct(dno) {
    dataServiceObj.getById(url,dno).then((resData) => {
      let prodObj = resData.data;
      setProductId(prodObj.productId);
      setBrand(prodObj.brand);
      setCategory(prodObj.category);
      setSubcategory(prodObj.subCategory);
      setPname(prodObj.pname);
      setPrice(prodObj.price);
      setProductPicture(prodObj.productPicture);
    });
  }

  function addProduct() {
    let prodObj = {};
    prodObj.pname = pname;
    prodObj.category = category;
    prodObj.subCategory = subCategory;
    prodObj.price = price;
    prodObj.brand = brand;
    prodObj.productPicture = productPicture;
   

    const resData = dataServiceObj.add(url,prodObj);
      alert("New Product added successfully!");
      // get the latest data from server
      reRender();
      clearFields();
  }

  function clearFields() {
    setProductId("");
    setBrand("");
    setCategory("");
    setSubcategory("");
    setPname("");
    setPrice("");
    setProductPicture("");
  }

  function updateProduct() {
    let prodObj = {};
    prodObj.pname = pname;
    prodObj.category = category;
    prodObj.subCategory = subCategory;
    prodObj.price = price;
    prodObj.brand = brand;
    prodObj.productPicture = productPicture;
    prodObj.productId = productId;

    dataServiceObj.update(url,prodObj,productId).then((resData) => {
      alert("Product Details Updated!");
      reRender();
      clearFields();
    });
  }

  function deleteProduct(dno) {
    dataServiceObj.del(url,dno).then((resData) => {
      alert("Product Deleted!");
      reRender();
       // get the latest data from server
    });
  }

  const tableData = prodArray.map((item) => {
    return (
      <tr>
        <td>{item.pname}</td>
        <td>{item.category}</td>
        <td>{item.subCategory}</td>
        <td>{item.brand}</td>
        <td>Rs. {item.price}</td>
        <td>
          <img
            src={item.productPicture}
            alt="Avatar"
            style={{ width: "50px", height: "50px" }}
          />
        </td>
        <td>
          <button
            className="AdminBtn"
            onClick={() => selectProduct(item.productId)}
            style={{ width: "150px", margin: "10px" }}
          >
            Select Product
          </button>
          <button
            className="AdminBtn"
            onClick={() => deleteProduct(item.productId)}
            style={{ width: "150px", margin: "10px" }}
          >
            Delete Product
          </button>
        </td>
      </tr>
    );
  });

  if(sessionStorage.getItem("role")=="admin"){
	return (
		<div>
		  <NavbarAdmin/>
		  <br></br>
		  <h3 className="admin-title">Manage Products</h3>
		  <hr />
		  <div className="inputdiv">
			<input className="adminInput" type="text" placeholder="Name" value={pname} onChange={(e) => setPname(e.target.value)}></input>
			<input
			  className="adminInput"
			  type="text"
			  placeholder="Category"
			  value={category} onChange={(e) => setCategory(e.target.value)}
			></input>
			<input
			  className="adminInput"
			  type="text"
			  placeholder="Subcategory"
			  value={subCategory} onChange={(e) => setSubcategory(e.target.value)}
			></input>
			<input className="adminInput" type="text" placeholder="Brand" value={brand} onChange={(e) => setBrand(e.target.value)}></input>
			<input className="adminInput" type="text" placeholder="Price" value={price} onChange={(e) => setPrice(e.target.value)}></input>
			<input
			  className="adminInput"
			  type="text"
			  placeholder="Product Picture"
			  value={productPicture} onChange={(e) => setProductPicture(e.target.value)}
			></input>
			<input
			  className="adminInput"
			  type="text"
			  placeholder="ID"
			  value={productId} onChange={(e) => setProductId(e.target.value)}
			></input>
		  </div>
	
		  <button
			className="AdminBtn"
			onClick={() => addProduct()}
			style={{ width: "150px", margin: "20px", marginLeft: "35%" }}
		  >
			Add Product
		  </button>
		  <button
			className="AdminBtn"
			onClick={() => updateProduct()}
			style={{ width: "150px", margin: "20px" }}
		  >
			Update Product
		  </button>
	
		  <table className="customers">
			<tr>
			  <th>Name</th>
			  <th>Category</th>
			  <th>SubCategory</th>
			  <th>Brand</th>
			  <th>Price</th>
			  <th>Image</th>
			  <th>Actions</th>
			</tr>
			{tableData}
		  </table>
	
		  {/* <Modal title="Products Data" onClose={() => setShow(false)} onAction={() => {setShow(false); modalAction()}} show={show} action={action}>
					{productDetails}
					<div style={{ display: "inline-block", width: "100%" }}></div>
				</Modal> */}
		</div>
	  );
  }
  else{
	return(
		<>
		
		<h1 class="role-error">You can't access this page. Admin Access Only.</h1>
      <br/>
      <NotFound/>
      <br/>
      <button className="Submit-btn"><Link to="/" style={{textDecoration:"none",color:"white"}}>Continue Shopping?</Link></button>
      </>
	
	)
  }
  
}

export default AdminAddProduct;
