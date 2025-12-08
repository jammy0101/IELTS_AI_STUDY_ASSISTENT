



import 'dart:convert';
import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';

class AIService {
  final gemini = Gemini.instance;

  // ---------------------------------------------------------
  // 1) TEXT SUMMARIZER
  //---------------------------------------------------------
  Future<String> summarizeText(
      String text, {
        String length = "Medium",
        bool bullets = false,
      }) async {
    final prompt = """
Summarize the following text:

Length: $length
Bullet Points: $bullets

$text
""";

    final response = await gemini.text(prompt);

    return response?.output ?? "No summary generated.";
  }

  // ---------------------------------------------------------
  // 2) IMAGE SUMMARIZER
  // ---------------------------------------------------------

//   Future<String> summarizeText(
//       String text, {
//         String length = "Medium",
//         bool bullets = false,
//       }) async {
//
//     // ---- WORD LIMIT RULES ----
//     String wordLimit;
//     switch (length) {
//       case "Short":
//         wordLimit = "50–80 words";
//         break;
//       case "Medium":
//         wordLimit = "120–160 words";
//         break;
//       case "Long":
//         wordLimit = "200–260 words";
//         break;
//       default:
//         wordLimit = "120–160 words";
//     }
//
//     // ---- FORMAT RULE ----
//     String format = bullets
//         ? "Provide the summary in bullet points."
//         : "Provide the summary in short, clear paragraphs.";
//
//     // ---- SUPER STRONG PROMPT FOR HUGE TEXT ----
//     final prompt = """
// You are an expert summarizer.
//
// Summarize the following text while respecting these rules:
//
// 1) Summary length must be strictly within: $wordLimit
// 2) $format
// 3) Extract only the most important ideas, even if the text is VERY long.
// 4) Remove unnecessary details, examples, and repetition.
// 5) If text contains 1000+ lines, summarize only key insights.
// 6) DO NOT exceed the length limit.
//
// TEXT:
// $text
// """;
//
//     final response = await gemini.text(prompt);
//     return response?.output ?? "No summary generated.";
//   }



  Future<String> summarizeImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();

    final response = await gemini.textAndImage(
      text: "Summarize what is shown in this image.",
      images: [bytes],
    );

    return response?.output ?? "No summary generated from image.";
  }

  // ---------------------------------------------------------
  // 3) MCQ GENERATOR
  // ---------------------------------------------------------
  Future<Map<String, dynamic>> generateMCQ(String text) async {
    final prompt = """
Generate ONE MCQ based on this content.

Return ONLY valid JSON:

{
  "question": "",
  "options": ["", "", "", ""],
  "answer": ""
}

$text
""";

    final res = await gemini.text(prompt);
    final raw = res?.output ?? "{}";

    try {
      return jsonDecode(raw);
    } catch (e) {
      return {
        "question": "Failed to generate MCQ.",
        "options": ["-", "-", "-", "-"],
        "answer": "-"
      };
    }
  }

  // ---------------------------------------------------------
  // 4) MATH SOLVER
  // ---------------------------------------------------------
  // Future<String> solveMath(String query) async {
  //   final res = await gemini.text("Solve step-by-step:\n$query");
  //   return res?.output ?? "No solution generated.";
  // }
  Future<String> solveMath(String query) async {
    final prompt = "Solve this math problem step-by-step:\n$query";

    final response = await gemini.text(prompt);

    return response?.output ?? "No solution generated.";
  }




  // ---------------------------------------------------------
  // 5) FEEDBACK GENERATOR
  // ---------------------------------------------------------
  Future<String> feedback(String text) async {
    final res = await gemini.text("Give study feedback:\n$text");
    return res?.output ?? "No feedback generated.";
  }
}


