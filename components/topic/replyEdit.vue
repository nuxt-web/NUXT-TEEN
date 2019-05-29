<template>
    <div class="reply-edit">
        <div class="title">
            <p class="cancel" @click="cancel">取消</p>
            <p class="submit" @click="submit">发表</p>
        </div>
        <div class="content">
            <textarea ref="text" placeholder="请输入回复内容~"></textarea>
        </div>
    </div>
</template>
<script>
export default {
    methods: {
        submit () {
            let content = this.$refs.text.value
            this.$emit('submitReply', content)
        },
        cancel () {
            this.$emit('cancelReply')
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/replyEdit.scss" scoped>
    
</style>
