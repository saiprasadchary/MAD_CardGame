import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/game_state.dart';
import './widgets/card_grid.dart';
import 'dart:ui' show lerpDouble;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameState(),
      child: MaterialApp(
        title: 'Card Matching Game',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Card Matching Game'),
          ),
          body: CardGrid(),
        ),
      ),
    );
  }
}
