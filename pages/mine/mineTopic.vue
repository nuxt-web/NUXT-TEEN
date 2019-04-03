<template>
  <teen-scroller ref="scroller">
    <div class="mine-card mine-list">
      <div class="mine-list-item" @click="goPage('myNotice')">
        <div class="list-left">
                        <span class="list-icon">
                            <i class="icon mailIcon"></i>
                        </span>
          <span class="list-label">我的消息</span>
        </div>
        <div class="list-right">
          <i class="icon right"></i>
        </div>
      </div>
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
      <div class="mine-list-item" @click="goPage('security')">
        <div class="list-left">
                        <span class="list-icon">
                            <i class="icon securityIcon"></i>
                        </span>
          <span class="list-label">安全中心</span>
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
          <span class="list-label">客服中心</span>
        </div>
        <div class="list-right">
          <i class="icon right"></i>
        </div>
      </div>
    </div>
  </teen-scroller>
</template>

<script>
  import TeenScroller from './../../components/global/teenScroller'
  export default {
    name: "mineTopic",
    components: {
      TeenScroller
    },
    methods: {
      getrtef: function (done) {
        console.log(444)
        done()
      },
      onScroll: function () {
        console.log('onscroll')
      }
    }
  }
</script>

<style lang="scss" src="./../../assets/css/components/mine/mine.scss" scoped></style>
