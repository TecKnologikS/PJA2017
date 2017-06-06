							

window.addEventListener("keydown", function (event) {
	  if (event.keyCode == 39)
	  {
		clickButton('quezac_next');
	  }
	  if (event.keyCode == 37)
	  {
		clickButton('quezac_previous');
	  }
}, true);

var nbCountLegende = 0;

function LegendCount()
{
	nbCountLegende++;
	if (nbCountLegende == 10) {
		document.getElementById('legende').innerHTML = "Je Suis Un Légende (comme toi) :";
	} else if (nbCountLegende == 11){
		nbCountLegende = 0;
		document.getElementById('legende').innerHTML = "Légende :";
	}
	
}

function clickButton(idButton)
{
	var el = document.getElementById(idButton);

	// Firefox
	if (document.createEvent) {
		var event = document.createEvent("MouseEvents");
		event.initEvent("click", true, true);
		el.dispatchEvent(event);
	}
	// IE
	else if (el.click) {
		el.click();
	}
}