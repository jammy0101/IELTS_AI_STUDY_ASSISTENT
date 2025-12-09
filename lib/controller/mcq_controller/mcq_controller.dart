// import 'package:get/get.dart';
//
// import '../../services/ai_service.dart';
//
//
// class MCQController extends GetxController {
//   final AIService api = AIService();
//
//   var isLoading = false.obs;
//   var question = "".obs;
//   var options = <String>[].obs;
//   var answer = "".obs;
//
//   Future<void> generateMCQ(String text) async {
//     isLoading.value = true;
//
//     final data = await api.generateMCQ(text);
//
//     question.value = data["question"];
//     options.value = List<String>.from(data["options"]);
//     answer.value = data["answer"];
//
//     isLoading.value = false;
//   }
// }


import 'package:get/get.dart';
import '../../services/ai_service.dart';

class MCQController extends GetxController {
  final AIService api = AIService();

  var isLoading = false.obs;
  var question = "".obs;
  var options = <String>[].obs;
  var answer = "".obs;

  Future<void> generateMCQ(String text) async {
    isLoading.value = true;

    final data = await api.generateMCQ(text);

    question.value = data["question"];
    options.value = List<String>.from(data["options"]);
    answer.value = data["answer"];

    isLoading.value = false;
  }
}
