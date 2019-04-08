<template>
<div>
    <!-- 页面头部 -->
    <teen-header redBg="true">
        <div class="title" slot="title">活动</div>
    </teen-header>
    <!-- 页面头部 结束 -->

    <div class="page-main">
        <topic :titleName="'热门'" :pageName="'activity-graphic'"></topic>
        <item></item>
        <topic :titleName="'热门图解'" :pageName="'activity-graphic'"></topic>
        <graphic></graphic>
    </div>
    <teen-footer></teen-footer>
    <!-- <list></list> -->
</div> 
</template>
<script>
import TeenHeader from '../../../components/global/header'
import Topic from '../../../components/topic/title.vue'
import Item from '../../../components/topic/item.vue'
import List from '../../../components/topic/list.vue'
import Graphic from '../../../components/film/graphic/item'
import TeenFooter from "../../../components/global/footer"
export default {
    components: {
        TeenHeader,
        Topic,
        Item,
        List,
        Graphic,
        TeenFooter
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>
<style lang="scss" scoped>
.page-main {
    padding: 2.4rem 0 4rem;
}
</style>

