<template>
  <main id="game">
    <!-- 页面头部 -->
    <teen-header redBg="true">
      <div class="logo" slot="title">
        <img src="../static/images/logo-mini-3.png">
      </div>
    </teen-header>

    <section class="page-wrapper">
      <teen-scroller padding="2.4rem" :refresh="refresh">
        <!--banner-->
        <swiper-banner ref="swiperBanner" :banners="banner"></swiper-banner>

        <!--热门电影-->
        <movie-list :movieList="movieList"></movie-list>

        <!--电影swiper-->
        <movie-swiper :activities="activity" title="最新电影"></movie-swiper>
        <movie-swiper :activities="activity" title="热门番剧"></movie-swiper>
        <movie-swiper :activities="activity" title="漫威宇宙"></movie-swiper>

      </teen-scroller>
    </section>
    <teen-footer></teen-footer>
  </main>
</template>

<script>
  import TeenHeader from './../components/global/header'
  import TeenScroller from "../components/global/teenScroller";
  import SwiperBanner from "../components/global/swiperBanner";
  import MovieList from "../components/movie/MovieList"
  import MovieSwiper from "../components/movie/MovieSwiper"
  import TeenFooter from "../components/global/footer"

  export default {
    name: 'Game',
    components: {
      TeenHeader,
      TeenScroller,
      SwiperBanner,
      MovieList,
      MovieSwiper,
      TeenFooter
    },
    data: function () {
      return {
        // 红点
        haveNotice: false,
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
        banner: [
          {
            img_url: require('../static/images/BLUE2.jpg')
          },
          {
            img_url: require('../static/images/CM.jpg')
          },
          {
            img_url: require('../static/images/MYHERO.jpg')
          },
          {
            img_url: require('../static/images/SPIDER.jpg')
          }
        ],
        movieList: [
          {
            url: require('../static/images/BLUE1.jpg'),
            title: '比悲伤更悲伤的故事',
            time: '2019-3-14',
            slogan: '唯一观影建议：请带着纸巾',
            tags: [
              '6666', '感动', '哭了三分之一', '爱', '6666', '6666'
            ]
          },
          {
            url: require('../static/images/BLUE1.jpg'),
            title: '比悲伤更悲伤的故事',
            time: '2019-3-14',
            slogan: '唯一观影建议：请带着纸巾',
            tags: [
              '6666', '感动', '哭了三分之一', '爱', '6666', '6666'
            ]
          }
        ],
        activity: [
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            img_url: require('../static/images/BLUE1.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          },
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            id: 39,
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/activity/n1/2018/08/30/1535617946750.jpg',
            img_url: require('../static/images/COMEDY.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          },
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            id: 39,
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/activity/n1/2018/08/30/1535617946750.jpg',
            img_url: require('../static/images/DES.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          },
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            id: 39,
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/activity/n1/2018/08/30/1535617946750.jpg',
            img_url: require('../static/images/KISS.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          },
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            id: 39,
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/activity/n1/2018/08/30/1535617946750.jpg',
            img_url: require('../static/images/LIFTRES.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          },
          {
            android_dst_info: {
              app_id: 100002,
              package_name: 'ceshi'
            },
            android_dst_type: 1,
            app_id: 100002,
            compatible_os: '1|2',
            id: 39,
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/activity/n1/2018/08/30/1535617946750.jpg',
            img_url: require('../static/images/VEMON.jpg'),
            news_id: 0,
            web_dst_url: 'http://m.rastargame.com/dist/news/4110'
          }
        ],
        news: [
          {
            app_id: 100002,
            compatible_os: '1|2',
            id: 4138,
            // img_url: require('../static/images/GOODMOVIE.jpg'),
            title: '从《一出好戏》谈反乌托邦',
            web_dst_url: ''
          },
          {
            app_id: 100002,
            compatible_os: '1|2',
            id: 4138,
            // img_url: require('../../assets/img/temp/GOODMOVIE.jpg'),
            title: '123123',
            web_dst_url: ''
          },
          {
            app_id: 100002,
            compatible_os: '1|2',
            id: 4138,
            // img_url: require('../../assets/img/temp/GOODMOVIE.jpg'),
            title: '123123',
            web_dst_url: ''
          }
        ],
        // 游戏列表数据
        // recentH5List: [],
        topicListL: [
          {
            app_bind_info: {
              app_id: 100198,
              app_name: '苍之纪元',
              icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/06/13/1528853889983.png'
            },
            id: 2,
            img: 'https://img02.rastargame.com/gameCenter/img/topic/img/n1/2018/07/05/1530760623531.jpg',
            show_type: 0
          }
        ],
        // gamesList: [],
        gameFirstList: [
          {
            android_download_url: 'http://65.xuqiu.com/requirements',
            android_game_version: '234234',
            android_package_size: '50',
            android_sub_url: '',
            app_id: 11111,
            category: '休闲放置',
            cch_id: 222,
            compatible_os: '1|2',
            h5_dst_url: '',
            icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png',
            icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png?imageView2/1/w/110/h/110',
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png',
            img_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png?imageView2/1/w/660/h/370',
            ios_app_id_main: 0,
            ios_download_url: '',
            ios_sub_url: '',
            name: 'test',
            package_name: '1',
            slogan: '1',
            top: false,
            type: 3,
            video: {
              video_img: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/11/19/1542610853644.jpg',
              video_url: 'http://mvvideo10.meitudata.com/5bf23f3b96bf41115.mp4?k=aa9293f8b9d34111a7466bccffb6f503&t=5bf65050'
            }
          },
          {
            android_download_url: 'http://65.xuqiu.com/requirements',
            android_game_version: '234234',
            android_package_size: '50',
            android_sub_url: '',
            app_id: 11111,
            category: '休闲放置',
            cch_id: 222,
            compatible_os: '1|2',
            h5_dst_url: '',
            icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png',
            icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png?imageView2/1/w/110/h/110',
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png',
            img_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png?imageView2/1/w/660/h/370',
            ios_app_id_main: 0,
            ios_download_url: '',
            ios_sub_url: '',
            name: 'test',
            package_name: '1',
            slogan: '1',
            top: true,
            type: 3,
            video: {
              video_img: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/11/19/1542610853644.jpg',
              video_url: 'http://mvvideo10.meitudata.com/5bf23f3b96bf41115.mp4?k=aa9293f8b9d34111a7466bccffb6f503&t=5bf65050'
            }
          }
        ],
        gameSecondList: [
          {
            android_download_url: 'http://65.xuqiu.com/requirements',
            android_game_version: '234234',
            android_package_size: '50',
            android_sub_url: '',
            app_id: 11111,
            category: '休闲放置',
            cch_id: 222,
            compatible_os: '1|2',
            h5_dst_url: '',
            icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png',
            icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png?imageView2/1/w/110/h/110',
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png',
            img_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png?imageView2/1/w/660/h/370',
            ios_app_id_main: 0,
            ios_download_url: '',
            ios_sub_url: '',
            name: 'test',
            package_name: '1',
            slogan: '1',
            top: true,
            type: 0
          }
        ],
        gameThirdList: [
          {
            android_download_url: 'http://65.xuqiu.com/requirements',
            android_game_version: '234234',
            android_package_size: '50',
            android_sub_url: '',
            app_id: 11111,
            category: '休闲放置',
            cch_id: 222,
            compatible_os: '1|2',
            h5_dst_url: '',
            icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png',
            icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png?imageView2/1/w/110/h/110',
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png',
            img_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png?imageView2/1/w/660/h/370',
            ios_app_id_main: 0,
            ios_download_url: '',
            ios_sub_url: '',
            name: 'test',
            package_name: '1',
            slogan: '1',
            top: true,
            type: 0
          }
        ],
        gameRestList: [
          {
            android_download_url: 'http://65.xuqiu.com/requirements',
            android_game_version: '234234',
            android_package_size: '50',
            android_sub_url: '',
            app_id: 11111,
            category: '休闲放置',
            cch_id: 222,
            compatible_os: '1|2',
            h5_dst_url: '',
            icon_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png',
            icon_url: 'https://img02.rastargame.com/gameCenter/img/game/icon/n1/2018/09/12/1536734315438.png?imageView2/1/w/110/h/110',
            img_origin_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png',
            img_url: 'https://img02.rastargame.com/gameCenter/img/game/cover/n1/2018/09/12/1536734321670.png?imageView2/1/w/660/h/370',
            ios_app_id_main: 0,
            ios_download_url: '',
            ios_sub_url: '',
            name: 'test',
            package_name: '1',
            slogan: '1',
            top: true,
            type: 0
          }
        ]
      }
    },
    methods: {
      refresh: function (done) {
        console.log(666)
        done()
      },
      infinite: function () {
        console.log(7777)
      }
    }
  }
</script>

<style lang="scss">
  .page-wrapper {
    position: fixed;
    width: 100%;
    /*height: calc(100% - 2.4rem);*/
    height: 100%;
    padding-top: 2.4rem;
    overflow: hidden;
    transform: translate3d(0, 0, 0);
    -webkit-transform-style: preserve-3d;
    -webkit-backface-visibility: hidden;
    &::after {
      content: '';
      height: 2.4rem;
      width: 100%;
    }
  }
</style>

