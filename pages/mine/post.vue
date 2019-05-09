<template>
  <teen-scroller ref="scroller" :refresh="getrtef" @scroll="onScroll">
    <div class="me-card post-card">
    <div class="post-head">
      <div class="post-avatar">
        <img src="http://mydatabase.com/user/cat.jpg" alt="">
      </div>
      <div class="post-name">
        <div class="name">
          <p>血小板</p>
        </div>
        <div class="time">
          <p>49分钟前</p>
        </div>
      </div>
    </div>
    <div class="post-content word">
      <p>故事讲述了夏目贵志从外祖母夏目玲子的遗物中得到了那些由契约书所做成的“友人帐”，他决定将友人帐中妖怪们的名字一一归还。在夏目身边，开始聚集起各种各样的妖怪们。能看到妖怪的少年夏目贵志，与招财猫外表的妖怪斑一起，为大家讲述一个个奇异、悲伤、怀念、令人感动的温馨故事。</p>
    </div>
    <div class="post-content tags">
      <div class="tag">
        夏目友人帐
      </div>
    </div>
    <div class="post-footer">
      <div class="like">
        <i class="icon gameIcon"></i>
      </div>
    </div>
  </div>
    <div class="me-card post-card">
      <div class="post-head">
        <div class="post-avatar">
          <img src="http://mydatabase.com/user/cat.jpg" alt="">
        </div>
        <div class="post-name">
          <div class="name">
            <p>血小板</p>
          </div>
          <div class="time">
            <p>49分钟前</p>
          </div>
        </div>
      </div>
      <div class="post-content word">
        <p>故事讲述了夏目贵志从外祖母夏目玲子的遗物中得到了那些由契约书所做成的“友人帐”，他决定将友人帐中妖怪们的名字一一归还。在夏目身边，开始聚集起各种各样的妖怪们。能看到妖怪的少年夏目贵志，与招财猫外表的妖怪斑一起，为大家讲述一个个奇异、悲伤、怀念、令人感动的温馨故事。</p>
      </div>
      <div class="post-content tags">
        <div class="tag">
          夏目友人帐
        </div>
      </div>
      <div class="post-footer">
        <div class="like">
          <i class="icon gameIcon"></i>
        </div>
      </div>
    </div>
    <div class="me-card post-card">
      <div class="post-head">
        <div class="post-avatar">
          <img src="http://mydatabase.com/user/cat.jpg" alt="">
        </div>
        <div class="post-name">
          <div class="name">
            <p>血小板</p>
          </div>
          <div class="time">
            <p>49分钟前</p>
          </div>
        </div>
      </div>
      <div class="post-content word">
        <p>故事讲述了夏目贵志从外祖母夏目玲子的遗物中得到了那些由契约书所做成的“友人帐”，他决定将友人帐中妖怪们的名字一一归还。在夏目身边，开始聚集起各种各样的妖怪们。能看到妖怪的少年夏目贵志，与招财猫外表的妖怪斑一起，为大家讲述一个个奇异、悲伤、怀念、令人感动的温馨故事。</p>
      </div>
      <div class="post-content tags">
        <div class="tag">
          夏目友人帐
        </div>
      </div>
      <div class="post-footer">
        <div class="like">
          <i class="icon gameIcon"></i>
        </div>
      </div>
    </div>
  </teen-scroller>
</template>

<script>
  import TeenScroller from './../../components/global/teenScroller'
    export default {
        name: "post",
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

<style lang="scss" src="./../../assets/css/components/mine/mineIndex.scss"></style>
