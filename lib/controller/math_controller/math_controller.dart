//
// import 'package:get/get.dart';
// import '../../services/ai_service.dart';
//
// class MathController extends GetxController {
//   var result = "".obs;
//   var isLoading = false.obs;
//   final ai = AIService();
//
//   // REMOVE LaTeX from output
//   String cleanMathOutput(String text) {
//     return text
//         .replaceAll(r'$', '')
//         .replaceAll(r'$$', '')
//         .replaceAll(r'\(', '')
//         .replaceAll(r'\)', '')
//         .replaceAll(r'\[', '')
//         .replaceAll(r'\]', '');
//   }
//
//   Future<void> solve(String query) async {
//     if (isLoading.value) return;
//
//     isLoading.value = true;
//     result.value = "";
//
//     try {
//       final output = await ai.solveMath(query);
//
//       // Clean LaTeX before displaying
//       result.value = cleanMathOutput(output);
//
//     } catch (e) {
//       result.value = "❌ Unexpected error: ${e.toString().split('\n').first}";
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'package:get/get.dart';
import '../../services/ai_service.dart';

class MathController extends GetxController {
  var result = "".obs;
  var isLoading = false.obs;

  final ai = AIService();

  Future<void> solve(String query) async {
    if (isLoading.value) return;

    isLoading.value = true;
    result.value = "";

    try {
      final output = await ai.solveMath(query);
      result.value = output;
    } catch (e) {
      result.value = "❌ Error: ${e.toString()}";
    } finally {
      isLoading.value = false;
    }
  }
}
