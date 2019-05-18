<template>
    <div class="edit-area">
        <div ref="content" class="text-area" contenteditable="true" @keydown="getContent">
            {{editContent}}
        </div>
        <div class="pic-area">
            <div class="add-button">
                <div class="cross"></div>
                <div class="vertical"></div>
            </div>
        </div>
        <!-- <input type="file" /> -->
        <div class="topic-list">
             <div class="item" v-for="item in topicList">
                {{item.name}}
                <span class="remove-btn" @click="removeTopic" :data-name="item.name">
                    <i class="icon close"></i>
                </span>
            </div>
            <div class="item" @click="addTopic">添加话题</div>
        </div>
        <!-- <p class="topic-button" @click="goPage">#添加话题</p> -->
    </div>
</template>
<script>
import Tool from './../../model/tools'
export default {
    // props: ['topicList'],
    data () {
        return {
            editContent: '',
            topicList: []
        }
    },
    methods: {
        focusArea () {
            this.editContent = ''
        },
        goPage () {
            this.$router.push({
                name: 'topic-add'
            })
        },
        getContent (e) {
            // console.log(e.currentTarget.innerHTML)
            this.$emit('changeContent', e.currentTarget.innerHTML)
        },
        addTopic () {
            let editContent = this.$refs.content.innerHTML
            Tool.setSession('edit-content', editContent)
            // console.log(this.topicList)
            // Tool.setSession('edit-topic', this.topicList)
            // let topicList = JSON.parse(sessionStorage.getItem('edit-topic'))
            this.$router.push({
                name: 'topic-add'
            })
        },
        removeTopic (e) {
            let name = e.currentTarget.dataset.name
            console.log(name)
            this.topicList = this.topicList.filter(item => item.name !== name)
        }
    },
    watch: {
    },
    mounted () {
        // this.eidtContent = sessionStorage.getItem('edit-content') ? sessionStorage.getItem('edit-content') : ''
        this.editContent = Tool.getSession('edit-content') ? Tool.getSession('edit-content') : ''
        this.topicList = Tool.getSession('edit-topic')
        console.log(this.topicList, 123)
    }
}
</script>
<style lang="scss" src="./../../assets/css/components/topic/edit.scss" scoped>
</style>
