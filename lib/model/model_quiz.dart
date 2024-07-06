class QuizCategory {
  final String name;
  final String image;
  final List<QuizSet> quizSets;

  QuizCategory({required this.name, required this.image, required this.quizSets});
}

class QuizSet {
  final String name;
  final List<Question> questions;

  QuizSet({required this.name, required this.questions});
}

class Question {
  String question;
  List<String> options;
  int selectedIndex;

  Question(this.question, this.options, this.selectedIndex);
}