console.log("Stream switcher loaded");

var set_all_posters = window.document.querySelectorAll("img");
for (i = 0; i < set_all_posters.length; i++) {
  set_all_posters[i].style = "box-shadow: 5px 5px 5px red";
}

var toggles = window.document.getElementsByClassName("st_switch");


for (let i = 0; i < toggles.length; i++) {
  let posters = window.document.getElementsByClassName("pro-" + toggles[i].name);

  if (toggles[i].checked) {
    for (let j = 0; j < posters.length; j++) {
      posters[j].style = "box-shadow: 5px 5px 5px";
    }
  }

  toggles[i].addEventListener("click", () => {
    if (toggles[i].checked) {
      for (let j = 0; j < posters.length; j++) {
        posters[j].style = "box-shadow: 5px 5px 5px";
      }
    } else {
      for (let j = 0; j < posters.length; j++) {
        posters[j].style = "box-shadow: 5px 5px 5px red";
      }
    }
  });

}

