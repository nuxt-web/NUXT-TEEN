<template ref="detail">
    <div>
        <graphic-back :selfBack="true" @goBack="goBack"></graphic-back>
        <graphic-detail :list="imgList"></graphic-detail>
        <div class="progress">
            <el-slider
                v-model="progressValue"
                >
            </el-slider>
        </div>
    </div>
</template>
<script>
import GraphicBack from '../../../components/film/graphic/simpleBack'
import GraphicHeader from '../../../components/film/graphic/header'
import GraphicProgress from '../../../components/film/graphic/progress'
import GraphicDetail from '../../../components/film/graphic/detail'
import API from '../../../model/api'
import { getFetch } from '../../../model/request'
import tools from '../../../model/tools';
export default {
    components: {
        GraphicBack,
        GraphicHeader,
        GraphicProgress,
        GraphicDetail
    },
    data () {
        return {
            progressValue: 0,
            proValue: 0,
            id: '',
            imgList: [],
            userInfo: {}
        }
    },
    methods: {
        scroll () {
        },
        // 获取图片列表和进度
        async getImgList () {
            let sendData = {
                id: this.id
            }
            let res = await getFetch(API.getGraphicDetail, sendData)
            if (res.data.code === 200) {
                console.log('detail')
                this.imgList = res.data.data.img_list
            }

            sendData = {
                graphic_id: this.id,
                user_id: this.userInfo.uid
            }
            res = await getFetch(API.getProgress, sendData)
            if (res.data.code == 200) {
                console.log(2)
                if (res.data.data) {
                    // console.log(res.data.data.progress, '----------')
                    this.progressValue = parseFloat(res.data.data.progress)
                }
            }
        },
        // 先记录看到哪里再返回
        goBack () {
            console.log('back')
            // let userInfo = tools.getSession('user_info')
            let sendData = {
                graphic_id: this.id,
                user_id: this.userInfo.uid,
                progress: this.progressValue
            }
            getFetch(API.recordProgress, sendData)
            this.$router.back()
        },
        // async getProgress () {
        //     let sendData = {
        //         graphic_id: this.id,
        //         user_id: this.userInfo.uid
        //     }
        //     let res = await getFetch(API.getProgress, sendData)
        //     if (res.data.code == 200) {
        //         console.log(2)
        //         if (res.data.data) {
        //             // console.log(res.data.data.progress, '----------')
        //             this.progressValue = parseFloat(res.data.data.progress)
        //         }
        //     }
        // }
    },
    watch: {
        progressValue (val) {
            console.log(val, 'change------------')
            let scHeight = document.documentElement.scrollHeight
            let clHeight = document.documentElement.clientHeight
            this.$nextTick(() => {
                // console.log(this.$refs.detail.scrollTop, 'hhhh')
                document.documentElement.scrollTop = val/100 * scHeight
            }, false)
        }
    },
    mounted () {
        let _this = this
        this.id = this.$route.params.id
        this.userInfo = tools.getSession('user_info')
        this.getImgList()
        // this.getProgress()
        this.$nextTick(() => {
            // 详情高度, 滚动条位置
            let scHeight, scTop
            function loadEvent () {    
                scHeight = document.documentElement.scrollHeight
                scTop = document.documentElement.scrollTop              
                _this.progressValue = scTop/scHeight * 100
            }
            // 监听滚动事件
            window.addEventListener('scroll', loadEvent, true);
        }, false)
        
        
    }
}
</script>
<style lang="scss" scoped>
// body {
//     height: auto;
// }
  .progress {
        width: 10rem;
        height: 10px;
        position: fixed;
        bottom: 1.5rem;
        left: 50%;
        transform: translateX(-50%);
    }
</style>
