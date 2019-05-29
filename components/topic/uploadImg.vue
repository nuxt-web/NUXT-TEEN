<template>
    <div class="upload-page">
        <div class="img-holder" v-for="item in imgList">
            <img class="img" :src="item" alt="">
        </div>
        <div class="edit-area" v-if="imgList.length < 9">
            <input @change="fileChange($event)" type="file" ref="upload_file" accept="image/*"/>
            <div class="add-button">
                <div class="cross"></div>
                <div class="vertical"></div>
            </div>
        </div>
    </div>
</template>
<script>
import {postFetch} from '../../model/request'
import API from '../../model/api'
import Tool from '../../model/tools'
export default {
    data () {
        return {
            limitSize: 10 * 1024 * 1024,
            preImgList: [],
            imgList: []
        }
    },
    methods: {
        fileChange(e) {
            let imgList = e.target.files
            Array.from(imgList).forEach(async (item) => {
                if (item.size > this.limitSize) {
                    console.log('图片不能超过10M')
                    return 
                } 
                let render = new FileReader()
                let image = new Image()
                render.readAsDataURL(item)
                render.onload = (e) => {
                    image.src = e.target.result
                }

                let imageData = {}
                image.onload = async () => {
                    // 如果大于1.2M，进行压缩
                    if (item.size > 1024 * 1024 * 1.2) {
                        imageData = await this.tinyImg(image)
                    } else {
                        imageData = item
                    }
                    console.log(imageData, 'data')
                    this.uploadImg(imageData, item)
                }
                
            })
        },
        // 压缩图片
        async tinyImg (image) {
            let canvas = document.createElement('canvas')
            let context = canvas.getContext('2d')
            let originWidth = image.width
            let originHeight = image.height

            // 最大尺寸限制
            var maxWidth = 1200,
                maxHeight = 1200

            // 
            var targetWidth, targetHeight

            if (originWidth > maxWidth || originHeight >  maxHeight) {
                if (originWidth/originHeight > maxWidth/maxHeight) {
                    targetWidth = maxWidth
                    targetHeight = targetWidth * originHeight / originWidth
                } else {
                    targetHeight = maxHeight
                    targetWidth = targetHeight * originWidth / originHeight
                }
            }

            canvas.width = targetWidth
            canvas.height = targetHeight
            // 清除画布
            context.clearRect(0, 0, targetWidth, targetHeight)
            // 图片压缩
            context.drawImage(image, 0, 0, targetWidth, targetHeight)

            let data = await new Promise((resolve) => {
                canvas.toBlob((blob) => {
                    resolve(blob)
                }, 'image/jpeg', 0.6)
            })
            return data
        },
        objectToFormData (obj, name) {
            console.log(obj, 'obj')
            let fd = new FormData()
            fd.append('file', obj)
            return fd
        },
        async uploadImg (img, item) {
            let sendImg = this.objectToFormData(img)
            let _this = this
            this.$ajax({
                url: API.uploadImg,
                method: 'post',
                data: sendImg,
                headers: {
                    "Content-Type": "multipart/form-data"
                }
            }).then((res) => {
                if (res.data.code === 200) {
                    _this.preImgList.push(item)
                    // console.log(res.data.data)
                    _this.imgList.push(res.data.data)
                    this.$emit('addImg', _this.preImgList, _this.imgList)
                }
            })
            // console.log(res)
        }
    },
    mounted () {
        this.imgList = Tool.getSession('img-list') ? Tool.getSession('img-list') : []
    }
}
</script>
<style lang="scss" src="./../../assets/css/components/topic/uploadImg.scss">

</style>
