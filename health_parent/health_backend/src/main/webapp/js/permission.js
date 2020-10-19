// 获取当前登录用户的所有权限
function getPermission() {
    $.ajax({
        url: "/permission/findAllPermission.do",

        dataType: "json",

        type:"POST",

        success:function (resp) {
            return resp;
        }
    });
}