<template>
<div>
    <topic-content></topic-content>
    <topic-post v-for="i in 6" :postType = "1"></topic-post>
</div> 
</template>
<script>
import topicContent from './../../components/topic/content.vue'
import topicPost from './../../components/topic/post.vue'
export default {
    components: {
        topicContent,
        topicPost
    }
}
</script>
<style src="./" lang="./../../assets/css/topic/index.scss" scoped></style>