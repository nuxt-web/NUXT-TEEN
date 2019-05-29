<template>
    <div class="items">
        <div v-for="item in itemList">
            <div class="item" v-if="item.isNew" @click="select(item)">
                <img src="../../static/images/avatar.jpg" alt="">
                <div class="info">
                    <p class="title">{{item.name}}</p>
                    <p class="num">创建新话题</p>
                </div>
            </div>
            <div class="item" @click="select(item)" v-else>
                <img src="../../static/images/avatar.jpg" alt="">
                <div class="info">
                    <p class="title">{{item.name}}</p>
                    <p class="num">{{item.post_num}}人参与</p>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    props: {
        itemList: {
            default: []
        }
    },
    methods: {
        goPage () {
            this.$router.push({
                name: 'topic-detail',
            })
        },
        select (data) {
            // let topicList = sessionStorage.getItem('topicList')
            if (sessionStorage.getItem('edit-topic')) {
                let topicList = JSON.parse(sessionStorage.getItem('edit-topic'))
                // 不可重复
                for (let i = 0, len = topicList.length; i < len; i++) {
                    if (topicList[i]['name'] === data['name']) return
                }
                topicList.push(data)
                sessionStorage.setItem('edit-topic', JSON.stringify(topicList))
                // sessionStorage.setItem('edit-topic', JSON.parse([data]))
            } else {
                console.log('no')
                let topicList = []
                topicList.push(data)
                sessionStorage.setItem('edit-topic', JSON.stringify(topicList))
            }
            
            this.$router.push({
                name: 'topic-edit',
                // query: {
                //     topic: JSON.stringify(data)
                // }
            })
        }
    }
}
</script>
<style lang="scss" src="../../assets/css/components/topic/addItem.scss" scoped></style>