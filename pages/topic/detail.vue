<template>
<div>
    <!-- <teen-scroller :refresh="pushNews" :infinite="pullReply"> -->
        <topic-content v-if="isRouterAlive"></topic-content>
        <topic-post v-for="i in postNum" :postType = "1"></topic-post>
        <topic-button @click.native="goPage"></topic-button>
    <!-- </teen-scroller> -->
</div> 
</template>
<script>
import topicContent from './../../components/topic/content.vue'
import topicPost from './../../components/topic/post.vue'
import TeenScroller from './../../components/global/teenScroller'
import topicButton from './../../components/topic/button'
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
        },
        goPage () {
            console.log('hhhh')
        } 
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>