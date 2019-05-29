<template>
    <div>
        <graphic-header :title="graphicDetail.name"></graphic-header>
        <graphic-info :detail="graphicDetail"></graphic-info>
        <record-view :progress="progress" v-if="showProgress"></record-view>
        <!-- <div class="reply-title">作品讨论</div>
        <graphic-reply></graphic-reply> -->
        <!-- <reply-footer></reply-footer> -->
    </div>
</template>
<script>
import GraphicHeader from '../../components/film/graphic/header'
import GraphicInfo from '../../components/film/graphic/info'
import GraphicReply from '../../components/film/graphic/replyItem'
import ReplyFooter from '../../components/film/graphic/replyFooter'
import RecordView from '../../components/film/graphic/recordView'
import API from '../../model/api'
import { getFetch } from '../../model/request'
import tools from '../../model/tools';
export default {
    components: {
        GraphicHeader,
        GraphicInfo,
        GraphicReply,
        ReplyFooter,
        RecordView
    },
    data () {
        return {
            id: '',
            graphicDetail: {},
            userInfo: {},
            progress: 0,
            showProgress: false
        }
    },
    methods: {
        async getGraphicDetail () {
            let sendData = {
                id: this.id
            }
            let res = await getFetch(API.getGraphicDetail, sendData)
            if (res.data.code === 200) {
                this.graphicDetail = res.data.data
            }

            sendData = {
                graphic_id: this.id,
                user_id: this.userInfo.uid
            }
            res = await getFetch(API.getProgress, sendData)
            if (res.data.code == 200) {
                console.log(2)
                if (res.data.data) {
                    this.progress = res.data.data.progress
                    console.log('获取progress-------')
                    // console.log(res.data.data.progress, '----------')
                    // this.progressValue = parseFloat(res.data.data.progress)
                }
                this.showProgress = true
            }
        }
    },
    created() {
        this.id = this.$route.params.intro
        this.userInfo = tools.getSession('user_info')
        console.log(this.id)
        this.getGraphicDetail()
    }
}
</script>
<style>
.reply-title {
    width: 100%;
    font-size: .75rem;
    padding: .5rem;
    border-bottom: 1px solid #cccccc;
}
</style>
