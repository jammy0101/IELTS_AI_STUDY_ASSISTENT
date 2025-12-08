// import 'package:flutter/material.dart';
//
//
// class Mcq extends StatefulWidget {
//   const Mcq({super.key});
//
//   @override
//   State<Mcq> createState() => _McqState();
// }
//
// class _McqState extends State<Mcq> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//
//       ),
//       body: Column(
//         children: [
//
//
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Mcq extends StatefulWidget {
  const Mcq({super.key});

  @override
  State<Mcq> createState() => _McqState();
}

class _McqState extends State<Mcq> {
  final TextEditingController _textController = TextEditingController();
  int _charCount = 0;

  String _difficulty = "Medium";
  String _focus = "General";

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _charCount = _textController.text.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FB),

      appBar: _buildAppBar(),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            _howItWorksCard(),
            const SizedBox(height: 20),
            _inputCard(),
            const SizedBox(height: 20),
            _settingsCard(),
            const SizedBox(height: 26),
            _generateButton(),
          ],
        ),
      ),
    );
  }

  // ======================================================================
  // APP BAR
  // ======================================================================
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

          // Icon Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF2ECC9A).withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.list_alt,
                color: Color(0xFF2ECC9A), size: 22),
          ),

          const SizedBox(width: 12),

          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "MCQ Generator",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              Text(
                "AI-Powered Questions",
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

  // ======================================================================
  // HOW IT WORKS CARD
  // ======================================================================
  Widget _howItWorksCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFDFF8EE), Color(0xFFEAFBF4)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: const Border(
          left: BorderSide(color: Color(0xFF2ECC9A), width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(
        children: [
          const Icon(Icons.school_outlined,
              size: 22, color: Color(0xFF2ECC9A)),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              "Enter your study material below. Our AI will generate multiple choice questions to test your understanding.",
              style: TextStyle(fontSize: 14, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }

  // ======================================================================
  // INPUT TEXT CARD
  // ======================================================================
  Widget _inputCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + Counter + Clear Button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Study Material",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),

              Row(
                children: [
                  Text(
                    "$_charCount / 3000",
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      _textController.clear();
                      setState(() => _charCount = 0);
                    },
                    child: const Text(
                      "Clear",
                      style: TextStyle(
                        color: Color(0xFF2ECC9A),
                        fontWeight: FontWeight.w700,
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),

          const SizedBox(height: 14),

          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.black12),
            ),
            child: TextField(
              controller: _textController,
              maxLines: null,
              expands: true,
              maxLength: 3000,
              maxLengthEnforcement: MaxLengthEnforcement.none,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(14),
                hintText:
                "Enter your study material here...\n(minimum 100 characters)",
                hintStyle: TextStyle(color: Colors.black38),
                border: InputBorder.none,
                counterText: "",
              ),
            ),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(child: _smallButton(Icons.content_paste, "Paste")),
              const SizedBox(width: 12),
              Expanded(child: _smallButton(Icons.menu_book_outlined, "Sample")),
            ],
          ),
        ],
      ),
    );
  }

  // ======================================================================
  // QUESTION SETTINGS CARD
  // ======================================================================
  Widget _settingsCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: _cardDecoration(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Question Settings",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 20),

          // Difficulty Row
          _settingsRow(
            icon: Icons.speed,
            title: "Difficulty Level",
            subtitle: "Question complexity",
            value: _difficulty,
            items: ["Easy", "Medium", "Hard"],
            onChanged: (v) => setState(() => _difficulty = v!),
          ),

          const SizedBox(height: 12),
          Divider(color: Colors.black12),

          // Focus Area Row
          _settingsRow(
            icon: Icons.category_outlined,
            title: "Focus Area",
            subtitle: "Question type",
            value: _focus,
            items: ["General", "Facts", "Concepts"],
            onChanged: (v) => setState(() => _focus = v!),
          ),
        ],
      ),
    );
  }

  Widget _settingsRow({
    required IconData icon,
    required String title,
    required String subtitle,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF2ECC9A).withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: const Color(0xFF2ECC9A), size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600)),
                Text(subtitle,
                    style: const TextStyle(fontSize: 12, color: Colors.black54)),
              ],
            )
          ],
        ),

        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4FA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              items: items
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ))
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  // ======================================================================
  // GENERATE MCQ BUTTON
  // ======================================================================
  Widget _generateButton() {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2ECC9A), Color(0xFF7FECC2)],
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.create, color: Colors.white),
        label: const Text(
          "Generate MCQ",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ======================================================================
  // SMALL REUSABLE WIDGETS
  // ======================================================================
  Widget _roundButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF3FA),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, size: 22, color: Colors.black87),
      ),
    );
  }

  Widget _smallButton(IconData icon, String text) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6FA),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

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
