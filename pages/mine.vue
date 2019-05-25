<template>
  <section id="mine">
    <div class="mine-me">
      <div class="me-head">
        <div class="head">
          <div class="avatar" v-if="!isLogin">
            <img src="./../static/mine/corn.png" alt="">
          </div>
          <div class="avatar" v-if="isLogin">
            <img :src="userInfo.avator" alt="">
          </div>
          <div class="edit" @click="logout" v-if="isLogin">
            <p>退出登陆</p>
          </div>
          <div class="edit" @click="goPage('login')" v-if="!isLogin">
            <p>前往登陆</p>
          </div>
        </div>
        <div class="body" v-if="isLogin">
          <span>{{userInfo.user_name}}</span>
        </div>
        <div class="body" v-if="!isLogin">
          <span>登陆更精彩哦~</span>
        </div>
        <div class="footer" v-if="isLogin">
          <p class="text">看过的电影：<span>{{userInfo.watched_movie}}</span></p>
        </div>
      </div>
    </div>
    <div v-if="isLogin">
      <mine-tab></mine-tab>
      <section class="mine-wrapper">
        <nuxt-child/>
      </section>
    </div>

    <div v-if="!isLogin" class="reg">
      <p>还没有账号？点击 <span @click="goPage('register')">注册</span> 吧</p>
    </div>

    <div class="mine-bg"></div>

    <teen-footer></teen-footer>
    <!-- 页面底部 -->
    <!--<transition :name="footerTransition">-->
      <!--<rastar-footer v-if="showFooter"></rastar-footer>-->
    <!--</transition>-->
    <!-- 页面底部 结束 -->

    <!--<transition name="fade">-->
      <!--<rastar-dialog v-if="showLogout" type="close" @close="close">-->
        <!--<div class="body-title" slot="body">是否退出当前账号？</div>-->
        <!--<div class="btns" slot="footer">-->
          <!--<div class="btn cancel" @click="close">取消</div>-->
          <!--<div class="btn submit" @click="logout">确定</div>-->
        <!--</div>-->
      <!--</rastar-dialog>-->
    <!--</transition>-->
  </section>
</template>

<script>
  import TeenHeader from './../components/global/teenScroller'
  import TeenScroller from "./../components/global/teenScroller";
  import TeenFooter from "./../components/global/footer"
  import MineTab from "./../components/mine/MineTab"
  import api from "../model/api.js"

  export default {
    name: 'mine',
    components: {
      TeenHeader,
      TeenFooter,
      TeenScroller,
      MineTab
    },
    data: function () {
      return {
        isLogin: false,
        canDownload: false,
        showLogout: false,
        showFooter: true,
        footerTransition: '',
        haveNotice: false,
        newmessage: false,
        color: [],
        userInfo: {}
      }
    },
    methods: {
      // 页面跳转
      goPage: function (route) {
        this.$router.push({ name: route })
      },
      // 获取用户信息
      getrtef: function (done) {
        console.log(444)
        done()
      },
      // 滑动事件
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
      },
      getUserInfo: function (uid) {
        this.$ajax.get(api.getUserInfo,{
          params:{
            uid: uid
          }
        }).then((res)=>{
          if (res.data.code == 200) {
            this.userInfo = res.data.data
            this.isLogin = true
          }
        }).catch((error)=>{
          console.log(error)
        })
      },
      logout: function () {
        this.$tools.clearCookie('_TEEN_')
        this.$router.push({name: 'teen'})
      }
    },
    mounted: function () {
      let uid = this.$tools.getCookie('_TEEN_')
      if (uid) {
        this.getUserInfo(uid)
      }else {
        console.log(7777)
      }
    }
  }
</script>

<style lang="scss" src="./../assets/css/components/mine/mine.scss" scoped></style>
