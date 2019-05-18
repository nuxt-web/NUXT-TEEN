<template>
<div>
    <back-header :backTitle="'四条回复'"></back-header>
    <topic-post :postType = "'2'"></topic-post>
    <reply-filter></reply-filter>
    <reply-item v-for="(i,index) in 3" @showReply="showReply" :key="index"></reply-item>
    <common-mask></common-mask>
    <transition name="fade">
        <reply-edit v-if="isShowReply" @submitReply="submitReply" @cancelReply="cancelReply"></reply-edit>
    </transition>
</div> 
</template>
<script>
import topicPost from './../../components/topic/post.vue'
import BackHeader from './../../components/common/backHeader'
import ReplyFilter from './../../components/topic/filter'
import ReplyItem from './../../components/topic/replyItem'
import CommonMask from './../../components/common/commonMask'
import ReplyEdit from './../../components/topic/replyEdit'
export default {
    components: {
        BackHeader,
        topicPost,
        ReplyItem,
        ReplyFilter,
        CommonMask,
        ReplyEdit
    },
    data () {
        return {
            isShowReply: false
        }
    },
    methods: {
        showReply () {
            console.log('点击')
            this.isShowReply = !this.isShowReply
        },
        submitReply () {
            this.isShowReply = false
        },
        cancelReply () {
            this.isShowReply = false
        }
    }
}
</script>
<style lang="scss" scoped>
// .post-holder {
//     padding: 0 !important;
// }
// .post {
//         margin: 0 !important;
//         border-radius: 0 !important;
//     }
</style>
