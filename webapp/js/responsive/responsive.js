
$(document).ready(function () {
    let sidebar = document.getElementById('sidebar')
    let close = document.getElementById('close')
    let overlay = document.getElementById('overlay')

    $('#btn-sideBar').click(function () {
        // sidebar.style.transform = 'translateX(0%)'
        // sidebar.style.transition = 'all .4s linear'
        // close.style.display = 'inline'
        sidebar.classList.remove('transformX-100')
        sidebar.classList.add('transformX-0')
        close.classList.add('d-inline')
        close.classList.remove('d-none')
        close.style.transition = 'all .4s linear'
        overlay.style.display = 'block'
    })
    $('#close').click(function () {
        // sidebar.style.transform = 'translateX(-100%)'
        // sidebar.style.transition = 'all .4s linear'
        // document.getElementById('close').style.display = 'none'
        sidebar.classList.remove('transformX-0')
        sidebar.classList.add('transformX-100')
        close.classList.add('d-none')
        close.classList.remove('d-inline')
        close.style.transition = 'all .4s linear'
        overlay.style.display = 'none'
    })

    $('#overlay').click(function () {
        sidebar.classList.remove('transformX-0')
        sidebar.classList.add('transformX-100')
        close.classList.add('d-none')
        close.classList.remove('d-inline')
        close.style.transition = 'all .4s linear'
        overlay.style.display = 'none'
    })
})
