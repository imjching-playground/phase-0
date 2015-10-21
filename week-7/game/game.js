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

// Pseudocode
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


//  DECLARE solved
//    SET variable solved equal to true
//    FOR EACH cell in table
//      IF text is invisible AND isMine is false
//         SET solved equal to false
//    RETURN solved

// Initial Code

//  DECLARE function newBoard
function newBoard() {
  // initialize board
  var board = [
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0]
    ];

  // randomize mines
  for (var rowIndex in board) {
    for (var cellIndex in board[rowIndex]) {
      var isMine = false;
      var rand = Math.floor((Math.random() * 5));
      if (rand === 0) {
        board[rowIndex][cellIndex] = true;
      }
    }
  }
  console.log(board);

  // detect adjacent mine quantities
  for (rowIndex in board) {
    for (cellIndex in board[rowIndex]) {
      // if current cellIndex is not a mine
      if (board[rowIndex][cellIndex] !== true) {
        // get indices of neighboring cells
        var indexLeft = board[rowIndex][Number(cellIndex) - 1];
        var indexRight = board[rowIndex][Number(cellIndex) + 1];
        // var indexTop = board[rowIndex + 1][cellIndex];
        // var indexTopLeft = board[rowIndex - 1][cellIndex - 1];
        // var indexTopRight = board[rowIndex - 1][cellIndex + 1];
        // var indexBottom = board[rowIndex - 1][cellIndex];
        // var indexBottomLeft = board[rowIndex + 1][cellIndex - 1];
        // var indexBottomRight = board[rowIndex + 1][cellIndex + 1];
      }
    }
  }

  console.log(board);
}

newBoard();

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




// Refactored Code






// Reflection
//
//
//
//
//
//
//
//