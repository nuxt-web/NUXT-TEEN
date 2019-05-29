<template>
<div class="reply-page">
    <back-header :backTitle="'回复'"></back-header>
    <topic-post :postList="postList" :postType = "'2'"></topic-post>
    <!-- <reply-filter></reply-filter> -->
    <div class="line">回复</div>
    <reply-item :replyList="replyList" @showReply="showReply"></reply-item>
    <common-mask></common-mask>
    <reply-btn @reply="showReply"></reply-btn>
    <transition name="fade">
        <div class="mask" v-if="isShowReply">
            <reply-edit @submitReply="submitReply" @cancelReply="cancelReply"></reply-edit>
        </div>
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
import ReplyBtn from './../../components/topic/replybtn'
import {getFetch, postFetch} from './../../model/request'
import API from './../../model/api'
import Tool from '../../model/tools';
export default {
    components: {
        BackHeader,
        topicPost,
        ReplyItem,
        ReplyFilter,
        CommonMask,
        ReplyEdit,
        ReplyBtn
    },
    data () {
        return {
            isShowReply: false,
            post_id: '',
            postList: [],
            replyList: []
        }
    },
    methods: {
        // 获取文章
        async getPost () {
            let params = {
                post_id: this.post_id
            }
            let res = await getFetch(API.getPost, params)
            if (res.data.code === 200) this.postList = res.data.data
        },
        showReply () {
            console.log('点击')
            this.isShowReply = !this.isShowReply
        },
        async getPostReply () {
            let params = {
                post_id: this.post_id
            }
            let res = await getFetch(API.getPostReply, params)
            if (res.data.code === 200) this.replyList = res.data.data
        },
        async submitReply (content) {
            let date = new Date().getTime() 
            let data = {
                content,
                user_id: '100523',
                post_id: this.post_id,
                create_tm: date
            }
            let res = await postFetch(API.addPostReply, data)
            if (res.data.code === 200) {
                this.isShowReply = false
                let {avator, user_name} = Tool.getSession('user_info')
                let replyItem = {
                    content,
                    // user_id: '100523',
                    // post_id: this.post_id,
                    avator,
                    user_name,
                    create_tm: date
                }
                this.replyList.unshift(replyItem)
            }
            // this.isShowReply = false
        },
        cancelReply () {
            this.isShowReply = false
        }
    },
    mounted () {
        this.post_id = this.$route.params.id
        this.getPost()
        this.getPostReply()
    }
}
</script>
<style lang="scss" scoped>
.reply-page {
    padding-bottom: 3rem;
}
// .post-holder {
//     padding: 0 !important;
// }
// .post {
//         margin: 0 !important;
//         border-radius: 0 !important;
//     }
.line {
    font-size: .8rem;
    padding: .5rem;
    border-bottom: 1px solid #cccccc;
    color: #505050;
}
</style>
