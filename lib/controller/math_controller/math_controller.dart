// import 'package:get/get.dart';
//
// import '../../services/ai_service.dart';
//
// class MathController extends GetxController {
//   final AIService api = AIService();
//
//   var isLoading = false.obs;
//   var result = "".obs;
//
//   Future<void> solve(String query) async {
//     isLoading.value = true;
//     result.value = await api.solveMath(query);
//     isLoading.value = false;
//   }
// }


// import 'package:get/get.dart';
//
// import '../../services/ai_service.dart';
//
// class MathController extends GetxController {
//   final AIService api = AIService();
//
//   var isLoading = false.obs;
//   var result = "".obs;
//
// //   Future<void> solve(String query) async {
// //     isLoading.value = true;
// //     // result.value = await api.solveMath(query);
// //     String output = await api.solveMath(query);
// //
// // // Remove LaTeX math markers: $, $$, etc.
// //     output = output.replaceAll("\$", "").replaceAll("\$\$", "");
// //
// //     result.value = output;
// //
// //     isLoading.value = false;
// //   }
//   Future<void> solve(String query) async {
//     if (isLoading.value) return;
//
//     isLoading.value = true;
//     try {
//       result.value = await api.solveMath(query);
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
// }
//
//


import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../services/ai_service.dart';

class MathController extends GetxController {
  var result = "".obs;
  var isLoading = false.obs;
  final ai = AIService();

  Future<void> solve(String query) async {
    if (isLoading.value) return;
    isLoading.value = true;
    result.value = ""; // clear old
    try {
      final output = await ai.solveMath(query);
      result.value = output;
    } catch (e) {
      result.value = "❌ Unexpected error: ${e.toString().split('\n').first}";
    } finally {
      isLoading.value = false;
    }
  }
}
