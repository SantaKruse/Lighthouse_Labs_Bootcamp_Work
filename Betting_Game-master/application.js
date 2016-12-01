// The document.addEventListener() method attaches an event handler to the document.
// The DOMContentLoaded event is fired when the initial HTML document has been completely loaded and parsed, without waiting for stylesheets, images, and subframes to finish loading.
$(document).ready(function(){
  console.log("DOM fully loaded");

  var generateRandomNumber = function() {
    return parseInt(Math.random() * 10);
  }

// document.querySelector("#balance") the first element in the document with the ID "BALANCE" is returned:
// InnerText retrieves and sets the content of the tag as plain text
// Inner text is required becuase it is not an input field
  var displayBalance = function(balance) {
    $("#balance").text(balance);
  }

  var balance = 100;
  displayBalance(balance);

// you can use .value because it is an input field 
  var getInputs = function() {
    var guess;
    var generated;

    generated = $("#betAmount").val();
    generated = parseInt(generated);

    guess = $("#number").val();
    guess = parseInt(guess);
    // FIXME: Add function to validate inputs here

    var resultObject = {
      bet: generated, 
      guess: guess
    };

    return resultObject;
  }

  var playRound = function(e) {
    e.stopPropagation(); // prevent the event from bubbling up to parent DOM elements

    var inputs = getInputs();
    var randomNumber = generateRandomNumber();

    if(inputs.guess === randomNumber) {
      balance += inputs.bet * 2;
    } else if(Math.abs(inputs.guess - randomNumber) === 1) {
      console.log("You are one off. You get your money back");
    } else {
      balance -= inputs.bet;
    }
    displayBalance(balance);
  }

  // Play the round as soon as the user is done filling out the second input field
  // document.querySelector("#number").addEventListener("blur", playRound);
  $("button").on("click", playRound);
  $("#game_area").on("click", function() {
    console.log("game area caught click");
  });
 
  // $("button").on("click", playRound);
  // document.querySelector("button").addEventListener("click", function() {
  //   playRound();
  // });
});
console.log("Outside DOM loaded");

