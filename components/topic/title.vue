<template>
   <div class="title">
       <p class="name">{{titleName}}</p>
       <p class="more" @click="goPage">查看更多<i class="icon more"></i></p>
   </div>
</template>
<script>
export default {
    props: ['titleName', 'pageName'],
    methods: {
        goPage () {
            let _this = this
            console.log(_this.pageName)
            this.$router.push({
                name: _this.pageName
            })
        }
    },
    mounted () {
        console.log(this.titleName, this.pageName, 'hhh')
    }
}
</script>
<style lang="scss" src="./../../assets/css/components/topic/title.scss" scoped></style>
