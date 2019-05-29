import axios from 'axios';
import qs from 'qs'
axios.defaults.headers['Content-Type'] = 'application/x-www-form-urlencoded;charset=UTF-8';
// axios.defaults.headers['Content-Type'] = 'application/json';
axios.defaults.timeout = 5000;
// axios.defaults.headers["Content-Type"] = "multipart/form-data;charset=UTF-8";

export function getFetch (url, params = {}) {
    return new Promise((resolve, reject) => {
        axios.get(url, {params}).then((res) => {
           resolve(res)
        }).catch((err) => {
           reject(err)
        })
    })
}

export function postFetch (url, data = {}) {
    return new Promise((resolve, reject) => {
        axios.post(url, qs.stringify(data)).then((res) => {
           resolve(res)
        }).catch((err) => {
           reject(err)
        })
        // axios({
        //     method: 'post',
        //     url,
        //     data,
        // }).then((res) => {
        //     resolve(res)
        // }).catch((err) => {
        //     reject(err)
        // })
    })
}