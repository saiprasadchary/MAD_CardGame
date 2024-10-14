import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/game_state.dart';

class CardGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gameState = Provider.of<GameState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the grid vertically
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Score: ${gameState.score}', style: TextStyle(fontSize: 24)),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Timer: ${gameState.timerText}', style: TextStyle(fontSize: 24)),
        ),
        Expanded(
          child: Center(
            child: AspectRatio(
              aspectRatio: 1, // Maintain a square aspect ratio
              child: GridView.builder(
                itemCount: gameState.cards.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 columns for a 4x4 grid
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 1.0, // Ensure square cards
                ),
                itemBuilder: (context, index) {
                  final card = gameState.cards[index];

                  return GestureDetector(
                    onTap: () {
                      gameState.flipCard(index);
                    },
                    child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: Card(
                        key: ValueKey(card.isFaceUp),
                        child: Stack(
                          children: [
                            Image.asset(
                              card.isFaceUp ? card.frontImage : card.backImage,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        if (gameState.isGameOver)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('You Win!', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          ),
        ElevatedButton(
          onPressed: gameState.restartGame,
          child: Text('Restart Game'),
        ),
      ],
    );
  }
}
