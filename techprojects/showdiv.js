function toggle() {
	var ele = document.getElementById("toggleText");
	var text = document.getElementById("displayText");
	if(ele.style.display == "block") {
    		ele.style.display = "none";
		text.innerHTML = "Click Here to Make a New Post";
  	}
	else {
		ele.style.display = "block";
		text.innerHTML = "Hide the 'New Post' Box";
	}
}
