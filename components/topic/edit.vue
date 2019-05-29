<template>
    <div class="edit-area">
        <div ref="content" class="text-area" contenteditable="true" @keydown="getContent">
            {{editContent}}
        </div>
        <upload-img @addImg="addImg"></upload-img>
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
import UploadImg from './../../components/topic/uploadImg'
export default {
    // props: ['topicList'],
    data () {
        return {
            editContent: '',
            sendContent: '',
            topicList: [],
            preImgList: [],
            imgList: [],
            sendContent: '' 
        }
    },
    components: {
        UploadImg
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
            this.sendContent = e.currentTarget.innerHTML
            // console.log(e.currentTarget.innerHTML)
            this.$emit('changeContent', e.currentTarget.innerHTML)
        },
        addTopic () {
            let editContent = this.$refs.content.innerHTML
            Tool.setSession('edit-content', editContent)
            let imgList = this.imgList
            console.log(imgList, 'imgList')
            Tool.setSession('img-list', imgList)
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
            Tool.setSession('edit-topic', this.topicList)
        },
        addImg (preImgList, imgList) {
            this.preImgList = preImgList
            this.imgList = imgList
            this.$emit('addImg', this.imgList)
            // console.log(preImgList, imgList, 'list')
        }
    },
    watch: {
    },
    mounted () {
        // this.eidtContent = sessionStorage.getItem('edit-content') ? sessionStorage.getItem('edit-content') : ''
        this.editContent = Tool.getSession('edit-content') ? Tool.getSession('edit-content') : ''
        this.sendContent = this.editContent
        this.topicList = Tool.getSession('edit-topic')
        console.log(this.topicList, 123)
    }
}
</script>
<style lang="scss" src="./../../assets/css/components/topic/edit.scss" scoped>
</style>
