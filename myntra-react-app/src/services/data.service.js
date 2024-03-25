import axios from 'axios';

export let dataServiceObj = 
{
    getAll,
    getById,
    add,
    update,
    del,
    getByCat,       //only for products
    getBySubcat,    //only for products
    getByPname      //only for products
};



function getAll(url)
{
    return axios.get(url);
}


function add(url,obj)
{
    return axios.post(url, obj);
}

function del(url,id)
{
    return axios.delete(url + id);
}


function getById(url,id)
{
    return axios.get(url + id);
}

function update(url,obj,id)
{
    return axios.put(url + id, obj);
}

let url_Cat = "http://localhost:5073/api/Products/AccessCategoryWise?category=";
function getByCat(catValue){
    return axios.get(url_Cat + catValue);

}

let url_Subcat = "http://localhost:5073/api/Products/AccessSubcategoryWise?subcategory=";
function getBySubcat(subcatValue){
    return axios.get(url_Subcat + subcatValue);
}

let url_pname = "http://localhost:5073/api/Products/GetByPname?pname=";
function getByPname(pname){
    return axios.get(url_pname + pname);
}