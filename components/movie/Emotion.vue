<template>
    <transition name="slideUp">
        <div class="emotion">
            <div class="options">
                <swiper :options="swiperOption">
                    <swiper-slide v-for="(arr,index) in expression" :key="index">
                        <div class="options-content">
                            <div class="exp" v-for="item in arr" @click="choose(1, item.emoticon_content)" v-if="type === 1"><img :src="item.emoticon_content" alt="" style="height: 100%"></div>
                            <div class="emoticons" v-for="item in arr" @click="choose(2, item.emoticon_content)" v-if="type === 2"><p style="max-width: ">{{item.emoticon_content}}</p></div>
                        </div>
                    </swiper-slide>
                    <div class="swiper-pagination "  slot="pagination"></div>
                </swiper>
            </div>

            <div class="emotionType">
                <swiper :options="swiperOption2" ref="box">
                    <swiper-slide v-for="(item,index) in typeGroup" :key="index">
                        <div class="type-item" @click="pick($event, item.id)" :class="{target:index === 0}">
                            <div class="type-img">
                                <img :src="item.icon" alt="" style="width: 100%">
                            </div>
                        </div>
                    </swiper-slide>
                </swiper>
                <!--<div class="delete" @click="deleteEmo">-->
                    <!--<p><i class="icon backSpace"></i></p>-->
                <!--</div>-->
            </div>
        </div>
    </transition>
</template>

<script>
    export default {
        name: 'Emotion',
        props: ['emotions'],
        data: function () {
            return {
                target: '',
                emoticons: [],
                swiperOption: {
                    speed: 500,
                    slidesPerView: 'auto',
                    slideToClickedSlide: true,
                    observer: true,
                    observeParents: true,
                    pagination: {
                        el: '.swiper-pagination',
                        clickable: true
                    }
                },
                swiperOption2: {
                    freeMode: true,
                    slidesPerView: 'auto'
                },
                typeGroup: [],
                expression: [],
                show: false,
                type: '',
                all: []
            }
        },
        methods: {
            // 选表情包
            choose: function (type, item) {
                let obj = {
                    type: type,
                    item: item
                }
                this.$emit('getReturn', obj)
            },
            // 选表情包种类
            pick: function (e, id) {
                let that = this
                this.allType = this.$refs.box.$children
                for (let i = 0; i < this.allType.length; i++) {
                    this.allType[i].$el.firstChild.className = 'type-item'
                }
                e.currentTarget.className += ' target'
                console.log(this.all)
                if (this.all[id]) {
                    this.expression = this.all[id]
                    console.log(this.all)
                    console.log(this.all[id])
                    if (this.all[id][0][0].emoticon_content.search('img') !== -1) {
                        this.type = 1
                    } else {
                        this.type = 2
                    }
                } else {
                    this.$ajax({
                        url: this.$api.getEmjList,
                        params: {
                            id: id
                        }
                    }).then((res) => {
                        if (res.data.code === 200) {
                            that.type = res.data.data.type
                            if (this.type === 2) {
                                this.expression = this.dataHandle(res.data.data.data, 16)
                            } else {
                                this.expression = this.dataHandle(res.data.data.data, 8)
                            }
                            this.all[id] = this.expression
                        }
                    }).catch(() => {
                        this.$store.dispatch('changeToastText', '很抱歉，服务器开小差了')
                    })
                }
            },
            // 表情包数据处理
            dataHandle: function (arr, len) {
                let aLen = arr.length
                let result = []
                for (var i = 0; i < aLen; i += len) {
                    result.push(arr.slice(i, i + len))
                }
                return result
            }
        },
        mounted: function () {
            console.log(666666)
            console.log(this.emotions)
            if (this.emotions.emjList.type === 2) {
                this.expression = this.dataHandle(this.emotions.emjList.data, 16)
                this.type = 2
            } else {
                this.expression = this.dataHandle(this.emotions.emjList.data, 8)
                this.type = 1
            }
            this.all.push(this.expression)
            this.typeGroup = this.emotions.emjClass
            console.log(this.typeGroup)
        }
    }
</script>

<style lang="scss" src="./../../assets/css/components/movie/Emotion.scss" scoped></style>