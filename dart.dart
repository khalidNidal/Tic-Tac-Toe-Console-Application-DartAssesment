import 'dart:io';

List<String> board = [
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9'
]; // list contains the number of the board sections
String playerShape = 'X'; // this variable contains the shape of the player
bool win = false;

bool checkWin(List<String> board) {
  // this function to check the player wins or not
  for (int i = 0; i < 9; i += 3) {
    // loop to check the board rows
    if (board[i] == board[i + 1] && board[i + 1] == board[i + 2]) {
      // if there is a match in one row return true
      return true;
    }
  }

  for (int i = 0; i < 3; i++) {
    // loop to check the board columns
    if (board[i] == board[i + 3] && board[i + 3] == board[i + 6]) {
      // if there is a match in one col return true
      return true;
    }
  }

  if (board[0] == board[4] && board[4] == board[8]) {
    // if there is a match in one diagonal return true
    return true;
  }

  if (board[2] == board[4] && board[4] == board[6]) {
    // if there is a match in another diagonal return true
    return true;
  }

  return false;
}

void printBoard(List<String> board) {
  // function to make the board look nice
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('---+---+---');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('---+---+---');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

void afterEveryMove() {
  if (checkWin(board)) {
    print('player $playerShape wins!');
    win = true;
  } else if (board.every((element) => element == 'X' || element == 'O')) {
    // check if there is a draw (if there is no numbers in list and checkwin not true so its draw)
    print('It\'s a draw!');
    win = true;
  } else {
    playerShape =
        playerShape == 'X' ? 'O' : 'X'; // switch the shape of the player
  }
}

void main() {
  int move; // this variable contains the move of the player

  print('Welcome to Tic Tac Toe!');
  printBoard(board);

  while (!win) {
    print('player $playerShape, enter your move (1-9):');
    move = int.parse(stdin.readLineSync()!);

    if (move < 1 ||
        move > 9 ||
        board[move - 1] == 'X' ||
        board[move - 1] == 'O') // check if the move is valid or not
    {
      print('Invalid move. Please try again.');
      continue; // if not valid continue
    }
    board[move - 1] =  playerShape; // if valid replace the move (section number) with the shape of the player
       
    printBoard(board);

    afterEveryMove();
  }
}
