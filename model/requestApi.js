import { getFetch } from './request.js'
import api from './api.js'

export function getMovie (params){
    const res = getFetch(api.getMovieDetail, params) 
    return res
}