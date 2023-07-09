class Htall extends Map{
    crud(d){
        var output = ""
        $(".loading-section").css('display','flex')
        $.ajax({
            url: d.url,
            type: d.type,
            data: d.data,
            dataType: 'JSON',
            contentType: false,
            cache: false,
            processData: false,
            async: false,
            success: function(result){
                $(".loading-section").css('display','none')
                output = result
            },
            error: function (request, status, error) {
                output = request.responseText
            }
        })
        return output
    }

    getData(d){
        var output = ""
        $.ajax({
            url: d.url,
            type: 'POST',
            data: d.data,
            async: false,
            dataType: 'JSON',
            success: function(result){
                output = result
            },
            error: function (request, status, error) {
                console.log(request.responseText)
                output = request.responseText
            }
        })
        return output
    }
    
    swal(d){
        Swal.fire({
            icon: d.icon,
            text: d.msg,
            title: d.title
        })
    }

    location(d){
        sessionStorage.setItem("auth",d.auth)
        sessionStorage.setItem("data",JSON.stringify(d))
        window.location.href = d.href
    }

    importGrade(d){
        // sessionStorage.setItem("importgrade",'')
        if(d.store) sessionStorage.setItem("importgrade",d.data)
        else{
            return sessionStorage.getItem("importgrade")
        }
    }

    include(main){
        const extend = $("#extend").html()
        $("#extend").empty()
        $.get(`templates/${main}`,function(e){
            $("body").attr('class',"hold-transition sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed")
            $("#component").html(e)
            $("#include").html(extend)
        })
    }

    toast(){
        return Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000
        });
    }

    url(){
        var url = window.location.pathname.split("/")
        return "#"+url[1]
    }
    user(){
        var data = JSON.parse(sessionStorage.getItem("data"))
        return data.data
    }
}

const htall = new Htall()