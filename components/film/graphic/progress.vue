<template>
    <div class="scroll-bar">
        <div class="scroll-current">
            <div class="srcoll-all"></div>
        </div>
    </div>
</template>
<script>
export default {
    
}
</script>
<style lang="scss">
.scroll-bar {
    position: fixed;
    width: 10px;
    height: 10rem;
    right: .5rem;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0, 0, 0, .5);
    border-radius: .5rem;
}
</style>
