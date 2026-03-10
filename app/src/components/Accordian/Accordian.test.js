import { render, screen, fireEvent } from "@testing-library/react";
import '@testing-library/jest-dom';
import Accordian from "./Accordian";

const question = {
  title: "Test Question",
  infos: "Test Answer",
};

test("renders the accordian with the question", () => {
  render(<Accordian question={question} />);
  const questionElement = screen.getByText(/Test Question/i);
  expect(questionElement).toBeInTheDocument();
});

test("does not show the answer by default", () => {
  render(<Accordian question={question} />);
  const answerElement = screen.queryByText(/Test Answer/i);
  expect(answerElement).not.toBeInTheDocument();
});

test("shows the answer when clicked", () => {
  render(<Accordian question={question} />);
  const questionElement = screen.getByText(/Test Question/i);
  fireEvent.click(questionElement);
  const answerElement = screen.getByText(/Test Answer/i);
  expect(answerElement).toBeInTheDocument();
});

test("hides the answer when clicked again", () => {
  render(<Accordian question={question} />);
  const questionElement = screen.getByText(/Test Question/i);
  fireEvent.click(questionElement);
  fireEvent.click(questionElement);
  const answerElement = screen.queryByText(/Test Answer/i);
  expect(answerElement).not.toBeInTheDocument();
});
