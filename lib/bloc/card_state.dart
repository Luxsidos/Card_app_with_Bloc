part of 'card_bloc.dart';

@immutable
class CardState {
  List<List> cardDatas;
  int sum;
  CardState({required this.cardDatas, required this.sum});
}

class CardAddState extends CardState {
  CardAddState({required List<List> cardDatas, required int sum})
      : super(cardDatas: cardDatas, sum: sum);
}

class CardRemoveState extends CardState {
  CardRemoveState({required List<List> cardDatas, required int sum})
      : super(cardDatas: cardDatas, sum: sum);
}
