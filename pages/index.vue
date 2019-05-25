<template>
  <main id="game">
    <div class="mine-bg"></div>
    <div class="container">
      <div class="logo">
        <img src="./../static/images/logo-mini-3.png" alt="">
      </div>
      <div class="btns">
        <div class="btn login" @click="goPage('login')">
          <p>登陆</p>
        </div>
        <div class="btn reg" @click="goPage('reg')">
          <p>注册</p>
        </div>
      </div>
      <div class="skip">
        <div @click="goPage('teen')">
          <h4>立即体验</h4>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
  export default {
    name: 'Game',
    data: function () {
      return {
        
      }
    },
    methods: {
      goPage: function(name){
        this.$router.push({name: name})
      }
    },
    mounted: function(){
      
    }
  }
</script>

<style src="./../assets/css/views/index/index.scss" lang="scss" scoped></style>

