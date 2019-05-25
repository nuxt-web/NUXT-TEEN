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
    <!--<div class="me-card me-list">-->
      <!--<div class="me-list-item-content">-->
        <!--<div class="cover">-->
          <!--<img src="" alt="">-->
        <!--</div>-->
        <!--<div class="content">-->
          <!--<div class="title">-->
            <!--<p>我收藏的图解</p>-->
          <!--</div>-->
          <!--<div class="count">-->
            <!--<p>155部图解</p>-->
          <!--</div>-->
        <!--</div>-->
      <!--</div>-->
    <!--</div>-->
    <div class="me-card my-diary">
      <div class="diray-title">
        <span>我的电影日记</span>
      </div>
      <div class="diray-item" v-for="(item,index) in diary" :key="index">
        <div class="item-title">
          <div class="spot"></div>
          <div class="time">
            {{item.diary_time}}
          </div>
        </div>
        <div class="item-body">
          <div class="item-content">
            <img :src="item.img_url" alt="">
          </div>
        </div>
      </div>
    </div>
  </teen-scroller>
</template>

<script>
  import TeenScroller from './../../components/global/teenScroller'
  import api from "../../model/api.js"
  export default {
    name: 'mineIndex',
    data: function () {
      return {
        diary: []
      }
    },
    methods: {
      getrtef: function (done) {
        console.log(444)
        done()
      },
      getUserInfo: function (uid) {
        this.$ajax.get(api.getUserInfo,{
          params:{
            uid: uid
          }
        }).then((res)=>{
          if (res.data.code == 200) {
            this.diary = res.data.diary
          }
        }).catch((error)=>{
          console.log(error)
        })
      },
    },
    created: function(){
      // console.log(TouchList)
      let uid = this.$tools.getCookie('_TEEN_')
      if (uid) {
        this.getUserInfo(uid)
      }else {
        console.log(7777)
      }
    },
    components: {
      TeenScroller
    },
  }
</script>

<style lang="scss" src="./../../assets/css/components/mine/mineIndex.scss"></style>
