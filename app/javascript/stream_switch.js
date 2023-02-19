console.log("Stream switcher loaded");


const toggles = window.document.getElementsByClassName("st_switch");

const test = window.document.getElementById("test");

test.addEventListener("click", console.log("df"));

function toggle_stream(index) {
  console.log(toggles[index]);
}
toggles[0].addEventListener("click", toggle_stream(0));

//for (let i = 0; i < toggles.length; i++) {
//  toggles[i].addEventListener("click", toggle_stream(i));
//  
//}

