const tools = {
  setCookie: function (name, value) {
    let time = 7
    let exp = new Date()
    exp.setTime(exp.getTime() + time * 24 * 60 * 60 * 1000)
    document.cookie = name + '=' + escape(value) + ';expires=' + exp.toGMTString();
  },
// 获取Cookie，只能获取当前域名下的
  getCookie: function (name) {
    let cname = name + '='
    let ca = document.cookie.split(';')
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i].trim()
      if (c.indexOf(cname) === 0) return c.substring(cname.length, c.length)
    }
    return ''
  },
// 获取Cookie数组并切割
  getCookieArray: function (name) {
    let nowCookie = xh.getCookie(name)
    if (nowCookie) {
      nowCookie = unescape(nowCookie)
      nowCookie = nowCookie.split('`')
      return nowCookie
    } else {
      return []
    }
  },
}


export default tools

