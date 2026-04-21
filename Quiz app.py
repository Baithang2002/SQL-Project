from __future__ import annotations

import random
from dataclasses import dataclass


@dataclass(frozen=True)
class Question:
    prompt: str
    options: list[str]
    answer: str
    explanation: str


QUESTIONS: list[Question] = [
    Question(
        prompt="What does CPU stand for?",
        options=[
            "Central Processing Unit",
            "Computer Primary Unit",
            "Central Program Utility",
            "Control Processing User",
        ],
        answer="A",
        explanation="CPU stands for Central Processing Unit.",
    ),
    Question(
        prompt="Which keyword is used to create a function in Python?",
        options=["func", "define", "def", "function"],
        answer="C",
        explanation="Python uses the 'def' keyword to define a function.",
    ),
    Question(
        prompt="What is the output type of input() in Python?",
        options=["int", "float", "str", "bool"],
        answer="C",
        explanation="input() always returns text, which is a string.",
    ),
    Question(
        prompt="Which symbol is used for comments in Python?",
        options=["//", "#", "/*", "--"],
        answer="B",
        explanation="Single-line comments in Python begin with '#'.",
    ),
    Question(
        prompt="Which of these is a Python list?",
        options=["{1, 2, 3}", "(1, 2, 3)", "[1, 2, 3]", "<1, 2, 3>"],
        answer="C",
        explanation="Lists use square brackets: [ ].",
    ),
    Question(
        prompt="How many times will this run? for i in range(5)",
        options=["4", "5", "6", "It causes an error"],
        answer="B",
        explanation="range(5) gives 0, 1, 2, 3, 4, so the loop runs 5 times.",
    ),
    Question(
        prompt="Which operator is used for equality comparison in Python?",
        options=["=", "==", "!=", ":="],
        answer="B",
        explanation="'==' compares two values for equality.",
    ),
    Question(
        prompt="Which file extension is used for Python files?",
        options=[".java", ".py", ".pt", ".python"],
        answer="B",
        explanation="Python source files use the .py extension.",
    ),
]

OPTION_LABELS = ("A", "B", "C", "D")


def print_title() -> None:
    print("\n=== Python Quiz App ===")
    print("Test your basics and check your score.")


def show_menu() -> None:
    print("\n1. Start quiz")
    print("2. View rules")
    print("3. Exit")


def show_rules() -> None:
    print("\n--- Rules ---")
    print("1. Each question has four options: A, B, C, and D.")
    print("2. Type the letter of the correct answer and press Enter.")
    print("3. Every correct answer gives you 1 point.")
    print("4. Your final score and percentage are shown at the end.")


def get_menu_choice() -> str:
    while True:
        choice = input("\nChoose an option: ").strip()
        if choice in {"1", "2", "3"}:
            return choice
        print("Please enter 1, 2, or 3.")


def get_answer() -> str:
    while True:
        answer = input("Your answer (A/B/C/D): ").strip().upper()
        if answer in OPTION_LABELS:
            return answer
        print("Please enter only A, B, C, or D.")


def performance_message(score: int, total: int) -> str:
    percent = (score / total) * 100
    if percent == 100:
        return "Excellent! You got every answer right."
    if percent >= 75:
        return "Very good! Your basics are strong."
    if percent >= 50:
        return "Nice work! Keep practicing and you will improve fast."
    return "Good start. Review the wrong answers and try again."


def run_quiz() -> None:
    shuffled_questions = random.sample(QUESTIONS, k=len(QUESTIONS))
    score = 0
    wrong_answers: list[tuple[Question, str]] = []

    print("\nStarting the quiz...")

    for number, question in enumerate(shuffled_questions, start=1):
        print(f"\nQuestion {number}: {question.prompt}")
        for label, option in zip(OPTION_LABELS, question.options):
            print(f"{label}. {option}")

        user_answer = get_answer()

        if user_answer == question.answer:
            score += 1
            print("Correct!")
        else:
            wrong_answers.append((question, user_answer))
            correct_option = question.options[OPTION_LABELS.index(question.answer)]
            print(f"Wrong. Correct answer: {question.answer}. {correct_option}")
            print(f"Explanation: {question.explanation}")

    total_questions = len(shuffled_questions)
    percentage = (score / total_questions) * 100

    print("\n--- Quiz Result ---")
    print(f"Score: {score}/{total_questions}")
    print(f"Percentage: {percentage:.1f}%")
    print(performance_message(score, total_questions))

    if wrong_answers:
        print("\nReview:")
        for question, user_answer in wrong_answers:
            correct_option = question.options[OPTION_LABELS.index(question.answer)]
            print(f"- {question.prompt}")
            print(f"  Your answer: {user_answer}")
            print(f"  Correct answer: {question.answer}. {correct_option}")
    else:
        print("Perfect score. No review needed.")


def main() -> None:
    while True:
        print_title()
        show_menu()
        choice = get_menu_choice()

        if choice == "1":
            run_quiz()
        elif choice == "2":
            show_rules()
        else:
            print("Thanks for playing. Goodbye!")
            break


if __name__ == "__main__":
    main()