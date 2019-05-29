<template>
<div>
  <teen-scroller ref="scroller">
    <div class="mine-card mine-list">
      <div class="mine-list-item" @click="goPage('myGame')">
        <div class="list-left">
                        <span class="list-icon">
                            <i class="icon gameIcon"></i>
                        </span>
          <span class="list-label">我的电影</span>
        </div>
        <div class="list-right">
          <i class="icon right"></i>
        </div>
      </div>
    </div>
    <div class="mine-card mine-list">
      <div class="mine-list-item" @click="goPage('changePwd')">
        <div class="list-left">
                                    <span class="list-icon">
                                        <i class="icon changePwdIcon"></i>
                                    </span>
          <span class="list-label">修改密码</span>
        </div>
        <div class="list-right">
          <i class="icon right"></i>
        </div>
      </div>
    </div>
    <div class="mine-card mine-list">
      <div class="mine-list-item" @click="goPage('customer')">
        <div class="list-left">
                        <span class="list-icon">
                            <i class="icon serviceIcon"></i>
                        </span>
          <span class="list-label">修改信息</span>
        </div>
        <div class="list-right">
          <i class="icon right"></i>
        </div>
      </div>
    </div>
    <div class="mine-btn" @click="loginOut">退出账号</div>
  </teen-scroller>
</div>
</template>

<script>
  import TeenScroller from './../../components/global/teenScroller'
  export default {
    name: "mineTopic",
    components: {
      TeenScroller
    },
    data: function () {
      return {
        showLogout: false,
      }
    },
    methods: {
      getrtef: function (done) {
        console.log(444)
        done()
      },
      onScroll: function () {
        console.log('onscroll')
      },
      loginOut: function () {
        this.$tools.clearCookie('_TEEN_')
        
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/mine/mine.scss" scoped></style>
