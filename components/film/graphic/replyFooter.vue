<template lang="">
    <div class="reply-footer">
        <input class="input" placeholder="输入你的观点">
        <i class="icon reply"><span>152</span></i>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss">

.reply-footer {
    width: 100%;
    height: 2rem;
    background: #ffffff;
    border-bottom: 1px solid #cccccc;
    position: fixed;
    bottom: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 .5rem;
    .input {
        width: 85%;
        height: 1.5rem;
        border: none;
        outline: none;
        border: 1px solid #cccccc;
        border-radius: 1rem;
        font-size: .75rem;
        padding: 0 .5rem;
    }
    .icon {
        color: #505050;
        span {
            font-size: .75rem;
        }
    }
}
</style>
