let base = 'http://teen.com/nuxt/entry'

export default{
  getIndex: base + '/index.php',

  getUserInfo: base + '/mine.php',

  login: base + '/login.php',

  getMovieDetail: base + '/movieDetail.php',

  getMovieList: base + '/movieList.php',

  doSeeMovie: base + '/seeMovie.php',

  addTopic: base + '/addMovieComment.php',

  register: base + '/register.php',

  setAvatar: base + '/setAvatar.php',

  // 获取话题列表
  getTopicList: base + '/topicList.php',

  // 获取话题详情
  getTopicDetail: base + '/getTopicDetail.php',

  // 获取文章列表
  getPostList: base + '/postList.php',
  
  // 添加文章
  addPost: base + '/addPost.php',

  // 搜索话题
  selectTopic: base + '/selectTopic.php',

  // 获取文章
  getPost: base + '/getPost.php',

  // 添加文章
  addPost: base + '/addPost.php',

  // 添加文章评论
  addPostReply: base + '/addPostReply.php',

  // 获取文章评论
  getPostReply: base + '/getPostReply.php',

  // 上传图片
  uploadImg: base + '/uploadImg.php',

  // 发送聊天信息
  sendMsg: base + '/sendMsg.php',

  // 获取放映厅视频
  getVideo: base + '/getVideo.php',

  // 获取图解电影列表
  getGraphicList: base + '/getGraphicList.php',

  // 获取图解电影详情
  getGraphicDetail: base + '/getGraphicDetail.php',

  // 记录观看图解电影进度
  recordProgress: base + '/recordProgress.php',

  // 获取图解电影进度
  getProgress: base + '/getProgress.php'
}
