<template>
    <scroller ref="scroller" :style="{ 'padding-top': padding, 'color': color?color.body_main:''}" :on-refresh="refresh" :on-infinite="infinite" :noDataText="noDataText"
        :refreshLayerColor="textColor" :loadingLayerColor="textColor" :on-scroll="onScroll" >
        <slot></slot>
    </scroller>
</template>

<script>
    export default {
        name: 'scroller',
        data: function () {
            return {
                scrollTop: 0,
                noDataText: '没有更多数据了 ლ(´•д• ̀ლ',
                textColor: '#969696'
            }
        },
        props: ['refresh', 'infinite', 'padding', 'color'],
        methods: {
            // 获取当前滑动距离
            // getScrollerTop: function () {
            //     if (this.$refs.scroller) {
            //         return this.$refs.scroller.getPosition().top
            //     } else {
            //         return 0
            //     }
            // },
            // 滑动到某处
            scrollTo: function (y, isAnimate) {
                setTimeout((vm) => {
                    vm.$refs.scroller.scrollTo(0, parseInt(y), isAnimate)
                }, 10, this)
            },
            // 返回顶部
            // backToTop: function () {
            //     this.$refs.scroller.scrollTo(0, 0, true)
            // },
            // 记录滑动
            onScroll: function (scroll) {
                this.$emit('scroll', scroll.top)
            },
            // 记录滑动
            // onScroll: function () {
            //     this.timer = setInterval(() => {
            //         let top = this.$refs.scroller.getPosition().top
            //         this.scrollTop = top
            //         this.$emit('scroll', top)
            //     }, 50)
            // },
            // 隐藏底部文字
            hideMore: function () {
                this.noDataText = ''
            }
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

<style lang="scss" src="./../../assets/css/components/global/scroller.scss" scoped></style>
