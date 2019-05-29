<template>
    <div class="edit-button" @click="goPage">
        <i class="icon add"></i>
    </div>
</template>
<script>
import Tool from './../../model/tools'
export default {
    props: ['topicId'],
    methods: {
        goPage () {
            Tool.setSession('topic_id', this.topicId)
            this.$router.push({
                name: 'topic-edit'
            })
        }
    }
}
</script>
<style lang="scss" scoped>
@import '../../assets/css/common/variable';
.edit-button {
    width: 2rem;
    height: 2rem;
    border-radius: 50%;
    position: fixed;
    bottom: .5rem;
    right: 1rem;
    z-index: 9999;
    background: $color-primary;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #ffffff;
}
</style>
