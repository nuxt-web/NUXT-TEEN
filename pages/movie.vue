<template>
  <main id="game">
    <!-- 页面头部 -->
    <teen-header redBg="true">
      <div class="logo" slot="title">
        <img src="../static/images/logo-mini-3.png">
      </div>
    </teen-header>
    <div class="game-detail-tabs">
      <movie-tab ref="detailTab"></movie-tab>
    </div>

    <section class="page-wrapper" style="padding-top: 2.4rem">
      <teen-scroller padding="4.8rem" :refresh="refresh">
        <nuxt-child/>
      </teen-scroller>
    </section>

    <teen-footer></teen-footer>
  </main>
</template>

<script>
  import TeenHeader from '../components/global/header'
  import TeenScroller from "../components/global/teenScroller";
  import MovieTab from "../components/movie/MovieTab";

  import TeenFooter from "../components/global/footer"

  export default {
    name: 'Game',
    components: {
      TeenHeader,
      TeenScroller,
      TeenFooter,
      MovieTab
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
