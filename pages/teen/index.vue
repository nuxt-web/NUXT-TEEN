<template>
  <main id="game">
    <!-- 页面头部 -->
    <teen-header redBg="true">
      <div class="logo" slot="title">
        <img src="../../static/images/logo-mini-3.png">
      </div>
    </teen-header>

    <section class="page-wrapper">
      <teen-scroller padding="2.4rem" :refresh="refresh">

        <!--banner-->
        <swiper-banner ref="swiperBanner" :banners="banner"></swiper-banner>

        <!-- 电影预告片 -->
        <div v-for="trailer in tralierList" :key="trailer.movie_id">
          <video-card :movie="trailer" @expansion="expansion"></video-card>
        </div>
        

        <!--热门电影-->
        <movie-list :movieList="movieList"></movie-list>

        <!--电影swiper-->
        <movie-swiper v-for="(item,index) in activity" :activities="item.activity_item" :title="item.activity_name" :key="index"></movie-swiper>

      </teen-scroller>
    </section>
    <div class="img-mask" v-if="showMask">
      <img :src="" alt="">
    </div>
    <teen-footer></teen-footer>
  </main>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import TeenScroller from "../../components/global/teenScroller";
  import TeenFooter from "../../components/global/footer"
  import SwiperBanner from "../../components/global/swiperBanner";
  import MovieList from "../../components/movie/MovieList"
  import MovieSwiper from "../../components/movie/MovieSwiper"
  import VideoCard from '../../components/global/gameVideoCard'
  import api from "../../model/api.js"

  export default {
    name: 'Game',
    components: {
      TeenHeader,
      TeenScroller,
      SwiperBanner,
      MovieList,
      MovieSwiper,
      TeenFooter,
      VideoCard
    },
    data: function () {
      return {
        // 界面控制
        scrollTop: 0,
        lastScrollTop: 0,
        // 首页信息数据
        banner: [],
        movieList: [],
        tralierList: [],
        activity: [
          {
            activity_name: '热门美剧',
            activity_item: [],
          },
          {
            activity_name: '最新日剧',
            activity_item: [],
          },
          {
            activity_name: '国产热剧',
            activity_item: [],
          }
        ],
        showMask: false,
        expensionImg: 
      }
    },
    methods: {
      refresh: function (done) {
        this.getIndexInfo()
        done()
      },
      expansion: function (url) {
        this.showMask = true
      },
      getIndexInfo: function () {
        this.$ajax.get(api.getIndex).then((res)=>{
          this.banner = res.data.banner
          res.data.hotMovieList.forEach((item)=>{
            item.movie_tags = item.movie_tags.split(',')
            if (item.trailer) {
              this.tralierList.push(item)
            } else {
              this.movieList.push(item)
            }
          })
          res.data.activity.forEach((item,index)=>{
            switch (item.activity_id) {
              case "1":
                this.activity[0].activity_item.push(item)
                break;
              case "2":
                this.activity[1].activity_item.push(item)
                break;
              case "3":
                this.activity[2].activity_item.push(item)
                break;
            }
          })
        }).catch((error)=>{
          console.log(error)
        })
      }
    },
    mounted: function () {
      this.getIndexInfo()
    }
  }
</script>


