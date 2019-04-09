<template>
  <main id="news">
    <!-- 页面头部 -->
    <teen-header redBg="true">
      <div class="title" slot="title">话题中心</div>
    </teen-header>
    <!-- 页面头部 结束 -->

    <div class="page-wrapper">
      <teen-scroller ref="scroller" padding='2.4rem' :refresh="pushNewsList" :infinite="pullNewsList" @scroll="onScroll">
        <div class="news-item" v-for="i in 5" @click="goPage()">
          <div class="news-img img-loading">
            <img src="" alt="">
          </div>
          <div class="news-info">
            <div class="des">是枝裕和</div>
            <div class="info">
              <p class="date">2019-10-24</p>
              <p class="comment">
                <i class="icon replyIcon"></i>66
              </p>
            </div>
          </div>
        </div>
      </teen-scroller>
    </div>
    <!--<div class="page-loading">-->
    <!--<rastar-loading></rastar-loading>-->
    <!--</div>-->

    <!-- 页面底部 -->
      <teen-footer></teen-footer>
    <!-- 页面底部结束 -->
  </main>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import TeenScroller from "../../components/global/teenScroller";
  import TeenFooter from "../../components/global/footer"
    export default {
      name: "index",
      components: {
        TeenHeader,
        TeenScroller,
        TeenFooter
      },
      methods: {
        // 下拉刷新资讯列表
        pushNewsList: function (done) {
          done()
        },
        // 无限加载资讯列表
        pullNewsList: function (done) {
          done()
        },
        goPage: function () {
          this.$router.push({ name: 'topic-detail' })
        },
        // 滚动事件
        onScroll: function (scroll) {
          if (this.scrollTop - scroll < -20) {
            this.footerTransition = 'slideDown'
            this.$nextTick(() => {
              this.showFooter = false
            })
          } else if (this.scrollTop - scroll > 20) {
            this.footerTransition = 'slideUp'
            this.$nextTick(() => {
              this.showFooter = true
            })
          }
          this.scrollTop = scroll
        }
      },
    }
</script>

<style lang="scss" src="./../../assets/css/views/news/news.scss" scoped></style>
