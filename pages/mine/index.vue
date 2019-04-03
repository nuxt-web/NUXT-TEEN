<template>
  <teen-scroller ref="scroller" :refresh="getrtef">
    <div class="me-card me-list">
      <div class="me-list-item-content">
        <div class="cover">
          <img src="" alt="">
        </div>
        <div class="content">
          <div class="title">
            <p>我收藏的电影</p>
          </div>
          <div class="count">
            <p>155部电影</p>
          </div>
        </div>
      </div>
    </div>
    <div class="me-card me-list">
      <div class="me-list-item-content">
        <div class="cover">
          <img src="" alt="">
        </div>
        <div class="content">
          <div class="title">
            <p>我收藏的图解</p>
          </div>
          <div class="count">
            <p>155部图解</p>
          </div>
        </div>
      </div>
    </div>
    <div class="me-card my-diary">
      <div class="diray-title">
        <span>我的电影日记</span>
      </div>
      <div class="diray-item" v-for="item in diary">
        <div class="item-title">
          <div class="spot"></div>
          <div class="time">
            {{item.time}}
          </div>
        </div>
        <div class="item-body">
          <div class="item-content">
            <img :src="item.imgUrl" alt="">
          </div>
        </div>
      </div>
    </div>
  </teen-scroller>
</template>

<script>
  import TeenScroller from './../../components/global/teenScroller'
  export default {
    name: 'mineIndex',
    data: function () {
      return {
        diary: [
          {
            time: '2018-06-17',
            imgUrl: require('../../static/images/BLUE1.jpg')
          },
          {
            time: '2018-06-17',
            imgUrl: require('../../static/images/KISS.jpg')
          },
          {
            time: '2018-06-17',
            imgUrl: require('../../static/images/LIFTRES.jpg')
          },
          {
            time: '2018-06-17',
            imgUrl: require('../../static/images/VEMON.jpg')
          },
          {
            time: '2018-06-17',
            imgUrl: require('../../static/images/COMEDY.jpg')
          }
        ]
      }
    },
    methods: {
      goPage: function (route) {
        switch (route) {
          case 'lottery':
            this.$router.push({name: route})
            break
          // 普通页跳转
          case 'about':
          case 'me':
          case 'customer':
            if (route === 'about') this.trackEvent('关于')
            else if (route === 'me') this.trackEvent('编辑资料')
            else if (route === 'customer') this.trackEvent('客服中心')
            this.$router.push({name: route})
            break
          // case 'scoreShop':
          //     window.location.href = window.CUSTOM_DOMAIN + '/shop/'
          //     break
          case 'feedback':
            window._hmt.push(['_trackEvent', '我的主页', '点击', '意见反馈'])
            window.location.href = window.CUSTOM_DOMAIN + '/bbs/channel/9'
            break
          // 敬请期待
          case 'starCoin':
            window._hmt.push(['_trackEvent', '我的主页', '点击', '星币充值'])
            break
          case 'shop':
          case 'changePwd':
            if (route === 'shop') this.trackEvent('积分商城')
            else this.trackEvent('修改密码')
            this.$router.push({name: route})
            break
          // 需要登录才能进的页
          case 'getScore':
          case 'security':
          case 'score':
          case 'level':
          case 'gameBox':
          case 'myGame':
          case 'myNotice':
            if (route === 'getScore') this.trackEvent('赚取积分')
            else if (route === 'security') this.trackEvent('安全中心')
            else if (route === 'score') this.trackEvent('我的积分')
            else if (route === 'level') this.trackEvent('我的等级')
            else if (route === 'gameBox') this.trackEvent('存宝箱')
            else if (route === 'myGame') this.trackEvent('我的游戏')
            else if (route === 'myNotice') this.trackEvent('消息')
            let userInfo = this.$xh.getCookieArray('_XH_U_CL')
            if (userInfo[0]) {
              this.$router.push({
                name: route
              })
            } else {
              this.$router.push({
                name: 'login'
              })
            }
            break
        }
      },
      getrtef: function (done) {
        console.log(444)
        done()
      }
    },
    components: {
      TeenScroller
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/mine/mineIndex.scss"></style>
