/**
 * 获取验证码
 * 将验证码写到login.html页面的id = verifyimg 的地方
 */
function getvCode() {
    $("#verifyImg").attr('src',timestamp("verifyCode"));
    
    
}
//为url添加时间戳
 function timestamp(url) {
    var getTimestamp = new Date().getTime();
    if (url.indexOf("?") > -1) {
        url = url + "&timestamp=" + getTimestamp
    } else {
        url = url + "?timestamp=" + getTimestamp
    }
    return url;
};