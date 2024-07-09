const rockBtn = document.getElementById('rock');
const paperBtn = document.getElementById('paper');
const scissorsBtn = document.getElementById('scissors');
const computerChoiceDOM = document.getElementById('computer-choice');
const userChoiceDOM = document.getElementById('user-choice');
const resultDOM = document.getElementById('result');

let userChoice;
let computerChoice;

rockBtn.addEventListener('click', () => {
    userChoice = 'rock';
    playGame();
});

paperBtn.addEventListener('click', () => {
    userChoice = 'paper';
    playGame();
});

scissorsBtn.addEventListener('click', () => {
    userChoice = 'Scissors';
    playGame();
});

function playGame() {
    computerChoice = getComputerChoice();
    computerChoiceDOM.textContent = `Computer chose: ${computerChoice}`;
    userChoiceDOM.textContent = `You chose: ${userChoice}`;
    resultDOM.textContent = getResult(userChoice, computerChoice);
}

function getComputerChoice() {
    const choices = ['rock', 'paper', 'Scissors'];
    return choices[Math.floor(Math.random() * choices.length)];
}

function getResult(userChoice, computerChoice) {
    if (userChoice === computerChoice) {
        return 'It\'s a tie!';
    } else if ((userChoice === 'rock' && computerChoice === 'cissors') ||
               (userChoice === 'paper' && computerChoice === 'rock') ||
               (userChoice === 'cissors' && computerChoice === 'paper')) {
        return 'You win!';
    } else {
        return 'Computer wins!';
    }
}