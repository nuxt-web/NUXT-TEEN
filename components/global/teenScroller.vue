<template>
    <scroller :on-refresh="refresh" :on-infinite="infinite" :noDataText="noDataText" :refreshLayerColor="textColor" :loadingLayerColor="textColor" :on-scroll="onScroll" :style="{ 'padding-top': padding }">
      <slot></slot>
    </scroller>
</template>

<script>
    export default {
      name: "teenScroller",
      data: function () {
        return {
          scrollTop: 0,
          noDataText: '没有更多数据了 ლ(´•д• ̀ლ',
          textColor: '#969696'
        }
      },
      props: ['refresh', 'infinite', 'padding'],
      methods: {
        scrollTo: function (y, isAnimate) {
          setTimeout((vm) => {
            vm.$refs.scroller.scrollTo(0, parseInt(y), isAnimate)
          }, 10, this)
        },
        onScroll: function (scroll) {
          this.$emit('scroll', scroll.top)
        },
      },
      mounted: function () {
        // 传入参数scroll，不然会报错
        this.onScroll(scroll)
      },
      beforeDestroy: function () {
        clearInterval(this.timer)
      }
    }
</script>

<style lang="scss" scoped>
  .page-wrapper.full ._v-container {
    height: 100% !important;
  }

  ._v-container{
    /*height: calc(100% - 2.4rem) !important;*/
  // overflow:hidden;
  }
  ._v-content {
  // overflow: hidden;
    min-height: 100%;
  &:before {
     content: '';
     height: 0;
   }
  }

  .no-data-text{
    font-size: .5rem;
    height: 2rem;
    line-height: 2rem;
  }
</style>
