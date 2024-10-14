import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_state.dart';

class CardWidget extends StatelessWidget {
  final int index;

  CardWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);
    final card = gameState.cards[index];

    return GestureDetector(
      onTap: () {
        gameState.flipCard(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: card.isFaceUp ? Colors.white : Colors.blue,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: card.isFaceUp
              ? Text(card.frontImage, style: TextStyle(fontSize: 24))
              : Text('?', style: TextStyle(fontSize: 24, color: Colors.white)),
        ),
      ),
    );
  }
}
