import 'package:bloc/bloc.dart';
import 'package:dars_cards/data/models/users.dart';
import 'package:dars_cards/data/provider/api_client.dart';
import 'package:dars_cards/data/repository/home/home_repository.dart';

part 'page_one_state.dart';

class PageOneCubit extends Cubit<PageOneState> {
  PageOneCubit()
      : super(
          PageOneState(
            counts: [],
            repository: HomeRepository(apiClient: ApiClient.getInstance()),
            users: [],
          ),
        );

  void incrementElement(int index) {
    state.counts[index] += 1;
    emit(PageOneState(
        counts: state.counts,
        repository: state.repository,
        users: state.users));
  }

  Future<void> getUsers() async {
    state.users = await state.repository.getUsers();
    state.counts = List.generate(state.users.length, (index) => 1);
    emit(PageOneState(
        counts: state.counts,
        repository: state.repository,
        users: state.users));
  }

  void decrementElement(int index) {
    if (state.counts[index] > 1) {
      state.counts[index] -= 1;
      emit(PageOneState(
          counts: state.counts,
          repository: state.repository,
          users: state.users));
    }
  }
}
