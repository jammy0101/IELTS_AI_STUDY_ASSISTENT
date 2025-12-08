//
//
//
// import 'package:flutter/material.dart';
//
// class Math extends StatefulWidget {
//   const Math({super.key});
//
//   @override
//   State<Math> createState() => _MathState();
// }
//
// class _MathState extends State<Math> {
//   final TextEditingController _controller = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F7FB),
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _howItWorksCard(),
//             const SizedBox(height: 18),
//             _quickExamples(),
//             const SizedBox(height: 18),
//             _inputCard(),
//             const SizedBox(height: 26),
//             _solveButton(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // APP BAR
//   // ------------------------------------------------------------
//   AppBar _buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       toolbarHeight: 72,
//       automaticallyImplyLeading: false,
//
//       title: Row(
//         children: [
//           _roundButton(Icons.arrow_back, onTap: () => Navigator.pop(context)),
//           const SizedBox(width: 14),
//
//           // Icon container
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xFF8E44FF).withOpacity(0.15),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(
//               Icons.calculate_rounded,
//               color: Color(0xFF8E44FF),
//               size: 22,
//             ),
//           ),
//
//           const SizedBox(width: 12),
//
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Math Solver",
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "AI-Powered Calculator",
//                 style: TextStyle(fontSize: 12, color: Colors.black54),
//               ),
//             ],
//           ),
//
//           const Spacer(),
//           _roundButton(Icons.more_vert),
//         ],
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // HOW IT WORKS CARD
//   // ------------------------------------------------------------
//   Widget _howItWorksCard() {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFFE8DBFF), Color(0xFFF3EDFF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(16),
//         border: const Border(
//           left: BorderSide(color: Color(0xFF8E44FF), width: 4),
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 12,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//
//       child: Row(
//         children: const [
//           Icon(Icons.lightbulb_outline,
//               size: 22, color: Color(0xFF8E44FF)),
//           SizedBox(width: 12),
//           Expanded(
//             child: Text(
//               "Smart Math Assistant\nType any math problem in natural language. Our AI will solve it step by step.",
//               style: TextStyle(fontSize: 14, height: 1.4),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // QUICK EXAMPLES
//   // ------------------------------------------------------------
//   Widget _quickExamples() {
//     final examples = ["50% of 240", "√144", "15 * 20²", "(24 + 36) ÷ 5"];
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "QUICK EXAMPLES",
//           style:
//           TextStyle(fontSize: 13, color: Colors.black54, letterSpacing: 0.5),
//         ),
//         const SizedBox(height: 10),
//
//         Wrap(
//           spacing: 10,
//           children: examples
//               .map(
//                 (e) => Container(
//               padding:
//               const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 6,
//                     offset: Offset(0, 2),
//                   )
//                 ],
//               ),
//               child: Text(
//                 e,
//                 style: const TextStyle(
//                     fontSize: 13, fontWeight: FontWeight.w600),
//               ),
//             ),
//           )
//               .toList(),
//         ),
//       ],
//     );
//   }
//
//   // ------------------------------------------------------------
//   // INPUT + KEYPAD CARD
//   // ------------------------------------------------------------
//   Widget _inputCard() {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: _cardDecoration(),
//
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Title + Clear Button
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 "Math Problem",
//                 style: TextStyle(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w700,
//                     color: Colors.black87),
//               ),
//               GestureDetector(
//                 onTap: () => _controller.clear(),
//                 child: const Text(
//                   "Clear",
//                   style: TextStyle(
//                     fontSize: 13,
//                     color: Color(0xFF8E44FF),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               )
//             ],
//           ),
//
//           const SizedBox(height: 14),
//
//           // Input Field
//           Container(
//             height: 55,
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(color: Colors.black12),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _controller,
//                     decoration: const InputDecoration(
//                       hintText: "e.g., 50% of 240",
//                       hintStyle:
//                       TextStyle(color: Colors.black38, fontSize: 14),
//                       border: InputBorder.none,
//                     ),
//                   ),
//                 ),
//                 const Icon(Icons.mic_none, color: Colors.black54),
//               ],
//             ),
//           ),
//
//           const SizedBox(height: 20),
//           _keypad(),
//         ],
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // NUMERIC KEYPAD
//   // ------------------------------------------------------------
//   Widget _keypad() {
//     final buttons = [
//       ["7", "8", "9", "÷"],
//       ["4", "5", "6", "×"],
//       ["1", "2", "3", "-"],
//       ["0", ".", "%", "+"],
//     ];
//
//     return Column(
//       children: buttons
//           .map(
//             (row) => Padding(
//           padding: const EdgeInsets.only(bottom: 10),
//           child: Row(
//             children: row
//                 .map(
//                   (btn) => Expanded(
//                 child: Container(
//                   height: 55,
//                   margin: const EdgeInsets.symmetric(horizontal: 6),
//                   decoration: BoxDecoration(
//                     color: btn.length == 1 && "+-×÷".contains(btn)
//                         ? const Color(0xFFF2E9FF)
//                         : const Color(0xFFF7F9FC),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       btn,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             )
//                 .toList(),
//           ),
//         ),
//       )
//           .toList(),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // SOLVE BUTTON
//   // ------------------------------------------------------------
//   Widget _solveButton() {
//     return Container(
//       height: 54,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [
//             Color(0xFFB28DFE),
//             Color(0xFF9C6BFF),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: TextButton.icon(
//         onPressed: () {},
//         icon: const Icon(Icons.calculate, color: Colors.white),
//         label: const Text(
//           "Solve Problem",
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w700,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // ROUND BUTTON
//   // ------------------------------------------------------------
//   Widget _roundButton(IconData icon, {VoidCallback? onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEFF3FA),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Icon(icon, color: Colors.black87, size: 22),
//       ),
//     );
//   }
//
//   // ------------------------------------------------------------
//   // CARD DECORATION
//   // ------------------------------------------------------------
//   BoxDecoration _cardDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.06),
//           blurRadius: 12,
//           offset: const Offset(0, 4),
//         ),
//       ],
//     );
//   }
// }






import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/math_controller/math_controller.dart';

class Math extends StatefulWidget {
  const Math({super.key});

  @override
  State<Math> createState() => _MathState();
}

class _MathState extends State<Math> {
  final TextEditingController _controller = TextEditingController();
  final controller = Get.put(MathController());





  void _insertText(String value) {
    final text = _controller.text;
    final cursorPos = _controller.selection.baseOffset;

    if (cursorPos < 0) {
      // nothing selected → append at end
      _controller.text = text + value;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    } else {
      // insert at cursor position
      final newText =
          text.substring(0, cursorPos) + value + text.substring(cursorPos);

      _controller.text = newText;

      // move cursor forward
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: cursorPos + value.length),
      );
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _howItWorksCard(),
            const SizedBox(height: 18),
            _quickExamples(),
            const SizedBox(height: 18),
            _inputCard(),
            const SizedBox(height: 26),
            _solveButton(),
            const SizedBox(height: 26),

            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Color(0xFF8E44FF)),
                );
              }

              if (controller.result.value.isEmpty) {
                return const SizedBox();
              }

              return _mathResultCard(controller.result.value);
            }),

          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // APP BAR
  // ------------------------------------------------------------
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: 72,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          _roundButton(Icons.arrow_back, onTap: () => Navigator.pop(context)),
          const SizedBox(width: 14),

          // Icon container
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF8E44FF).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calculate_rounded,
              color: Color(0xFF8E44FF),
              size: 22,
            ),
          ),

          const SizedBox(width: 12),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Math Solver",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                "AI-Powered Calculator",
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),

          const Spacer(),
          _roundButton(Icons.more_vert),
        ],
      ),
    );
  }


  Widget _mathResultCard(String text) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // ---------------- HEADER ----------------
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF8E44FF),
                  Color(0xFFB27CFF),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "AI Math Solution",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                Row(
                  children: [
                    // COPY
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: text));
                        Get.snackbar(
                          "Copied",
                          "Solution copied to clipboard",
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                          duration: Duration(seconds: 1),
                        );
                      },
                      child: const Icon(Icons.copy, color: Colors.white, size: 20),
                    ),
                  ],
                )
              ],
            ),
          ),

          // ---------------- CONTENT ----------------
          Container(
            padding: const EdgeInsets.all(18),
            constraints: const BoxConstraints(
              minHeight: 120,
              maxHeight: 350,
            ),
            child: SingleChildScrollView(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.55,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // HOW IT WORKS CARD
  // ------------------------------------------------------------
  Widget _howItWorksCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE8DBFF), Color(0xFFF3EDFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: Color(0xFF8E44FF), width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: const [
          Icon(Icons.lightbulb_outline,
              size: 22, color: Color(0xFF8E44FF)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              "Smart Math Assistant\nType any math problem in natural language. Our AI will solve it step by step.",
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }


  Widget _quickExamples() {
    final examples = ["50% of 240", "√144", "15 * 20²", "(24 + 36) ÷ 5", "2+2"];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "QUICK EXAMPLES",
          style: TextStyle(fontSize: 13, color: Colors.black54, letterSpacing: 0.5),
        ),
        const SizedBox(height: 8),

        Wrap(
          spacing: 10,
          children: examples.map((example) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: GestureDetector(
                onTap: () {
                  // 1️⃣ Put example into input field
                  _controller.text = example;

                  // 2️⃣ Update UI
                  setState(() {});
                  // 3️⃣ Auto-run solver (optional, but recommended)
                 // controller.solve(example);


                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text(
                    example,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _inputCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Clear Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Math Problem",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87),
              ),
              GestureDetector(
                onTap: () => _controller.clear(),
                child: const Text(
                  "Clear",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF8E44FF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),

          const SizedBox(height: 14),

          // Input Field
          Container(
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "e.g., 50% of 240",
                      hintStyle:
                      TextStyle(color: Colors.black38, fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const Icon(Icons.mic_none, color: Colors.black54),
              ],
            ),
          ),

          const SizedBox(height: 20),
          _keypad(),
        ],
      ),
    );
  }


  Widget _keypad() {
    final buttons = [
      ["7", "8", "9", "÷"],
      ["4", "5", "6", "×"],
      ["1", "2", "3", "-"],
      ["0", ".", "%", "+"],
    ];

    return Column(
      children: buttons.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: row.map((btn) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    _insertText(btn);
                  },
                  child: Container(
                    height: 55,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: "+-×÷".contains(btn)
                          ? const Color(0xFFF2E9FF)
                          : const Color(0xFFF7F9FC),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        btn,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
  Widget _solveButton() {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFB28DFE),
            Color(0xFF9C6BFF),
          ],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton.icon(

        // onPressed: () {
        //   if (_controller.text.trim().isEmpty) {
        //     Get.snackbar("Error", "Please enter a math problem",
        //         backgroundColor: Colors.red, colorText: Colors.white);
        //     return;
        //   }
        //
        //   controller.solve(_controller.text.trim());
        //   setState(() {}); // refresh screen
        // },
        onPressed: () async {
          if (controller.isLoading.value) return; // ❗ Prevent double press

          if (_controller.text.trim().isEmpty) {
            Get.snackbar("Error", "Please enter a math problem",
                backgroundColor: Colors.red, colorText: Colors.white);
            return;
          }

          controller.solve(_controller.text.trim());
        },


        icon: const Icon(Icons.calculate, color: Colors.white),
        label: const Text(
          "Solve Problem",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),

      ),

    );

  }

  // ------------------------------------------------------------
  // ROUND BUTTON
  // ------------------------------------------------------------
  Widget _roundButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF3FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.black87, size: 22),
      ),
    );
  }

  // ------------------------------------------------------------
  // CARD DECORATION
  // ------------------------------------------------------------
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }
}
//
// import 'package:math_expressions/math_expressions.dart';
//
// import '../../../controller/math_controller/math_controller.dart';
// class Math extends StatefulWidget {
//   const Math({super.key});
//
//    @override
//   State<Math> createState() => _MathState();
//  }
// String tryLocalEval(String input) {
//   try {
//     final parser = Parser();
//     final exp = parser.parse(
//       input.replaceAll('×', '*').replaceAll('÷', '/'),
//     );
//     final cm = ContextModel();
//     final res = exp.evaluate(EvaluationType.REAL, cm);
//
//     return res.toString();
//   } catch (e) {
//     return "";
//   }
// }
//
// class _MathState extends State<Math> {
//   final TextEditingController _controller = TextEditingController();
//   final controller = Get.put(MathController());
//
//   // Insert text at cursor
//   void _insertText(String value) {
//     final text = _controller.text;
//     final cursor = _controller.selection.baseOffset;
//
//     if (cursor < 0) {
//       _controller.text = text + value;
//       _controller.selection =
//           TextSelection.fromPosition(TextPosition(offset: _controller.text.length));
//     } else {
//       final newText = text.substring(0, cursor) + value + text.substring(cursor);
//       _controller.text = newText;
//       _controller.selection =
//           TextSelection.fromPosition(TextPosition(offset: cursor + value.length));
//     }
//
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F7FB),
//       appBar: _buildAppBar(),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _howItWorksCard(),
//             const SizedBox(height: 18),
//             _quickExamples(),
//             const SizedBox(height: 18),
//             _inputCard(),
//             const SizedBox(height: 26),
//             _solveButton(),
//             const SizedBox(height: 26),
//
//             Obx(() {
//               if (controller.isLoading.value) {
//                 return const Center(
//                   child: CircularProgressIndicator(color: Color(0xFF8E44FF)),
//                 );
//               }
//
//               if (controller.result.value.isEmpty) {
//                 return const SizedBox();
//               }
//
//               return _mathResultCard(controller.result.value);
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // ---------------- APP BAR ----------------
//   AppBar _buildAppBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       toolbarHeight: 72,
//       automaticallyImplyLeading: false,
//       title: Row(
//         children: [
//           _roundButton(Icons.arrow_back, onTap: () => Navigator.pop(context)),
//           const SizedBox(width: 14),
//           Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               color: const Color(0xFF8E44FF).withOpacity(0.15),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: const Icon(Icons.calculate_rounded, color: Color(0xFF8E44FF), size: 22),
//           ),
//           const SizedBox(width: 12),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text("Math Solver",
//                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
//               Text("AI-Powered Calculator",
//                   style: TextStyle(fontSize: 12, color: Colors.black54)),
//             ],
//           ),
//           const Spacer(),
//           _roundButton(Icons.more_vert),
//         ],
//       ),
//     );
//   }
//
//   // ---------------- RESULT CARD ----------------
//   Widget _mathResultCard(String text) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(top: 10),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(18),
//         boxShadow: [
//           BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 14, offset: Offset(0, 6)),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
//               gradient: LinearGradient(
//                 colors: [Color(0xFF8E44FF), Color(0xFFB27CFF)],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text("AI Math Solution",
//                     style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700)),
//                 GestureDetector(
//                   onTap: () {
//                     Clipboard.setData(ClipboardData(text: text));
//                     Get.snackbar("Copied", "Solution copied",
//                         backgroundColor: Colors.green, colorText: Colors.white);
//                   },
//                   child: const Icon(Icons.copy, color: Colors.white, size: 20),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(18),
//             constraints: const BoxConstraints(minHeight: 120, maxHeight: 350),
//             child: SingleChildScrollView(
//               child: Text(text, style: const TextStyle(fontSize: 15, height: 1.55)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // ---------------- HOW IT WORKS ----------------
//   Widget _howItWorksCard() => Container(
//     padding: const EdgeInsets.all(16),
//     decoration: BoxDecoration(
//       gradient:
//       const LinearGradient(colors: [Color(0xFFE8DBFF), Color(0xFFF3EDFF)], begin: Alignment.topLeft),
//       borderRadius: BorderRadius.circular(16),
//       border: const Border(left: BorderSide(color: Color(0xFF8E44FF), width: 4)),
//       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12, offset: Offset(0, 4))],
//     ),
//     child: Row(
//       children: const [
//         Icon(Icons.lightbulb_outline, size: 22, color: Color(0xFF8E44FF)),
//         SizedBox(width: 12),
//         Expanded(
//           child: Text(
//             "Smart Math Assistant\nType any math problem. AI solves step-by-step.",
//             style: TextStyle(fontSize: 14, height: 1.4),
//           ),
//         ),
//       ],
//     ),
//   );
//
//   // ---------------- QUICK EXAMPLES ----------------
//   Widget _quickExamples() {
//     final examples = ["50% of 240", "√144", "15 * 20²", "(24 + 36) ÷ 5", "2+2"];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("QUICK EXAMPLES",
//             style: TextStyle(fontSize: 13, color: Colors.black54, letterSpacing: 0.5)),
//         const SizedBox(height: 8),
//         Wrap(
//           spacing: 10,
//           children: examples.map((example) {
//             return GestureDetector(
//               onTap: () {
//                 _controller.text = example;
//                 setState(() {});
//               },
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(30),
//                   boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))],
//                 ),
//                 child: Text(example, style: const TextStyle(fontWeight: FontWeight.w600)),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   // ---------------- INPUT CARD ----------------
//   Widget _inputCard() {
//     return Container(
//       padding: const EdgeInsets.all(18),
//       decoration: _cardDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text("Math Problem",
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
//               GestureDetector(onTap: () => _controller.clear(), child: const Text("Clear")),
//             ],
//           ),
//           const SizedBox(height: 14),
//           Container(
//             height: 55,
//             padding: const EdgeInsets.symmetric(horizontal: 14),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(14),
//               border: Border.all(color: Colors.black12),
//             ),
//             child: TextField(
//               controller: _controller,
//               decoration:
//               const InputDecoration(hintText: "e.g., 50% of 240", border: InputBorder.none),
//             ),
//           ),
//           const SizedBox(height: 20),
//           _keypad(),
//         ],
//       ),
//     );
//   }
//
//   // ---------------- KEYPAD ----------------
//   Widget _keypad() {
//     final buttons = [
//       ["7", "8", "9", "÷"],
//       ["4", "5", "6", "×"],
//       ["1", "2", "3", "-"],
//       ["0", ".", "%", "+"],
//     ];
//
//     return Column(
//       children: buttons.map((row) {
//         return Row(
//           children: row.map((btn) {
//             return Expanded(
//               child: GestureDetector(
//                 onTap: () => _insertText(btn),
//                 child: Container(
//                   height: 55,
//                   margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: "+-×÷".contains(btn)
//                         ? const Color(0xFFF2E9FF)
//                         : const Color(0xFFF7F9FC),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(btn,
//                         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         );
//       }).toList(),
//     );
//   }
//
//   // ---------------- SOLVE BUTTON (UPDATED!) ----------------
//   Widget _solveButton() {
//     return Container(
//       height: 54,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(colors: [Color(0xFFB28DFE), Color(0xFF9C6BFF)]),
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: TextButton.icon(
//         onPressed: () async {
//           final input = _controller.text.trim();
//
//           if (input.isEmpty) {
//             Get.snackbar("Error", "Please enter a math problem",
//                 backgroundColor: Colors.red, colorText: Colors.white);
//             return;
//           }
//
//           // 1️⃣ Local instant solve (no API)
//           final localResult = tryLocalEval(input);
//
//           if (localResult.isNotEmpty) {
//             controller.result.value = "Answer: $localResult";
//             return;
//           }
//
//           // 2️⃣ Send to AI only if needed
//           if (controller.isLoading.value) return;
//
//           controller.solve(input);
//         },
//         icon: const Icon(Icons.calculate, color: Colors.white),
//         label: const Text(
//           "Solve Problem",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//   // ---------------- ROUND BUTTON ----------------
//   Widget _roundButton(IconData icon, {VoidCallback? onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEFF3FA),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Icon(icon, size: 22),
//       ),
//     );
//   }
//
//   BoxDecoration _cardDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(16),
//       boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.06), blurRadius: 12)],
//     );
//   }
// }
