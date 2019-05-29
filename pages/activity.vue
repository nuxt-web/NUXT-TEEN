<template>
<div>
    <!-- 页面头部 -->
    <teen-header redBg="true">
        <div class="title" slot="title">活动</div>
    </teen-header>
    <!-- 页面头部 结束 -->

    <div>
        <nuxt-child></nuxt-child>
    </div>

    <activity-tab></activity-tab>
    <teen-footer></teen-footer>
</div> 
</template>
<script>
import TeenHeader from '../components/global/header'
import TeenFooter from "../components/global/footer"
import ActivityTab from '../components/activity/activityTab'
export default {
    components: {
        TeenHeader,
        TeenFooter,
        ActivityTab
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>
<style lang="scss" scoped>
.page-main {
    padding: 2.4rem 0 4rem;
}
</style>
