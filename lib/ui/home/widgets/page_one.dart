import 'package:dars_cards/bloc/card_bloc.dart';
import 'package:dars_cards/cubit/page_one_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PageOneCubit>(context).getUsers();
    return BlocBuilder<PageOneCubit, PageOneState>(
      builder: (context, state) {
        return state.users.isNotEmpty
            ? BlocBuilder<CardBloc, CardState>(builder: (context, state2) {
                return ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Container(
                        height: 100.0,
                        width: 60.0,
                        margin: const EdgeInsets.symmetric(vertical: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://source.unsplash.com/random/$index"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              context
                                  .watch<PageOneCubit>()
                                  .state
                                  .users[index]
                                  .name!,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.horizontal_rule),
                            onPressed: () {
                              context
                                  .read<PageOneCubit>()
                                  .decrementElement(index);
                            },
                          ),
                          Text(state.counts[index].toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              context
                                  .read<PageOneCubit>()
                                  .incrementElement(index);
                            },
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.shopping_bag,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          context.read<CardBloc>().add(AddCard(
                                product: [state.users[index].name!,state.counts[index]],
                              ));
                        },
                      ),
                    );
                  },
                );
              })
            : const Center(
                child: CircularProgressIndicator(
                  color: Colors.teal,
                ),
              );
      },
    );
  }
}
