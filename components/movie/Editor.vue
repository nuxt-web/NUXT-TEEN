<template>
    <section class="editor">
        <div class="editor-content" @input="changeContent" ref="content" contenteditable="true" placeholder="请输入内容" @focus="returnChange(2)"></div>
    </section>
</template>


<script>
    export default {
        name: 'RastarEditor',
        data: function () {
            return {
                content: '',
                textContent: '',
                max: ''
            }
        },
        methods: {
            returnChange: function (val) {
                this.$emit('changeFocus', val)
            },
            // 内容改变
            changeContent: function (e) {
                this.content = e.target.innerHTML
                let reg = /^<br>/
                this.content = this.content.replace(reg, '')
                if (this.content.length > 0) {
                    e.target.className = 'editor-content not-empty'
                } else {
                    e.target.className = 'editor-content'
                }
                this.max = this.$refs.content.innerHTML.substring(0, 500)
                if (this.$refs.content.innerHTML.length > 500) {
                    this.$refs.content.innerHTML = this.max
                    this.$store.dispatch('changeToastText', '内容太多啦～')
                } else {
                    this.$emit('changeValue', this.content)
                }
                this.$emit('changeValue', this.content)
            },
            // 改变图片
            changeImg: function (url) {
                url = url + '?imageView2/2/w/640'
                this.$refs.content.className = 'editor-content not-empty'
                // document.execCommand('insertHTML', false, '<div><img src="' + url + '"></div>')
                this.$refs.content.innerHTML += `<div><img src="${url}"></div>`
                let content = this.$refs.content.innerHTML
                this.$emit('changeValue', content)
                // this.setRange(this.$refs.content)
            },
            changeEmoticons: function (emo) {
                this.$refs.content.className = 'editor-content not-empty'
                this.$refs.content.innerHTML += emo
                this.$emit('changeValue', this.$refs.content.innerHTML)
                // this.setRange(this.$refs.content)
            },
            // 设置内容
            setHTML: function (html) {
                this.$refs.content.className = 'editor-content not-empty'
                this.$refs.content.innerHTML = html
            },
            // 设置光标所在位置为末尾
            setRange: function (el) {
                var range = document.createRange()
                range.selectNodeContents(el)
                range.collapse(false)
                var sel = window.getSelection()
                sel.removeAllRanges()
                sel.addRange(range)
            }
        }
    }
</script>

<style lang="scss" src="./../../assets/css/components/movie/Editor.scss"></style>