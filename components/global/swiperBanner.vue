<template>
  <div class="game-page-banner">
    <swiper :options="swiperOption" ref="mySwiper" v-if="showEl">
      <swiper-slide v-for="(banner, index) in banners" :key="index">
        <div class="swiper-img img-loading" @click="goMovieDetail(banner.movie_id)">
          <img :src="banner.img_url">
        </div>
      </swiper-slide>
      <div class="swiper-pagination" slot="pagination"></div>
    </swiper>
  </div>
</template>

<script>
  export default {
    name: 'swiperBanner',
    props: ['banners'],
    data: function () {
      let vue = this
      return {
        showEl: true,
        swiperOption: {
          autoplay: {
            delay: 3000,
            stopOnLastSlide: false,
            disableOnInteraction: false
          },
          initialSlide: 0,
          slideToClickedSlide: true,
          loop: true,
          observer: true,
          mousewheelControl: true,
          pagination: {
            el: '.swiper-pagination',
            renderBullet: function (index, className) {
              return '<li class="' + className + '"><span class="bullet-in"></span></li>'
            }
          },
          on: {
            // 需要特殊处理第一张图
            init: function () {
              let index = vue.swiperOption.initialSlide
              if (this.pagination.bullets) {
                vue.$nextTick(() => {
                  this.pagination.bullets[index].className = 'swiper-pagination-bullet'
                  vue.$nextTick(() => {
                    this.pagination.bullets[index].className = 'swiper-pagination-bullet swiper-pagination-bullet-active'
                  })
                })
              }
            }
          }
        }
      }
    },
    methods: {
      goBanner: function (index) {
        let banner = this.banners[index]
        switch (banner.android_dst_type) {
          case 1:
            // 跳转游戏详情
            let appId = banner.android_dst_info.app_id
            this.$router.push({ name: 'gameDetail', params: { appId: appId } })
            break
          case 2:
            // 跳转落地页
            window.location.href = banner.web_dst_url
            break
          case 3:
            // 跳转资讯详情页
            let newsId = banner.news_id
            this.$router.push({ name: 'newsDetail', params: { newsId: newsId } })
            break
          case 4:
            // 跳转评论全部回复详情页
            break
        }
      },
      // 重置轮播
      reBuild: function () {
        this.showEl = false
        let activeIndex = this.$refs.mySwiper.swiper.activeIndex
        if (activeIndex >= this.banners.length) activeIndex = 0
        this.swiperOption.initialSlide = activeIndex
        this.$nextTick(() => {
          this.showEl = true
        })
      },
      goMovieDetail: function (id) {
        this.$router.push({ name: 'movieDetail-id',params: { id: id}})
      },
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/global/gameBanner.scss" scoped></style>
