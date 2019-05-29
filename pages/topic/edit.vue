<template>
    <div>
        <back-header @goBack="goBack" :selfBack="selfBack">
            <p slot="right" @click="goNext">下一步</p>
        </back-header>
        <post-edit ref="edit" @addImg="addImg"></post-edit>
    </div>
</template>
<script>
import BackHeader from '../../components/common/backHeader'
import PostEdit from '../../components/topic/edit'
import API from '../../model/api'
import { postFetch } from '../../model/request'
import qs from 'qs';
import Tool from './../../model/tools'
export default {
    components: {
        BackHeader,
        PostEdit
    },
    data () {
        return {
            content: '',
            topicList: [],
            imgList: [],
            selfBack: true
        }
    },
    methods: {
        goBack () {
            console.log('back')
            let topic_id = Tool.getSession('topic_id')
            this.$router.push({ 
                name: 'topic-id',
                params: { id : topic_id }
            })
            Tool.removeSession('edit-content')
            Tool.removeSession('edit-topic')
            Tool.removeSession('img-list')
            Tool.removeSession('topic_id')
        },
        changeContent (content) {
            this.content = content
        },
        goNext () {
            this.addPost()
        },
        async addPost () {
            let imgList = this.imgList.length > 0 ? this.imgList : (Tool.getSession('img-list') ? Tool.getSession('img-list') : [])
            let data = {
                content: this.$refs.edit.sendContent,
                topic: this.$refs.edit.topicList,
                // user_id: 100524,
                user_id: Tool.getCookie('_TEEN_'),
                create_tm: new Date().getTime(),
                imgList
            }
            console.log(data,'发表')
            // console.log(data, '内容')
            let res = await postFetch(API.addPost, data)
            if (res.data.code === 200) {
                let targetId = Tool.getSession('topic_id')
                // this.$router.back();
                // sessionStorage.removeItem('edit-content')
                this.$router.push({
                    name: 'topic-id',
                    params: {
                        id: targetId
                    }
                })
                Tool.removeSession('edit-content')
                Tool.removeSession('edit-topic')
                Tool.removeSession('img-list')
                Tool.removeSession('topic_id')
            }
            // this.$ajax({
            //     url: API.addPost,
            //     method: 'post',
            //     data: qs.stringify(data)
            // })
        },
        addImg (data) {
            this.imgList = data
        } 
    },
    mounted () {
        // let id = this.$route.params.id
        let id = Tool.getSession('topic_id')
        console.log(id, 'id')
    }
}
</script>
<style>
</style>

