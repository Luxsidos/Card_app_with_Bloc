import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'card_event.dart';
part 'card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  List<List> myDatas = [];

  CardBloc() : super(CardState(cardDatas: [], sum: 0)) {
    on<AddCard>((event, emit) {
      bool hasBool = false;
      for (List<dynamic> item in state.cardDatas) {
        if (event.product[0] == item[0]) {
          hasBool = true;
        }
      }
      if (!hasBool) {
        myDatas.add(event.product);
        state.cardDatas = myDatas;
        int sum = 0;
        for (List<dynamic> item in state.cardDatas) {
          sum += item[1] as int;
        }
        state.sum = sum;
        emit(CardAddState(cardDatas: state.cardDatas, sum: state.sum));
      }
    });

    on<RemoveCard>((event, emit) {
      myDatas.remove(event.product);
      state.cardDatas = myDatas;
      int sum = 0;
      for (List<dynamic> item in state.cardDatas) {
        sum += item[1] as int;
      }
      state.sum = sum;
      emit(CardRemoveState(cardDatas: state.cardDatas, sum: state.sum));
    });
  }
}
