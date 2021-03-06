 // Design Basic Game Solo Challenge

// This is a solo challenge

// Your mission description:
// Overall mission: uncover all the tiles without hitting a mine.
// Goals: identify safe tiles to click.
// Characters: the player.
// Objects: tiles (mine tiles and safe tiles). Possibly flags after MVP.
// Functions:
//    newBoard => randomize tiles
//    clickCell => uncovers the tile
//    mine => game over
//    safe => display number of mines touching
//    solved => check if board solved (victory)
//    settings (optional function) => configure size of board and # of mines
//    flag (optional function) => mark tile with flag (suspected mine)

// ============================================================================
// Pseudocode
// ============================================================================

//  CREATE HTML/CSS table with 5 rows and 5 columns, invisible text.

//  DECLARE function newBoard
//    FOR EACH cell in table
//      ASSIGN variable isMine to undefined
//      GENERATE random number between 0 - 4.
//      IF 0
//        SET isMine to true
//      ELSE
//        SET isMine to false
//        ASSIGN variable minesTouching equal to 0
//    FOR EACH cell in table
//      IF isMine is equal to true
//        FOR EACH cell touching (adjacent or diagonal)
//          INCREMENT minesTouching by 1


//  DECLARE function clickCell
//    FOR cell
//      SET text to visible
//      IF isMine is true
//        PRINT "You died. Game over."


//  DECLARE function solved
//    SET variable solved equal to true
//    FOR EACH cell in table
//      IF text is invisible AND isMine is false
//         SET solved equal to false
//    RETURN solved

// ============================================================================
// Initial Code
// ============================================================================

// // initialize board
// var board = [
//   [0, 0, 0, 0, 0],
//   [0, 0, 0, 0, 0],
//   [0, 0, 0, 0, 0],
//   [0, 0, 0, 0, 0],
//   [0, 0, 0, 0, 0]
//   ];

// function newBoard() {
//   // randomize mine placement
//   for (var rowIndex in board) {
//     for (var cellIndex in board[rowIndex]) {
//       var rand = Math.floor((Math.random() * 3));
//       if (rand === 0) {
//         board[rowIndex][cellIndex] = "X";
//       }
//     }
//   }

//   // detect adjacent mine quantities
//   for (rowIndex in board) {
//     for (cellIndex in board[rowIndex]) {
//       cellIndex = Number(cellIndex);
//       rowIndex = Number(rowIndex);

//       // if current cellIndex is safe (not a mine)
//       if (board[rowIndex][cellIndex] !== "X") {

//         // check neighboring cells for mines
//         var leftCell = board[rowIndex][cellIndex - 1];
//         var rightCell = board[rowIndex][cellIndex + 1];

//         if (leftCell === "X") {
//           board[rowIndex][cellIndex] += 1;
//         }
//         if (rightCell === "X") {
//           board[rowIndex][cellIndex] += 1;
//         }

//         // if not top row
//         if (rowIndex > 0) {

//           // check cells above for mines
//           var topCell = board[rowIndex - 1][cellIndex];
//           var topLeftCell = board[rowIndex - 1][cellIndex - 1];
//           var topRightCell = board[rowIndex - 1][cellIndex + 1];

//           if (topCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//           if (topLeftCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//           if (topRightCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//         }

//         // if not bottom row
//         if (rowIndex < 4) {

//           // check cells below
//           var bottomCell = board[rowIndex + 1][cellIndex];
//           var bottomLeftCell = board[rowIndex + 1][cellIndex - 1];
//           var bottomRightCell = board[rowIndex + 1][cellIndex + 1];

//           if (bottomCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//           if (bottomLeftCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//           if (bottomRightCell === "X") {
//             board[rowIndex][cellIndex] += 1;
//           }
//         }
//       }
//     }
//   }
//   console.log(board);
// }

// newBoard();

// // wait until page loads
// window.onload = function() {
//   var table = document.getElementById("table");

//   // loop through HTML table rows
//   for (var tRow = 0; tRow <= 4; tRow++) {

//     // loop through HTML cells/columns
//     for (var tCell = 0; tCell <= 4; tCell++) {

//       // assign values from JS board to corresponding HTML table cells
//       var boardValueAtIndex = board[tRow][tCell];
//       table.rows[tRow].cells[tCell].firstChild.innerHTML = boardValueAtIndex;
//     }
//   }

//   // get list of buttons
//   var buttons = document.getElementsByTagName("button");

//   // loop through buttons and assign onclick property
//   for (var i = 0; i < buttons.length; i++) {
//     // reveal tile on click
//     buttons[i].onclick = function() {
//       this.className = "revealed";

//       // game over if mine
//       if (this.innerHTML === "X") {
//         alert("Game over!");
//       }

//       // victory if all safe tiles revealed
//       else {
//         if (checkSolved()) {
//           alert("Victory!");
//         }
//       }
//     };
//   }

//   // returns true if solved, else false
//   function checkSolved() {
//     var solvedStatus = true;
//     for (var i = 0; i < buttons.length; i++) {
//       if (buttons[i].className !== "revealed" && buttons[i].innerHTML !== "X") {
//         solvedStatus = false;
//       }
//     }
//     return solvedStatus;
//   }
// };

// ============================================================================
// Refactored Code
// ============================================================================

// board settings
var boardHeight = 5; var boardWidth = 5;
var mineChance = 5; // probability of mine is 1 / (mineChance - 1)

// mine-counter
var mineCount = 0;

// initialize board
var board = [];

// generate new board
function newBoard() {
  // loop to create rows
  for (var rowNo = 0; rowNo < boardHeight; rowNo++) {
    var rowOfCells = [];

    // loop to fill each column (index) of rows with Cell objects
    for (var colNo = 0; colNo < boardWidth; colNo++) {

      // assign cell mineStatus randomly based on mineChance setting
      newCell = {
        mineStatus: (((Math.floor(Math.random() * mineChance)) === 0) ? true : false),
      };

      if (newCell.mineStatus === false) {
        newCell.touching = 0;
      }
      else {
        mineCount += 1;
      }
      rowOfCells.push(newCell);
    }

    // push filled row to board
    board.push(rowOfCells);
  }

  // loop through rows and columns to determine neighboring mines touching safe cells
  for (rowNo = 0; rowNo < boardHeight; rowNo++) {
    for (colNo = 0; colNo < boardWidth; colNo++) {

      // if current cell is safe (not a mine)
      if (board[rowNo][colNo].mineStatus === false) {

        // if left cell is a mine, increment counter
        var lefcolNo = board[rowNo][colNo - 1];
        if (lefcolNo && lefcolNo.mineStatus === true) {
          board[rowNo][colNo].touching += 1;
        }

        // if right cell is a mine, increment counter
        var righcolNo = board[rowNo][colNo + 1];
        if (righcolNo && righcolNo.mineStatus === true) {
          board[rowNo][colNo].touching += 1;
        }

        // if not top row
        if (rowNo > 0) {

          // check cells above for mines
          var topCell = board[rowNo - 1][colNo];
          var topLefcolNo = board[rowNo - 1][colNo - 1];
          var topRighcolNo = board[rowNo - 1][colNo + 1];

          // increment cell value for each mine touching above
          if (topCell && topCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (topLefcolNo && topLefcolNo.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (topRighcolNo && topRighcolNo.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
        }

        // if not bottom row
        if (rowNo < boardHeight - 1) {

          // check cells below
          var bottomCell = board[rowNo + 1][colNo];
          var bottomLefcolNo = board[rowNo + 1][colNo - 1];
          var bottomRighcolNo = board[rowNo + 1][colNo + 1];

          // increment cell value for each mine touching below
          if (bottomCell && bottomCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (bottomLefcolNo && bottomLefcolNo.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (bottomRighcolNo && bottomRighcolNo.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
        }
      }
    }
  }

  return board;
}

// map JS board values to corresponding HTML table cells
function applyValues() {
  var table = document.getElementById("board");

  // loop through HTML table rows and columns
  for (var rowNo = 0; rowNo < boardHeight; rowNo++) {
    for (var colNo = 0; colNo < boardWidth; colNo++) {

      // reset any class changes from previous games
      table.rows[rowNo].cells[colNo].firstChild.className = "cell";

      // assign values from JS board to corresponding HTML table cells
      var currentBoardCell = board[rowNo][colNo];
      if (currentBoardCell.mineStatus === true) {
        table.rows[rowNo].cells[colNo].firstChild.innerHTML = "X";
      }
      else {
        table.rows[rowNo].cells[colNo].firstChild.innerHTML = currentBoardCell.touching;
      }
    }
  }
}

// applies onclick function to all button elements without explicit ID
function applyButtonBehavior() {

  // return true if solved, else false
  function checkSolved() {
    var solvedStatus = true;
    for (i = 0; i < buttons.length; i++) {
      if (buttons[i].className.indexOf("revealed") < 0 && buttons[i].innerHTML !== "X") {
        solvedStatus = false;
      }
    }
    return solvedStatus;
  }

  // show unfound tiles with special formatting
  function revealBoard() {
    for (i = 0; i < buttons.length; i++) {
      if (buttons[i].className.indexOf("revealed") < 0) {
        buttons[i].className += " unfound";
      }
    }
  }

  // get list of buttons
  var buttons = document.getElementsByClassName("cell");

  // loop through buttons and assign onclick function
  for (var i = 0; i < buttons.length; i++) {
    buttons[i].onclick = function() {

      // reveal tile on click via CSS class change
      this.className += " revealed";

      // victory if all safe tiles revealed
      if (this.innerHTML !== "X" && checkSolved()) alert("A WINNER IS YOU!");

      // game over if mine
      if (this.innerHTML === "X") {
        this.className += " mine";
        revealBoard();
        alert("You've met with a terrible fate :(");
      }

      // apply CSS color to safe tiles, depending on number revealed
      else {
        switch(this.innerHTML) {
          case "0":
            this.className += " zero";
            break;
          case "1":
            this.className += " one";
            break;
          case "2":
            this.className += " two";
            break;
          case "3":
            this.className += " three";
            break;
          case "4":
            this.className += " four";
            break;
          case "5":
            this.className += " five";
            break;
          case "6":
            this.className += " six";
            break;
          case "7":
            this.className += " seven";
            break;
          case "8":
            this.className += " eight";
            break;
        }
      }
    };

    // right-click mine-marking functionality
    buttons[i].oncontextmenu = function() {
      this.className += " marked";
      return false;
    };
  }
}

function setMineCounter() {
  var counter = document.getElementById("counter");
  counter.innerHTML = mineCount;
}

function resetBoard() {
  mineChance = getDifficulty();
  mineCount = 0;
  board = [];
  newBoard();
  setMineCounter();
  applyValues();
  applyButtonBehavior();
}

// check radio button inputs and return corresponding mine chance
function getDifficulty() {
  var radioButtons = document.getElementsByName("mine-chance");

  for (i = 0; i < 3; i++) {
    if (radioButtons[i].checked) {
      switch(i) {
        case 0:
          difficulty = 5;
          break;
        case 1:
          difficulty = 4;
          break;
        case 2:
          difficulty = 3;
          break;
      }
    }
  }

  return difficulty;
}

// reset button
function resetButtonBehavior() {
  document.getElementById("reset").onclick = function() {
    resetBoard();
  };
}

// assign board values to HTML table and click behavior to buttons on page load
window.onload = function() {
  newBoard();
  setMineCounter();
  applyValues();
  applyButtonBehavior();
  resetButtonBehavior();
};


// ============================================================================
// Reflection
// ============================================================================
// What was the most difficult part of this challenge?
//    There were a lot of difficult problems that I had to tackle, but the most
//    difficult was figuring out how to connect my JS array to the table in the
//    DOM. It was very difficult to refer to specific elements in the HTML
//    without giving them each an ID, which I didn't want to do since there
//    are 25 cells by default and I wanted to make it easy to resize. If I were 
//    to rebuild it, I would assign ID's but do so dynamically. I might also do
//    away with the nested array structure altogether, since it makes looping
//    complicated.

// What did you learn about creating objects and functions that interact with one another?
//    Everything, including HTML elements and the page and the window, are JS
//    objects.

// Did you learn about any new built-in methods you could use in your refactored solution? If so, what were they and how do they work?
//    I didn't see any methods that would help in my refactored solution. I
//    mainly swapped the for..in... statements for for-statements, rephrased
//    conditionals, abstracted certain functionality, and added new features.

// How can you access and manipulate properties of objects?
//    With dot notation or bracket notation.

// ============================================================================
// TODO:
// ============================================================================

// convert to canvas(?)
// prevent first click from being a mine
// prevent mines from appearing in unguessable locations (e.g. corners
//  surrounded by other mines)
// auto-uncover adjacent 0's
// allow user to configure board dimensions
// allow user to configure number of mines
