console.log("Stream switcher loaded");


var toggles = window.document.getElementsByClassName("st_switch");


for (let i = 0; i < toggles.length; i++) {
  toggles[i].addEventListener("click", () => {
    let posters = window.document.getElementsByClassName("pro-" + toggles[i].name);
    console.log(toggles[i].value);
    console.log(toggles[i].checked);
    console.log(toggles[i].name);
    if (toggles[i].checked) {
      console.log(posters);
      for (let j = 0; j < posters.length; j++) {
        console.log(j);
        posters[j].style = "box-shadow: 5px 5px 5px";
        console.log(posters[j].style);
      }
    } else {
      for (let j = 0; j < posters.length; j++) {
        console.log(j);
        posters[j].style = "";
        console.log(posters[j].style);
      }
    }
  });
  
}

