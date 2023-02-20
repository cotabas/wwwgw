console.log("Stream switcher loaded");


const toggles = window.document.getElementsByClassName("st_switch");


for (let i = 0; i < toggles.length; i++) {
  toggles[i].addEventListener("click", () => {
    console.log(toggles[i].value);
    console.log(toggles[i].checked);
    if (toggles[i].checked) {
      const xhr = new XMLHttpRequest();
      xhr.open("POST", '/streamers/6', true);

      //Send the proper header information along with the request
      xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

      xhr.onreadystatechange = () => { // Call a function when the state changes.
          if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // Request finished. Do processing here.
          }
      }
      xhr.send("disney=true");
    }
  });
  
}

