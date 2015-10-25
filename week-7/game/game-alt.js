// board settings
var boardHeight = 4;
var boardWidth = 4;
var mineChance = 4; // chance is 1 / (mineChance - 1)

// initialize board
var board = [];

function newBoard() {
  // Cell constructor
  function Cell() {}

  // loop to create rows
  for (var rowNo = 0; rowNo < boardHeight; rowNo++) {
    var rowOfCells = [];

    // loop to fill each column (index) of rows with a Cell object
    for (var colNo = 0; colNo < boardWidth; colNo++) {

      // assign Cell mineStatus randomly
      newCell = {mineStatus: ((Math.floor(Math.random() * mineChance)) === 0) ? true : false};
      if (newCell.mineStatus === false) {
        newCell.touching = 0;
      }
      rowOfCells.push(newCell);
    }

    // push filled row to board
    board.push(rowOfCells);
  }

  // loop through cells to determine neighboring mines touching safe cells
  for (rowNo = 0; rowNo < boardHeight; rowNo++) {
    for (colNo = 0; colNo < boardWidth; colNo++) {

      // if current cell is safe (not a mine)
      if (board[rowNo][colNo].mineStatus === false) {

        // if left cell is a mine, increment counter
        var leftCell = board[rowNo][colNo - 1];
        if (leftCell !== undefined && leftCell.mineStatus === true) {
          board[rowNo][colNo].touching += 1;
        }

        // if right cell is a mine, increment counter
        var rightCell = board[rowNo][colNo + 1];
        if (rightCell !== undefined && rightCell.mineStatus === true) {
          board[rowNo][colNo].touching += 1;
        }

        // if not top row
        if (rowNo > 0) {

          // check cells above for mines
          var topCell = board[rowNo - 1][colNo];
          var topLeftCell = board[rowNo - 1][colNo - 1];
          var topRightCell = board[rowNo - 1][colNo + 1];

          // increment cell value for each mine touching above
          if (topCell !== undefined && topCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (topLeftCell !== undefined && topLeftCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (topRightCell !== undefined && topRightCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
        }

        // if not bottom row
        if (rowNo < boardHeight - 1) {

          // check cells below
          var bottomCell = board[rowNo + 1][colNo];
          var bottomLeftCell = board[rowNo + 1][colNo - 1];
          var bottomRightCell = board[rowNo + 1][colNo + 1];

          // increment cell value for each mine touching below
          if (bottomCell !== undefined && bottomCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (bottomLeftCell !== undefined && bottomLeftCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
          if (bottomRightCell !== undefined && bottomRightCell.mineStatus === true) {
            board[rowNo][colNo].touching += 1;
          }
        }
      }
    }
  }

  return board;
}

console.log(newBoard());

// // when HTML is loaded
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

//   // loop through buttons and assign function to onclick property
//   for (var i = 0; i < buttons.length; i++) {

//     // reveal tile on click via CSS class change
//     buttons[i].onclick = function() {
//       this.className = "revealed";

//       // game over if mine
//       if (this.innerHTML === "X") {
//         alert("You've met with a terrible fate.");
//       }

//       // victory if all safe tiles revealed
//       else if (checkSolved()) {
//         alert("A WINNER IS YOU");
//       }
//     };
//   }

//   // returns true if solved, else false
//   function checkSolved() {
//     var solvedStatus = true;

//     // loop through cells
//     for (var i = 0; i < buttons.length; i++) {

//       // if any non-mine is still unrevealed, solvedStatus is false
//       if (buttons[i].className !== "revealed" && buttons[i].innerHTML !== "X") {
//         solvedStatus = false;
//       }
//     }
//     return solvedStatus;
//   }
// };


// ============================================================================
// TODO:
// ============================================================================

//       HARD
// convert to canvas
// prevent first click from being a mine
// prevent mines from appearing in unguessable locations (e.g. corners
//  surrounded by other mines)

//       MEDIUM
// right-click = mark suspected bomb with flag
// allow user to configure board dimensions
// allow user to configure number of mines
// reset board button
// auto-uncover adjacent 0's

//       EASY
// color text differently based on number
// show total mines
// show mines remaining
// show blank instead of 0
// add mine image instead of "X"