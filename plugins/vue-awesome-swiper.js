import Vue from 'vue'
// import VueAwesomeSwiper from 'vue-awesome-swiper/dist/ssr'
import { swiper, swiperSlide } from 'vue-awesome-swiper'
import 'swiper/dist/css/swiper.css';

export default () => {
  Vue.component('swiper', swiper)
  Vue.component('swiperSlide', swiperSlide)
}
