<template>
  <div class="game-active">
    <div class="game-active-title">
      <div class="label"><img src="./../../static/images/label.png" alt=""></div>
      <p class="title-name">{{title}}</p>
    </div>
    <div class="game-active-swiper">
      <swiper :options="swiperOption" ref="mySwiper">
        <!-- slides -->
        <swiper-slide v-for="(activity, index) in list" :key="index">
          <div class="slide-img img-loading" @click="goMovieDetail(activity.movie_id)">
            <img :src="activity.img_url">
          </div>
        </swiper-slide>
      </swiper>
    </div>
  </div>

</template>

<script>
  export default {
    name: 'swiperBanner',
    props: ['activities', 'title'],
    data: function () {
      return {
        swiperOption: {
          slidesPerView: 'auto',
          spaceBetween: 13,
          freeMode: true,
          freeModeMomentum: true
        },
        list: []
      }
    },
    methods: {
      getMovieDetail:function () {
        this.$ajax.get(api.getMovieDetail,{
          params:{
            movie_id: this.movie_id
          }
        }).then((res)=>{
          if (res.data.code == 200) {
            this.movie = res.data.data
            this.comment = res.data.comment
            console.log(res)
          }
        }).catch((error)=>{
          console.log(error)
        })
      },
      goMovieDetail: function (id) {
        console.log(789789)
        this.$router.push({ name: 'movieDetail-id',params: { id: id}})
      },
    },
    created: function () {
      console.log(this.activities)
      this.list = this.activities
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/movie/MovieSwiper.scss" scoped></style>
