<template>
<div>
    <!-- <teen-scroller :refresh="pushNews" :infinite="pullReply"> -->
        <topic-content v-if="isRouterAlive"></topic-content>
        <topic-post :postList = "postList" :postType = "1"></topic-post>
        <topic-button @click.native="goPage"></topic-button>
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
        }
    },
    methods: {
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
        this.pushPostList()
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>