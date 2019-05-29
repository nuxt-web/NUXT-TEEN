<template>
  <section id="bindPhone">
    <teen-header withoutBg="true">
      <p slot="back" @click="goBack">
        <i class="icon left" style="color: #969696"></i>
      </p>
    </teen-header>
    <div class="user-wrapper">
      <div class="user-logo" v-if="showLogo">
        <div class="logo"></div>
      </div>
      <div class="user-form">
        <div class="user-form-item">
          <input class="form-input" v-model="loginName" @keyup="changeInput" type="text" placeholder="请输入账号">
          <span class="form-icon">
                        <i class="icon userHead"></i>
                    </span>
        </div>
        <div class="user-form-item">
          <input class="form-input" v-model="loginPwd" @keyup="changeInput" type="password" placeholder="请输入密码">
          <span class="form-icon">
                        <i class="icon userPwd"></i>
                    </span>
        </div>
        <div class="user-form-oper">
          <p @click="goPage('register')">没有账号？马上注册</p>
        </div>
      </div>
      <div class="user-oper">
        <div class="btn" :class="{'disabled': !canLogin}" @click="login">登录</div>
      </div>
    </div>
  </section>
</template>

<script>
  import TeenHeader from './../../components/global/header'
  import crypto from 'crypto'
  import qs from 'qs'
  import api from "../../model/api.js"
  import tools from "../../model/tools.js"

  export default {
    name: 'login',
    components: {
      TeenHeader
    },
    data: function () {
      return {
        // 页面控制
        showVerify: false,
        refreshCount: 0,
        // 状态控制
        backToMine: false,
        canLogin: false,
        showLogo: true,
        // 数据
        token: {},
        loginName: '',
        loginPwd: '',
        loginVerify: '',
        verifyImg: '',
        backPage: ''
      }
    },
    methods: {
      // 返回上一页
      goBack: function () {
        if (this.backToMine) {
          this.$router.push({ name: 'mine' })
        } else {
          this.$router.back()
        }
      },
      // 去往新页面
      goPage: function (route) {
        if (route === 'register') window._hmt.push(['_trackEvent', '登录', '点击', '马上注册'])
        else if (route === 'findPwd') window._hmt.push(['_trackEvent', '登录', '点击', '忘记密码'])
        this.$router.push({ name: route })
      },
      /**
       * 修改输入框时，如果有验证码，那么用户名，密码验证码都不为空才可以登录
       * 如果没有，那么用户名，密码都不为空才可以登录
       */
      changeInput: function () {
        if (this.showVerify) {
          if (this.loginName.length > 0 && this.loginPwd.length > 0 && this.loginVerify.length > 0) {
            this.canLogin = true
          }
        } else {
          if (this.loginName.length > 0 && this.loginPwd.length > 0) {
            this.canLogin = true
          }
        }
      },
      // 登录
      login: function () {
        this.$ajax.get(api.login,{
          params:{
            username: this.loginName,
            password: this.loginPwd
          }
        }).then((res)=>{
          if (res.data.code == 200) {
            tools.setCookie('_TEEN_',res.data.data)
            this.$router.push({
              name: 'mine'
            })
          }
        }).catch((error)=>{
          console.log(error)
        })
      },
      // 获取Token
      getToken: function (callBack) {
        this.$ajax({
          url: this.$api.getToken,
          method: 'get'
        }).then((res) => {
          if (res.data.code === 200) {
            this.token = res.data.data
            res.data.data.vcode ? this.showVerify = true : this.showVerify = false
            if (callBack && !this.showVerify) {
              callBack()
            } else if (!this.verifyImg) {
              this.refreshVerify()
            } else {
              callBack()
            }
          } else {
            this.$store.dispatch('changeToastText', res.data.msg)
          }
        }).catch(() => {
          this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
        })
      },
      // 获得当前用户
      getCurrentUid: function () {
        this.$ajax({
          url: this.$api.getUid,
          method: 'get'
        }).then((res) => {
          if (res.data.code === 200) {
            this.$store.dispatch('setUid', res.data.data)
          }
        }).catch((err) => {
          console.log(err)
        })
      },
      // 进行登录操作
      doLogin: function () {
        // 如果有token才进行登录
        if (this.token.token) {
          let params = {
            vname: this.loginName,
            pwd: crypto.createHash('md5').update(this.loginPwd).digest('hex'),
            token: this.token.token,
            tt: this.token.tt,
            source: 'web'
          }
          this.showVerify ? params.vcode = this.loginVerify : ''
          this.$ajax({
            url: this.$api.login,
            method: 'post',
            data: qs.stringify(params)
          }).then((res) => {
            if (res.data.code === 200) {
              this.$store.dispatch('changeToastText', '登录成功')
              this.getCurrentUid()
              if (this.backPage === 'register') {
                this.$router.push({ name: 'mine' })
              } else {
                this.$router.back()
              }
            } else {
              this.refreshVerify()
              this.$store.dispatch('changeToastText', res.data.msg)
              this.resetInput()
            }
          }).catch(() => {
            this.refreshCount = 0
            this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
            this.resetInput()
          })
        } else {
          this.resetInput()
        }
      },
      // 重置登录模块输入框
      resetInput: function () {
        this.loginPwd = ''
        this.loginVerify = ''
        this.canLogin = false
      }
    },
    beforeRouteEnter: function (to, from, next) {
      // 如果是从注册页跳转回来的话，那么点击返回按钮则跳转回我的页面
      next(vm => {
        vm.backPage = from.name
        if (from.name === 'register') {
          vm.backToMine = true
        }
      })
    }
  }
</script>
<style lang="scss" src="./../../assets/css/views/login/login.scss" scoped></style>


