<template>
    <div>
        <back-header>
            <p slot="right" @click="goNext">下一步</p>
        </back-header>
        <post-edit ref="edit"></post-edit>
    </div>
</template>
<script>
import BackHeader from '../../components/common/backHeader'
import PostEdit from '../../components/topic/edit'
import API from '../../model/api'
import { postFetch } from '../../model/request'
import qs from 'qs';
export default {
    components: {
        BackHeader,
        PostEdit
    },
    data () {
        return {
            content: '',
            topicList: []
        }
    },
    methods: {
        changeContent (content) {
            this.content = content
        },
        goNext () {
            this.addPost()
        },
        async addPost () {
            let data = {
                content: this.$refs.edit.editContent,
                topic: this.$refs.edit.topicList,
                user_id: 100524,
                create_tm: new Date().getTime()
            }
            // console.log(data, '内容')
            let res = await postFetch(API.addPost, data)
            if (res.data.code === 200) {
                this.$router.back();
            }
            // this.$ajax({
            //     url: API.addPost,
            //     method: 'post',
            //     data: qs.stringify(data)
            // })
        }   
    },
    mounted () {
    }
}
</script>
<style>
</style>

