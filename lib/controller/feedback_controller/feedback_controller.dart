import 'package:get/get.dart';

import '../../services/ai_service.dart';


class FeedbackController extends GetxController {
  final AIService api = AIService();

  var isLoading = false.obs;
  var feedback = "".obs;

  Future<void> generateFeedback(String text) async {
    isLoading.value = true;
    feedback.value = await api.feedback(text);
    isLoading.value = false;
  }
}
