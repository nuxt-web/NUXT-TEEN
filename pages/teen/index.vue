<template>
  <main id="game">
    <!-- 页面头部 -->
    <teen-header redBg="true">
      <div class="logo" slot="title">
        <img src="../../static/images/logo-mini-3.png">
      </div>
      {{username}}
    </teen-header>

    <section class="page-wrapper">
      <teen-scroller padding="2.4rem" :refresh="refresh">

        <!--banner-->
        <swiper-banner ref="swiperBanner" :banners="banner"></swiper-banner>

        <!-- 电影预告片 -->
        <video-card :game="movieVideo"></video-card>

        <!--热门电影-->
        <movie-list :movieList="movieList"></movie-list>

        <video-card :game="movieVideo"></video-card>

        <!--电影swiper-->
        <movie-swiper v-for="(item,index) in activity" :activities="item.activity_item" :title="item.activity_name" :key="index"></movie-swiper>

      </teen-scroller>
    </section>
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
        // 红点
        haveNotice: false,
        username: '',
        // 界面控制
        showEl: false,
        scrollTop: 0,
        lastScrollTop: 0,
        showAd: false,
        showFooter: true,
        footerTransition: '',
        // 提交参数
        params: {
          page: 1,
          limit: 5
        },
        // 首页信息数据
        banner: [],
        movieList: [],
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
        movieVideo: {
          icon_origin_url: "http://mydatabase.com/movie/doraamen.jpg",
          icon_url: "http://mydatabase.com/movie/doraamen.jpg",
          name: "大雄的月球奇遇记",
          slogan: "月球探测器在月亮上捕捉到了白影，大雄认为这道白影是月亮上的兔子，惹来了大家的耻笑，于是哆啦A 梦为了帮助大雄，利用道具“异说俱乐部徽章”，在月球背面制造了一个兔子王国。一天，神秘少年露卡转学而来，与大雄…",
          type: 2,
          video: {
            // video_img: "http://mydatabase.com/video_poster/doraamen.png",
            video_img: "",
            video_url: "http://mydatabase.com/video/doraamen.mp4"
          }
        }
      }
    },
    methods: {
      refresh: function (done) {
        this.getIndexInfo()
        done()
      },
      getIndexInfo: function () {
        this.$ajax.get(api.getIndex).then((res)=>{
          this.banner = res.data.banner
          this.movieList = res.data.hotMovieList.map((item)=>{
            item.movie_tags = item.movie_tags.split(',')
            return item
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
          console.log(this.activity)
          // this.activity = res.data.activity
        }).catch((error)=>{
          console.log(error)
        })
      }
    },
    created: function () {
      this.getIndexInfo()
    }
  }
</script>
