import axios from 'axios';
 
export let tokenServiceObj =
{
    getAll,
    add
};
 
function getAll(url)
{
    return axios.get(url);
}
function add(url,obj)
{
    return axios.post(url, obj);
}
