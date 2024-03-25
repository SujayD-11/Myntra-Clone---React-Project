import React from 'react';
import Banner from './components/Banner';
import Caro from './components/carousal';
import Navbar from './components/Navbar';


function Home(){
    return(
        <div style={{backgroundColor:"#fae3e3"}}>
            <Navbar/>
            <Caro/>                     
            <Banner />
        </div>
    );
}
export default Home;