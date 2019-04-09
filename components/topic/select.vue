<template>
    <div class="topic-add">
        <div class="select">
            <input class="box" type="text" v-model="selectText">
            <p class="button" @click="cancel">取消</p>
        </div>
    </div>
</template>
<script>
export default {
    data () {
        return {
            selectText: ''
        }
    },
    methods: {
        cancel () {
            // console.log(this.selectText, 'hhh')
            this.selectText = ''
        }
    }
}
</script>
<style lang="scss">
.select {
    margin: .5rem;
    font-size: .75rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    .box {
        font-size: .75rem;
        width: 87%;
        height: 1.4rem;
        border: none;
        // border: 1px solid #cccccc;
        border: none;
        border-radius: .5rem;
        padding: .5rem;
        outline: none;
    }
    .button {
        color: #505050;
    }
}
</style>
