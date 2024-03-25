import "./admin.css";
import { useNavigate } from "react-router-dom";
import React, { useEffect, useState } from "react";
import { dataServiceObj } from "../services/data.service";
import NavbarAdmin from "./NavbarAdmin";
import NotFound from "./Error404";
import { Link} from "react-router-dom";

function ShowSubCategories() {
  const url = "http://localhost:3600/Cat";
  const [subcatArray, setSubcatArray] = useState([]);

  useEffect(() => {
    dataServiceObj
      .getAll(url)
      .then((res) => {
        setSubcatArray(res.data);
      })
      .catch((error) => {
        console.error("Error fetching data:", error);
      });
  }, []);

  const navigate = useNavigate();

  function goToProducts(subcat) {
    sessionStorage.setItem("SubCategory", subcat);
    navigate("/AdminAddProduct");
  }

  if (sessionStorage.getItem("role" )== "admin") {
    return (
      <div>
        <NavbarAdmin />
        <br />
        <h3 className="admin-title">Sub-Categories</h3>
        <hr />
        <div className="container">
          {subcatArray.map((item, index) => (
            <div
              className="card"
              key={index}
              onClick={() => goToProducts(item.subcategoryName)}
            >
              <img
                src={item.image}
                alt="Avatar"
                style={{ width: "100%", height: "240px" }}
              />
              <div className="container">
                <h5 style={{ textAlign: "center" }}>
                  <b>{item.subcategoryName}</b>
                </h5>
                <p>{item.type}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    );
  } else {
    return (
      <>
        <h1 class="role-error">
          You can't access this page. Admin Access Only.
        </h1>
        <br />
        <NotFound />
        <br />
        <button className="Submit-btn">
          <Link to="/" style={{ textDecoration: "none", color: "white" }}>
            Continue Shopping?
          </Link>
        </button>
      </>
    );
  }
}

export default ShowSubCategories;
