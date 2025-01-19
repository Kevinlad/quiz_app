import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

import '../view/result_scree.dart';

class QuizController extends GetxController {
  final String apiUrl = "https://api.jsonserve.com/Uw5CrX";

  var quiz = Quiz().obs;
  var isLoading = true.obs;
  var currentQuestionIndex = 0.obs;
  var totalScore = 0.obs;
  RxInt selectedOption = RxInt(-1);

  Map<String, int> selectedOptions = {};

  @override
  void onInit() {
    super.onInit();
    fetchQuiz();
  }

  Future<void> fetchQuiz() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        quiz.value = Quiz.fromJson(json.decode(response.body));
      } else {
        Get.snackbar(
          'Error',
          'Failed to load quiz data (Error Code: ${response.statusCode})',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred while fetching data: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void nextQuestion(bool isCorrect) {
    final currentQuestionId =
        quiz.value.questions?[currentQuestionIndex.value].id;

    if (currentQuestionId != null) {
      selectedOptions[currentQuestionId.toString()] = selectedOption.value;
    }

    if (isCorrect) {
      totalScore.value++;
    }

    if (currentQuestionIndex.value < (quiz.value.questions?.length ?? 0) - 1) {
      currentQuestionIndex.value++;
      selectedOption.value = -1;
    } else {
      navigateToResults();
    }
  }

  bool get isLastQuestion {
    return currentQuestionIndex.value ==
        (quiz.value.questions?.length ?? 0) - 1;
  }

  void selectOption(int optionIndex) {
    selectedOption.value = optionIndex;
  }

  void calculateResult() {
    final question = quiz.value.questions?[currentQuestionIndex.value];
    if (question != null &&
        selectedOption.value != -1 &&
        question.options?[selectedOption.value].isCorrect == true) {
      totalScore.value++;
    }
  }

  void resetQuiz() {
    currentQuestionIndex.value = 0;
    totalScore.value = 0;
    selectedOption.value = -1;
  }

  void navigateToResults() {
    Get.to(() => ResultsScreen(), arguments: {
      'totalScore': totalScore.value,
      'totalQuestions': quiz.value.questions?.length ?? 0,
    });
  }
}
