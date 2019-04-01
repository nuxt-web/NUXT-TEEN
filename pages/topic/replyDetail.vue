<template>
<div>
    <back-header></back-header>
    <topic-post :postType = "'2'"></topic-post>
    <reply-filter></reply-filter>
    <reply-item v-for="i in 3" @showReply="showReply"></reply-item>
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
<style src="./../../assets/css/views/topic/replyDetail.scss" lang="scss"></style>