export default{
    nav
}
const urlRoutes = {
    404:{template: "templates/layout/404.html", title: "Page not found"},
    "/": {template: "templates/auth/login.html", title:"LERP", auth: "none"},
    "/register":{template: "templates/auth/register.html", title: "Register", auth: "none"},
    "/adminhome": {template: "templates/admin/dashboard.html", title: "Home", auth: 'admin'},
    "/verify": {template: "templates/auth/verify.html", title: "Verify", auth: "verifying"},
    "/home": {template: "templates/examinee/dashboard.html", title: "Home", auth: 'examinee'},
    "/subject": {template: "templates/examinee/subject.html", title: "Subject list", auth: 'examinee'},
    "/performance": {template: "templates/examinee/performance.html", title: "Performance", auth: 'examinee'},
    "/account": {template: "templates/examinee/account.html", title: "Account", auth: 'examinee'},
    "/adminsubject": {template: "templates/admin/subject.html", title: "Subject", auth: 'admin'},
    "/adminperformance": {template: "templates/admin/performance.html", title: "Performance", auth: 'admin'},
    "/adminusers": {template: "templates/admin/user.html", title: "Users list", auth:'admin'},
    "/manageAccount": {template: "templates/layout/manageAccount.html", title: "Manage", auth: sessionStorage.getItem('auth')},
    "/schedule": {template: "templates/admin/schedule.html", title: "Schedule", auth: 'n/a'}
}

window.addEventListener('click', function(){
    if(sessionStorage.length == 0){
        window.location.href = '/'
    }
})

function nav(){
    document.addEventListener("click",(e)=>{
        const {target} = e;
        if(!target.matches("u")){
            return
        }
        e.preventDefault()
        urlRoute()
    })
}

const urlRoute = (event)=>{
    event = window.event
    event.preventDefault()
    window.history.pushState({}, "",event.target.href)
    urlLocationHandler()
}

// sessionStorage.setItem("auth","none")
if(sessionStorage.length == 0){
    sessionStorage.setItem("auth","none")
}
const urlLocationHandler = async()=>{
    const auth = sessionStorage.getItem('auth')
    console.log(auth)
    const location = window.location.pathname
    if(location == '/register' && auth == 'none'){
    }else if(auth == 'none' && location.length > 1){
        window.location.href = "/"
    }
    const route = urlRoutes[location] || urlRoutes[404]
    
    $(function(){
        auth == route.auth ?
        $.get(route.template,function(e){
            $("#component").html(e)
        }): $.get("templates/404.html",function(e){
            $("#component").html(e)
        })
    })
    document.title = route.title
}

window.onpopstate = urlLocationHandler
window.route = urlRoute
urlLocationHandler()