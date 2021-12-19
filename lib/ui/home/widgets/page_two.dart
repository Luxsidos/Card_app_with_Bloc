import 'package:dars_cards/bloc/card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CardBloc, CardState>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Row(
              children: [
                Expanded(child: Text(state.cardDatas[index][0].toString())),
                Text(state.cardDatas[index][1].toString()),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () {
                context.read<CardBloc>().add(RemoveCard(product: state.cardDatas[index]));
              },
            ),
          );
        },
        itemCount: state.cardDatas.length,
      );
    });
  }
}
