// U3.W9:JQuery


// I worked on this challenge with: Eran Chazan.
// This challenge took me 1 hours.

$(document).ready(function(){

//RELEASE 0:
  //link the image

//RELEASE 1:

  //Link this script and the jQuery library to the jQuery_example.html file and analyze what this code does.

$('body').css({'background-color': 'pink'});

//RELEASE 2:
  //Add code here to select elements of the DOM
mascot = $('.mascot');
h1 = $('h1');
img = $('img');

//RELEASE 3:
  // Add code here to modify the css and html of DOM elements
firstH1 = $('body>h1');
firstH1.css('color', 'green');
firstH1.css('border', '2px solid black');
firstH1.css('visibility', 'visible');


//RELEASE 4: Event Listener
  // Add the code for the event listener here
$('img').on('mouseover', function(e){
  e.preventDefault();
  $(this).attr('src', 'copperheads.png');
  $(this).css('border', '1px solid green');
  $(this).animate({
    borderWidth: '4px',
    height: '486',
    width: '820'
  }, 1000
  );
});

$('img').on('mouseleave', function(e){
  e.preventDefault();
  $(this).attr('src', 'dbc_logo.png');
});

//RELEASE 5: Experiment on your own

// we nested the animations inside of the mouseover function above (release 4)





});  // end of the document.ready function: do not remove or write DOM manipulation below this.



/* REFLECTION
What is jQuery?
It's a JavaScript library that makes it easier to manipulate the DOM. It
particularly excels at modifying styling of of DOM elements, animations, and
event-handling.

What does jQuery do for you?
It reduces the amount of code that I have to write to manipulate the DOM and
allows me to create more interactivity on a site without spending as much time
as I would with pure JS.

What did you learn about the DOM while working on this challenge?
You can't select images by filename (seems obvious why).
*/