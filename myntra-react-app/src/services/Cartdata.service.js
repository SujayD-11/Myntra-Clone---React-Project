import axios from 'axios';

export let CartdataServiceObj = 
{
    getAllProducts,
    addProduct,
    deleteProduct,
    getProductById,
    updateProduct,
    deleteAllProducts
};

let url = "http://localhost:3800/cart/";

function getAllProducts()
{
    return axios.get(url);
}
function addProduct(cartObj)
{
    return axios.post(url, cartObj);
}

function deleteProduct(prod_no)
{
    return axios.delete(url + prod_no);
}

function deleteAllProducts()
{
    return axios.delete(url);
}

function getProductById(prod_no)
{
    return axios.get(url + prod_no);
}

function updateProduct(cartObj)
{
    return axios.put(url + cartObj.prod_no, cartObj);
}