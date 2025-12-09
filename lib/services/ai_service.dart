//
//
// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter_gemini/flutter_gemini.dart';
//
// class AIService {
//   final gemini = Gemini.instance;
//
//   // Helper - clean latex / symbols
//   String _clean(String s) {
//     return s
//         .replaceAll("\$", "")
//         .replaceAll("\$", "")
//         .replaceAll("\\(", "")
//         .replaceAll("\\)", "")
//         .replaceAll("\\", "")
//         .trim();
//   }
//
//   // ---------------- TEXT SUMMARIZER ----------------
//   Future<String> summarizeText(
//       String text, {
//         String length = "Medium",
//         bool bullets = false,
//       }) async {
//     final prompt = """
// Summarize the following text.
//
// Rules:
// - No LaTeX or \$ symbols.
// - Use only plain English.
// - Length: $length
// - Bullet Points: $bullets
//
// TEXT:
// $text
// """;
//
//     final res = await gemini.text(prompt);
//     return _clean(res?.output ?? "No summary generated.");
//   }
//
//   // ---------------- IMAGE SUMMARIZER ----------------
//   Future<String> summarizeImage(File imageFile) async {
//     final bytes = await imageFile.readAsBytes();
//     final response = await gemini.textAndImage(
//       text: "Summarize what is shown in this image using plain text only.",
//       images: [bytes],
//     );
//
//     return _clean(response?.output ?? "No image summary.");
//   }
//
//   // ---------------- MCQ GENERATOR ----------------
//   Future<Map<String, dynamic>> generateMCQ(String text) async {
//     final prompt = """
// Generate ONE MCQ from this text.
// Return ONLY valid JSON:
//
// {
//  "question": "",
//  "options": ["", "", "", ""],
//  "answer": ""
// }
//
// TEXT:
// $text
// """;
//
//     final res = await gemini.text(prompt);
//     final raw = res?.output ?? "{}";
//
//     try {
//       return jsonDecode(raw);
//     } catch (e) {
//       return {
//         "question": "MCQ generation failed.",
//         "options": ["-", "-", "-", "-"],
//         "answer": "-"
//       };
//     }
//   }
//
//   // ---------------- MATH SOLVER ----------------
//   Future<String> solveMath(String query) async {
//     final prompt = """
// Solve this math problem step-by-step.
//
// Rules:
// - NO LaTeX
// - NO \$ symbols
// - Explain like a teacher
// - End with: "Answer: <final>"
//
// Problem:
// $query
// """;
//
//     final res = await gemini.text(prompt);
//     return _clean(res?.output ?? "No solution generated.");
//   }
//
//   // ---------------- FEEDBACK ----------------
//   Future<String> feedback(String text) async {
//     final res = await gemini.text(
//         "Give helpful study feedback for this text:\n$text");
//     return _clean(res?.output ?? "No feedback generated.");
//   }
// }




import 'dart:convert';
import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';

class AIService {
  final gemini = Gemini.instance;

  // Helper - clean latex / symbols
  String _clean(String s) {
    return s
        .replaceAll("\$", "")
        .replaceAll("\$", "")
        .replaceAll("\\(", "")
        .replaceAll("\\)", "")
        .replaceAll("\\", "")
        .trim();
  }

  // ---------------- TEXT SUMMARIZER ----------------
  Future<String> summarizeText(
      String text, {
        String length = "Medium",
        bool bullets = false,
      }) async {
    final prompt = """
Summarize the following text.

Rules:
- No LaTeX or \$ symbols.
- Use only plain English.
- Length: $length
- Bullet Points: $bullets

TEXT:
$text
""";

    final res = await gemini.text(prompt);
    return _clean(res?.output ?? "No summary generated.");
  }

  // ---------------- IMAGE SUMMARIZER ----------------
  Future<String> summarizeImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final response = await gemini.textAndImage(
      text: "Summarize what is shown in this image using plain text only.",
      images: [bytes],
    );

    return _clean(response?.output ?? "No image summary.");
  }

  // ---------------- MCQ GENERATOR ----------------
  Future<Map<String, dynamic>> generateMCQ(String text) async {
    final prompt = """
Generate ONE MCQ from this text.  
Return ONLY valid JSON:

{
 "question": "",
 "options": ["", "", "", ""],
 "answer": ""
}

TEXT:
$text
""";

    final res = await gemini.text(prompt);
    final raw = res?.output ?? "{}";

    try {
      return jsonDecode(raw);
    } catch (e) {
      return {
        "question": "MCQ generation failed.",
        "options": ["-", "-", "-", "-"],
        "answer": "-"
      };
    }
  }

//   Future<Map<String, dynamic>> generateMCQ(String text) async {
//     final prompt = """
// Generate ONE MCQ from this text.
// Return ONLY valid JSON:
//
// {
//  "question": "",
//  "options": ["", "", "", ""],
//  "answer": ""
// }
//
// TEXT:
// $text
// """;
//
//     final res = await gemini.text(prompt);
//     final raw = res?.output ?? "{}";
//
//     try {
//       return jsonDecode(raw);
//     } catch (e) {
//       return {
//         "question": "MCQ generation failed.",
//         "options": ["-", "-", "-", "-"],
//         "answer": "-"
//       };
//     }
//   }

  // ---------------- MATH SOLVER ----------------
  Future<String> solveMath(String query) async {
    final prompt = """
Solve this math problem step-by-step.

Rules:
- NO LaTeX
- NO \$ symbols
- Explain like a teacher
- End with: "Answer: <final>"

Problem:
$query
""";

    final res = await gemini.text(prompt);
    return _clean(res?.output ?? "No solution generated.");
  }

  // ---------------- FEEDBACK ----------------
  Future<String> feedback(String text) async {
    final res = await gemini.text(
        "Give helpful study feedback for this text:\n$text");
    return _clean(res?.output ?? "No feedback generated.");
  }
}
