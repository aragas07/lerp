export default{
    nav
}
const urlRoutes = {
    404:{template: "templates/404.html", title: "Page not found"},
    "/": {template: "templates/auth/login.html", title:"LERP", auth: "none"},
    "/register":{template: "templates/auth/register.html", title: "Register", auth: "none"},
    "/home": {template: "templates/examinee/dashboard.html", title: "Home", auth: 'examinee'},
    "/adminhome": {template: "templates/adminhome.html", title: "Home", auth: 'admin'},
    "/verify": {template: "templates/auth/verify.html", title: "Verify", auth: "verifying"}
}

window.addEventListener('click', function(){
    if(sessionStorage.length == 0){
        window.location.href = '/'
    }
})

function nav(){
    document.addEventListener("click",(e)=>{
        const {target} = e;
        if(!target.matches("a")){
            return
        }
        e.preventDefault()
        urlRoute()
    })
}

const urlRoute = (event)=>{
    event = event || window.event
    event.preventDefault()
    window.history.pushState({}, "",event.target.href)
    urlLocationHandler()
}
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