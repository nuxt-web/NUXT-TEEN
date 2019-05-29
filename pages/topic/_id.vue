<template>
<div>
    <!-- <teen-scroller :refresh="pushNews" :infinite="pullReply"> -->
        <topic-content :detail="topicDetail" v-if="isRouterAlive"></topic-content>
        <topic-post :postList = "postList" :postType = "1"></topic-post>
        <topic-button :topicId="id" :topicObj="topicObj" @click.native="goPage"></topic-button>
    <!-- </teen-scroller> -->
</div> 
</template>
<script>
import topicContent from './../../components/topic/content.vue'
import topicPost from './../../components/topic/post.vue'
import TeenScroller from './../../components/global/teenScroller'
import topicButton from './../../components/topic/button'
import { getFetch } from './../../model/request'
import Api from './../../model/api'
import Tool from './../../model/tools'
export default {
    components: {
        topicContent,
        topicPost,
        TeenScroller,
        topicButton
    },
    data () {
        return {
            postNum: 6,
            isRouterAlive: true,
            postList: [],
            id: '',
            topicDetail: {},
            topicObj: {}
        }
    },
    methods: {
        async getTopicDetail () {
            let sendData = {
                id: this.id
            }
            let res = await getFetch(Api.getTopicDetail, sendData)
            if (res.data.code === 200) {
                this.topicDetail = res.data.data
                this.topicObj = {
                    name: this.topicDetail.name,
                    id: this.id
                    // post_num: 0
                }
                Tool.setSession('edit-topic', [this.topicObj])
            }
        },
        async pushPostList () {
            let params = {
                topic_id: this.id
            }
            let res = await getFetch(Api.getPostList, params)
            if (res.data.code === 200) {
                this.postList = res.data.data
            }
        },
        pushNews (done) {
            console.log('push')
            done()
        },
        pullReply (done) {
            console.log('pull')
            this.postNum += 6
            if (this.postNum >= 12) done(true)
        },
        reload () {
            this.isRouterAlive = false
            this.$nextTick(() => (this.isRouterAlive = true))
        },
        goPage () {
            console.log('hhhh')
        }
    },
    mounted () {
        this.id = this.$route.params.id
        this.getTopicDetail()
        this.pushPostList()
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>