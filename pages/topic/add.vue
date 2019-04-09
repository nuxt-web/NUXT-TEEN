<template>
    <div>
        <back-header :backTitle="'添加主题'"></back-header>
        <!-- <post-edit></post-edit> -->
        <topic-select></topic-select>
    </div>
</template>
<script>
import BackHeader from '../../components/common/backHeader'
import TopicSelect from '../../components/topic/select'
export default {
    components: {
        BackHeader,
        TopicSelect
    }
}
</script>
<style>

</style>
