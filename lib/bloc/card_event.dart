part of 'card_bloc.dart';

@immutable
abstract class CardEvent {}

class AddCard extends CardEvent {
  List product;
  AddCard({required this.product});
}

class RemoveCard extends CardEvent {
  List product;
  RemoveCard({required this.product});
}
