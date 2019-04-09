<template>
<div>
    <!-- 页面头部 -->
    <!-- <teen-header redBg="true">
        <div class="title" slot="title">活动</div>
    </teen-header> -->
    <!-- 页面头部 结束 -->

    <!-- <div class="page-main">
        <topic :titleName="'热门话题'" :pageName="'activity-topic'"></topic>
        <item></item>
        <topic :titleName="'热门图解'" :page-name="'activity-graphic'"></topic>
        <graphic></graphic>
    </div> -->
    <!-- <activity-tab></activity-tab>
    <teen-footer></teen-footer> -->
    <!-- <list></list> -->
    <div class="page-main">
        <!-- <teen-scroller> -->
            <item></item>
        <!-- </teen-scroller> -->
    </div>
</div> 
</template>
<script>
import Item from '../../components/topic/item.vue'
import TeenScroller from '../../components/global/scroller'
export default {
    components: {
        Item,
        TeenScroller
    },
    methods: {
        pushTopic (done) {
            console.log('push')
            done()
        },
        pullTopic (done) {
            console.log('pull')
            done(true)
        }
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>
<style lang="scss" scoped>
.page-main {
    padding: 4.8rem 0 4rem;
}
</style>

