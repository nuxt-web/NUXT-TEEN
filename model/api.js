let base = 'http://teen.com/nuxt/entry'

export default{
  getIndex: base + '/index.php',

  getUserInfo: base + '/mine.php',

  login: base + '/login.php',

  getMovieDetail: base + '/movieDetail.php',

  getMovieList: base + '/movieList.php',

  doSeeMovie: base + '/seeMovie.php',

  // 获取话题列表
  getTopicList: base + '/topicList.php',

  // 获取文章列表
  getPostList: base + '/postList.php',

  // 添加文章
  addPost: base + '/addPost.php',

  // 搜索话题
  selectTopic: base + '/selectTopic.php'
}
