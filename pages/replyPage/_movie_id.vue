<template>
    <section id="reply-page">
        <teen-header :back="true" style="background: #FFFFFF">
            <p class="title title-ellipsis" slot="title">发帖</p>
            <div class="filter" slot="filter" @click="submit" :class="{valid: canSend, invalid: !canSend}" style="color: black">发表</div>
        </teen-header>
        <div class="page-wrapper">
            <div class="reply-area">
                <div class="options-bar">
                    <div class="options" ref="options">
                        <p @click="change(1)" v-if="nowType === 1">
                            <i class="icon keyboard active" ></i></p>
                        <p @click="change(0)" v-if="nowType !== 1">
                            <i class="icon expression"></i></p>
                    </div>
                    <!-- <div class="words-limit">
                        <span>
                            {{contentNum}} / 500
                        </span>
                    </div> -->
                </div>

                <teen-editor ref="editor" @changeValue="changeValue" @changeFocus="getChange"></teen-editor>
            </div>
        </div>
        <emotion v-if="showEmotion" @getReturn="returnEmotion" ref="emotion" :emotions="this.emotions"></emotion>
    </section>

</template>

<script>
    import TeenHeader from './../../components/global/header.vue'
    import TeenScroller from './../../components/global/scroller.vue'
    import TeenEditor from './../../components/movie/Editor.vue'
    import Emotion from './../../components/movie/Emotion.vue'
    import api from "../../model/api.js"
    import {getFetch} from "../../model/request.js"
    export default {
        name: 'replyPage',
        components: {
            TeenHeader,
            TeenScroller,
            Emotion,
            TeenEditor,
        },
        data: function () {
            return {
                active1: true,
                active2: false,
                active3: false,
                optionType: '',
                txt: '',
                content: '',
                showEmotion: false,
                nowType: '',
                showLoading: false,
                showSending: false,
                params: {
                    page: 1,
                    limit: 10
                },
                emotions: {},
                newsId: 0,
                contentNum: 0,
                canSend: false,
                pickedEmo: [],
                movie_id: '',
                uid: ''
            }
        },
        watch: {
          content: function (curr) {
              if (curr.length > 0) {
                  this.canSend = true
              } else {
                  this.canSend = false
              }
          }
        },
        methods: {
            getChange: function (val) {
                this.change(val)
            },
            returnEmotion: function (emot) {
                if (500 - this.content.length < emot.item.length + 23) {
                    this.$store.dispatch('changeToastText', '内容太多啦～')
                } else {
                    // this.pickedEmo.push(emot)
                    let that = this
                    let type = emot.type
                    switch (type) {
                        case 2:
                            that.$refs.editor.changeEmoticons(emot.item)
                            break
                        case 1:
                            that.$refs.editor.changeImg(emot.item)
                            break
                    }
                }
            },
            getEmjClass: function () {
                this.emotions = {
                    emjClass: [
                        {
                            icon: "https://img02.rastargame.com/gameCenter/img/emoticon_icon/n1/2018/12/19/1545182445916.png",
                            id: '6',
                            sort: '4',
                            title: '颜文字',
                            type: 2
                        }
                    ],
                    emjList: {
                        data: [
                            {title: "开心", id: 48, emoticon_content: "（*^▽^*)", sort: "101"},
                            {title: "满足", id: 38, emoticon_content: "o(*￣︶￣*)o", sort: "100"},
                            {title: "赞！", id: 39, emoticon_content: "o(￣▽￣)ｄ", sort: "99"},
                            {title: "哇~", id: 40, emoticon_content: "(☆▽☆)", sort: "98"},
                            {title: "啊啊啊啊", id: 41, emoticon_content: "w(ﾟДﾟ)w", sort: "97"},
                            {title: "惊讶", id: 42, emoticon_content: "Σ(っ °Д °;)っ", sort: "96"},
                            {title: "生气", id: 43, emoticon_content: "(σ｀д′)σ", sort: "95"},
                            {title: "喵", id: 44, emoticon_content: "≡ω≡", sort: "94"},
                            {title: "呜呜呜", id: 45, emoticon_content: "(＞﹏＜)", sort: "93"},
                            {title: "盯", id: 46, emoticon_content: "←_←", sort: "92"},
                            {title: "冲呀", id: 47, emoticon_content: "<(￣︶￣)↗[GO!]", sort: "91"}
                        ],
                        type: 2
                    }
                }
                console.log(this.emotions)
            },
            imageUploaded: function (res) {
                // 图片上传完毕
                this.showLoading = false
                if (500 - this.content.length < res.url.length + 23) {
                    this.$store.dispatch('changeToastText', '内容太多啦～')
                } else {
                    let obj = {
                        item: res.url,
                        type: 1
                    }
                    // this.pickedEmo.push(obj)
                    this.$refs.editor.changeImg(res.url)
                }
            },
            change: function (index) {
                switch (index) {
                    case 0:
                        this.nowType = 1
                        this.showEmotion = true
                        break
                    case 1:
                        this.nowType = 2
                        this.showEmotion = false
                        break
                    case 2:
                        this.nowType = 3
                        this.showEmotion = false
                        break
                }
            },
            changeValue: function (val) {
                // this.contentNum = this.regex(val)
                this.content = val
                // this.contentNum = val.length
            },
            submit: function () {
                console.log(4444444444)
                if (this.content.length === 0) return
                let params = {
                    uid: this.uid,
                    comment: this.content,
                    movie_id: this.movie_id
                }
                getFetch(api.addTopic, params).then((res) => {
                    if (res.data.code === 200) {
                        this.$router.back()
                    } else {
                        
                    }
                }).catch(() => {
                    
                })
            }
        },
        mounted: function () {
            this.getEmjClass()
            this.movie_id = this.$route.params.movie_id,
            this.uid = this.$tools.getCookie('_TEEN_')
        }
    }
</script>

<style lang="scss" src="./../../assets/css/views/movieDetail/replyPage.scss" scoped></style>
