<template>
    <div class="reply-btn" @click="reply">
       添加评论...
    </div>
</template>
<script>
export default {
    methods: {
        reply () {
            this.$emit('reply')
        }
    }
}
</script>
<style lang="scss" scoped>
    .reply-btn {
        position: fixed;
        bottom: 0;
        left: 0;
        width: 100%;
        padding: .5rem;
        font-size: .7rem;
        background: #ffffff;
        color: #505050;
    }
</style>