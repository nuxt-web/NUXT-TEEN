<template>
    <div>
        <back-header :backTitle="'添加主题'"></back-header>
        <!-- <post-edit></post-edit> -->
        <topic-select @getTopic="getTopic"></topic-select>
        <topic-item :itemList="topicList"></topic-item>
    </div>
</template>
<script>
import BackHeader from '../../components/common/backHeader'
import TopicSelect from '../../components/topic/select'
import TopicItem from '../../components/topic/addItem'
export default {
    components: {
        BackHeader,
        TopicSelect,
        TopicItem
    },
    data () {
        return {
            topicList: []
        }
    },
    methods: {
        // 获取已有的话题
        getTopic (data) {
            console.log(data, '话题列表')
            this.topicList = data
        }
    }
}
</script>
<style>

</style>
