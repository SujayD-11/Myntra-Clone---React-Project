import { useEffect } from "react";
import { useLocation, useNavigate } from "react-router-dom";

function Logout() {
  let navigate = useNavigate(); // for navigation using code

  sessionStorage.removeItem("user-token");
  useEffect(() => {
      // alert(props.returnUrl);
      navigate("/");
  });
}

export default Logout;