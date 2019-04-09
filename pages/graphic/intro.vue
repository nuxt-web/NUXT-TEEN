<template>
    <div>
        <graphic-header></graphic-header>
        <graphic-info></graphic-info>
        <record-view></record-view>
        <div class="reply-title">作品讨论</div>
        <graphic-reply></graphic-reply>
        <reply-footer></reply-footer>
    </div>
</template>
<script>
import GraphicHeader from '../../components/film/graphic/header'
import GraphicInfo from '../../components/film/graphic/info'
import GraphicReply from '../../components/film/graphic/replyItem'
import ReplyFooter from '../../components/film/graphic/replyFooter'
import RecordView from '../../components/film/graphic/recordView'
export default {
    components: {
        GraphicHeader,
        GraphicInfo,
        GraphicReply,
        ReplyFooter,
        RecordView
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
