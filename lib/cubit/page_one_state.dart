part of 'page_one_cubit.dart';

class PageOneState {
  List<int> counts = [];
  final HomeRepository repository;
  List<Users> users;
  PageOneState({
    required this.counts,
    required this.repository,
    required this.users,
  });
}
