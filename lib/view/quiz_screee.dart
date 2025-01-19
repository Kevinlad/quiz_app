import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  final QuizController quizController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Obx(() {
        final question = quizController
            .quiz.value.questions?[quizController.currentQuestionIndex.value];
        if (question == null) {
          return const Center(
            child: Text(
              'No questions available',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Question ${quizController.currentQuestionIndex.value + 1}/${quizController.quiz.value.questions?.length ?? 0}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                question.description ?? 'No question text available',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: Colors.indigoAccent.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      itemCount: question.options?.length ?? 0,
                      itemBuilder: (context, index) {
                        final option = question.options![index];
                        return Container(
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: Obx(() {
                              return ListTile(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                tileColor:
                                    quizController.selectedOption.value == index
                                        ? Colors.indigoAccent.withOpacity(0.2)
                                        : Colors.white,
                                title: Text(
                                  option.description ?? '',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                leading: Radio<int>(
                                  value: index,
                                  groupValue:
                                      quizController.selectedOption.value,
                                  activeColor: Colors.indigo,
                                  onChanged: (value) {
                                    quizController.selectOption(value!);
                                  },
                                ),
                              );
                            }));
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (quizController.selectedOption.value == -1) {
                      Get.snackbar(
                        'Error',
                        'Please select an answer',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        colorText: Colors.white,
                      );
                      return;
                    }
                    if (quizController.isLastQuestion) {
                      quizController.calculateResult();
                      quizController.navigateToResults();
                    } else {
                      final selected = question
                              .options?[quizController.selectedOption.value]
                              .isCorrect ??
                          false;
                      quizController.nextQuestion(selected);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    quizController.isLastQuestion ? 'Submit' : 'Next',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
