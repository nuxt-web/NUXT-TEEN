<template>
  <div class="game-active">
    <div class="game-active-title">
      <div class="label"><img src="./../../static/images/label.png" alt=""></div>
      <p class="title-name">{{title}}</p>
      <!--<p class="title-more" @click="goPage('activity')">查看更多</p>-->
    </div>
    <div class="game-active-swiper">
      <swiper :options="swiperOption" ref="mySwiper">
        <!-- slides -->
        <swiper-slide v-for="(activity, index) in list" :key="index">
          <div class="slide-img img-loading" @click="goActivity(index)">
            <img :src="activity.img_url">
          </div>
        </swiper-slide>
        <swiper-slide v-if="activities.length > 5">
          <div class="slide-img slide-last" @click="goActivity(-1)">
            <img :src="activities[5].img_url">
            <div class="slide-last-box">
              <img src="./../../static/images/activity-more.png">
              <p>查看更多电影</p>
            </div>
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
      // 活动页跳转
      goActivity: function (index) {
        if (index >= 0) {
          let current = this.activities[index]
          window._hmt.push(['_trackEvent', '游戏中心（首页）', '点击', '活动图片'])
          switch (current.android_dst_type) {
            case 1:
              // 跳转游戏详情
              let id = current.android_dst_info.app_id
              this.$router.push({ name: 'gameDetail', params: { appId: id } })
              break
            case 2:
              // 跳转落地页
              window.location.href = current.web_dst_url
              break
            case 3:
              // 跳转资讯详情页
              this.$router.push({ name: 'newsDetail', params: { newsId: current.news_id } })
              break
          }
        } else {
          window._hmt.push(['_trackEvent', '游戏中心（首页）', '点击', '查看更多活动（图片）'])
          this.$router.push({ name: 'activity' })
        }
      },
      // 跳转到更多活动
      goPage: function (route) {
        this.$router.push({ name: route })
        window._hmt.push(['_trackEvent', '游戏中心（首页）', '点击', '查看更多活动'])
      }
    },
    created: function () {
      this.list = this.activities.slice(0, 5)
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/movie/MovieSwiper.scss" scoped></style>
