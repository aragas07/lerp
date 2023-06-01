class Htall{
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

    getData(){
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
        window.location.href = d.href
    }

    include(main){
        const extend = $("#extend").html()
        $.get(`templates/${main}`,function(e){
            $("body").attr('class',"hold-transition dark-mode sidebar-mini layout-fixed layout-navbar-fixed layout-footer-fixed")
            $("#component").html(e)
            $("#include").html(extend)
        })
    }
}
const htall = new Htall()