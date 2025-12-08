

import 'dart:io';
import 'package:get/get.dart';
import '../../services/ai_service.dart';  // adjust your path

class SummarizerController extends GetxController {
  final AIService api = AIService();

  var isLoading = false.obs;
  var result = "".obs;

  /// -------------------------------------------------------
  /// SUMMARIZE TEXT
  /// -------------------------------------------------------
  Future<void> summarize(String text, String length, bool bullets) async {
    if (text.trim().isEmpty) {
      result.value = "⚠️ Please enter some text to summarize.";
      return;
    }

    try {
      isLoading.value = true;
      result.value = ""; // clear old result

      final summary = await api.summarizeText(
        text.trim(),
        length: length,
        bullets: bullets,
      );

      result.value = summary.isEmpty
          ? "⚠️ No summary was generated. Try again."
          : summary;

    } catch (e) {
      result.value = "❌ Error: $e";
    } finally {
      isLoading.value = false;
    }
  }

  /// -------------------------------------------------------
  /// SUMMARIZE IMAGE TEXT
  /// -------------------------------------------------------
  Future<void> summarizeImage(File imageFile) async {
    try {
      isLoading.value = true;
      result.value = ""; // clear old result

      final summary = await api.summarizeImage(imageFile);

      result.value = summary.isEmpty
          ? "⚠️ Could not extract or summarize text from the image."
          : summary;

    } catch (e) {
      result.value = "❌ Image summarization failed: $e";
    } finally {
      isLoading.value = false;
    }
  }
}

