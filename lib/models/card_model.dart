class CardModel {
  final String frontImage;
  final String backImage;
  bool isFaceUp;

  CardModel({required this.frontImage, required this.backImage, this.isFaceUp = false});
}
