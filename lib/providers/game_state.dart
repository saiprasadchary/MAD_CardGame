import 'package:flutter/material.dart';
import '../models/card_model.dart';
import 'dart:async';

class GameState with ChangeNotifier {
  List<CardModel> cards = [];
  int score = 0;
  int matchedPairs = 0;
  Timer? timer;
  int timeElapsed = 0;
  bool isGameOver = false;
  bool isProcessing = false; // Prevent multiple flips at once
  int flippedCardsCount = 0;
  int? firstFlippedCardIndex;

  GameState() {
    _initializeGame();
  }

  void _initializeGame() {
    List<String> images = [
      'assets/img1.png',
      'assets/img2.png',
      'assets/img3.png',
      'assets/img4.png',
      'assets/img5.png',
      'assets/img6.png',
      'assets/img7.png',
      'assets/img8.png',
    ];

    // Create pairs for each image
    cards = images.expand((image) {
      return [
        CardModel(frontImage: image, backImage: 'assets/back.png'),
        CardModel(frontImage: image, backImage: 'assets/back.png'),
      ];
    }).toList();

    cards.shuffle(); // Shuffle the cards
    flippedCardsCount = 0;
    firstFlippedCardIndex = null;
    score = 0;
    matchedPairs = 0;
    isGameOver = false;
    isProcessing = false;
    startTimer();
    notifyListeners();
  }

  void startTimer() {
    timeElapsed = 0;
    isGameOver = false;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      timeElapsed++;
      notifyListeners();
    });
  }

  void flipCard(int index) {
    if (isGameOver || isProcessing || cards[index].isFaceUp || flippedCardsCount == 2) return;

    cards[index].isFaceUp = true;
    flippedCardsCount++;

    notifyListeners();

    if (flippedCardsCount == 1) {
      firstFlippedCardIndex = index;
    } else if (flippedCardsCount == 2 && firstFlippedCardIndex != null) {
      // Check for a match
      if (cards[firstFlippedCardIndex!].frontImage == cards[index].frontImage) {
        // It's a match!
        score += 10; // Increase score for a match
        matchedPairs++;

        if (matchedPairs == cards.length ~/ 2) {
          isGameOver = true;
          timer?.cancel();
        }

        // Reset flipped card count
        flippedCardsCount = 0;
        firstFlippedCardIndex = null;
      } else {
        // Mismatch, prevent other cards from flipping while the mismatch is processing
        isProcessing = true;
        Future.delayed(Duration(seconds: 1), () {
          // Flip the cards back
          cards[firstFlippedCardIndex!].isFaceUp = false;
          cards[index].isFaceUp = false;

          // Reset flipped card count and processing flag
          flippedCardsCount = 0;
          firstFlippedCardIndex = null;
          isProcessing = false;
          notifyListeners();
        });

        score -= 1; // Deduct points for mismatch
      }

      notifyListeners();
    }
  }

  String get timerText {
    final minutes = (timeElapsed ~/ 60).toString().padLeft(2, '0');
    final seconds = (timeElapsed % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void restartGame() {
    _initializeGame();
    notifyListeners();
  }
}
