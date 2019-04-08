<template>
<div>
    <teen-scroller :refresh="pushNews" :infinite="pullReply">
        <topic-content v-if="isRouterAlive"></topic-content>
        <topic-post v-for="i in postNum" :postType = "1"></topic-post>
    </teen-scroller>
</div> 
</template>
<script>
import topicContent from '../../../components/topic/content.vue'
import topicPost from '../../../components/topic/post.vue'
import TeenScroller from '../../../components/global/teenScroller'
export default {
    components: {
        topicContent,
        topicPost,
        TeenScroller
    },
    data () {
        return {
            postNum: 6,
            isRouterAlive: true
        }
    },
    methods: {
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
        }   
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>