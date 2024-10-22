let darkmode = localStorage.getItem('darkmode');
const themeSwitch = document.getElementById('theme-switch');

const enableDarkmode = () => {
    document.body.classList.add('darkmode');
    localStorage.setItem('darkmode', 'active');
}

const disableDarkmode = () => {
    document.body.classList.remove('darkmode');
    localStorage.setItem('darkmode',null);
}

if(darkmode === "active")enableDarkmode();

themeSwitch.addEventListener("click", () => {
    darkmode = localStorage.getItem('darkmode');
    darkmode !== "active" ? enableDarkmode() : disableDarkmode()
});

const bar = document.getElementById('bar');
const closee = document.getElementById('close');
const nav = document.getElementById('navbar');

if (bar){
    bar.addEventListener("click", () =>{
        nav.classList.add('active')
    }
)}

if (closee){
    closee.addEventListener("click", () =>{
        nav.classList.remove('active')
    }
)}

function btnShop(){
    alert("FITUR BELUM DAPAT DIGUNAKAN!!!")
}
