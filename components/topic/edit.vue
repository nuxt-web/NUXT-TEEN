<template>
    <div class="edit-area">
        <div class="text-area" contenteditable="true" @focus="focusArea" v-html="eidtContent">
        </div>
        <div class="pic-area">
            <div class="add-button">
                <div class="cross"></div>
                <div class="vertical"></div>
            </div>
        </div>
        <p class="topic-button" @click="goPage">#添加话题</p>
    </div>
</template>
<script>
export default {
    data () {
        return {
            eidtContent: '说出你想说的吧~'
        }
    },
    methods: {
        focusArea () {
            this.eidtContent = ''
        },
        goPage () {
            this.$router.push({
                name: 'topic-add'
            })
        }
    },
    watch: {
    }
}
</script>
<style lang="scss" scoped>
@import '../../assets/css/common/variable';
.edit-area {
    width: 100%;
    height: 100%;
    background: #ffffff;
}
.text-area {
    width: 100%;
    min-height: 10rem;
    background: #ffffff;
    // border: 1px solid #cccccc;
    border: none;
    font-size: .75rem;
    padding: .5rem;
    outline: none;
    color: #505050;
}
.pic-area {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
}
.add-button {
    width: 31%;
    height: 31vw;
    background: #ffffff;
    border: 1px solid #cccccc;
    border-radius: .5rem;
    margin: 1vw;
    // display: flex;
    // align-items: center;
    // justify-content: center;
    position: relative;
    .cross {
        width: 80%;
        height: 1px;
        background: #cccccc;
        position: absolute;
        top: 50%;
        left: 10%;
    }
    .vertical {
        width: 1px;
        height: 80%;
        background: #cccccc;
        position: absolute;
        top: 10%;
        left: 50%;
    }
}
.topic-button {
    margin: .5rem .2rem;
    display: inline-block;
    padding: .2rem .3rem;
    font-size: .7rem;
    // width: 1.5rem;
    // height: 1rem;
    border: 1px solid $color-primary;
    border-radius: .5rem;
    color: $color-primary;
}
</style>
