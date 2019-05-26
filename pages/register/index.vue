<template>
  <section id="bindPhone">
    <teen-header withoutBg="true" back="true">
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
        <div class="user-form-item">
          <input class="form-input" v-model="loginPwdAgain" @keyup="changeInput" type="password" placeholder="请再次输入密码">
          <span class="form-icon">
                        <i class="icon userPwd"></i>
                    </span>
        </div>
        <div class="user-form-oper">
          <p>{{tips}}</p>
        </div>
      </div>
      <div class="user-oper">
        <div class="btn" :class="{'disabled': !canLogin}" @click="register">注册</div>
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
        loginPwdAgain: '',
        loginVerify: '',
        verifyImg: '',
        backPage: '',
        tips: ''
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
        this.$router.push({ name: route })
      },
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
      register: function () {
        let passReg = /^[0-9a-zA-Z~!@#$%^&*()_+{}\\|:"<>?/*\-+.[\];',./]+$/
        if (this.loginPwd != this.loginPwdAgain) {
          this.tips = '两次输入密码不一致，请检查'
          return false
        }
        if (!passReg.test(this.loginPwd)) {
          this.tips = '密码为数字字母组合，6-20位'
          return false
        }
        console.log(6666)
        this.$ajax.get(api.register,{
          params:{
            username: this.loginName,
            password: this.loginPwd
          }
        }).then((res)=>{
          if (res.data.code == 200) {
            console.log(res)
          }
        }).catch((error)=>{
          console.log(error)
        })
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


