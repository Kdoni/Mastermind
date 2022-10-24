# Mastermind
Inspired by the Odin Project. Ruby on Rails Path.
Simulating a simple guess a 4-digit password.

Two adaptations will be implemented: Whether the human will be the one
attempting to crack the code, or the computer.

Rules:\n\n

A random 4-dig password from 1 to 6 (duplicate numbers are valid) will be
randomly generated.

The agent (the computer or the player) will be attempting to match the code
in no less than 12 tries.

Upon each guess hints will be given.
A "P" from correct position will signal that a number is indeed correct, but in the
wrong position.
A "E" from exact position will signal that a number is both the correct one and in the
designated position.

Should the agent crack the code withing 12 turns, they will be crown victorious.
Otherwise the game is lost.
