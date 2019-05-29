<template>
    <div class="topic-add">
        <div class="select">
            <input class="box" type="text" v-model="selectText" @keyup="select">
            <p class="button" @click="cancel">取消</p>
        </div>
    </div>
</template>
<script>
import { getFetch } from  './../../model/request'
import API from './../../model/api'
export default {
    data () {
        return {
            selectText: ''
        }
    },
    methods: {
        async select () {
            let params = {
                key: this.selectText
            }
            console.log(this.selectText)
            let res = await getFetch(API.selectTopic, params)
            if (res.data.code === 200) {
                if (res.data.data.length > 0) {
                    this.$emit('getTopic', res.data.data)
                } else {
                    console.log('else')
                    let sendData = {
                        name: this.selectText,
                        isNew: true
                    }
                    this.$emit('getTopic', [sendData])
                }
                
            }
        },
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
