import 'package:dars_cards/bloc/card_bloc.dart';
import 'package:dars_cards/ui/home/widgets/page_one.dart';
import 'package:dars_cards/ui/home/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<CardBloc, CardState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: const Text(
              "Home",
              style: TextStyle(color: Colors.teal),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ActionChip(
                  avatar: const Icon(Icons.shop),
                  label: Text((state.sum * 120.0).toString() + "\$"),
                  onPressed: () {},
                ),
              ),
            ],
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.teal,
              indicatorColor: Colors.teal,
              labelStyle:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.teal.shade300,
              tabs: [
                const Tab(child: Text("buy")),
                Tab(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Text("card"),
                      Align(
                        alignment: const Alignment(0.42, -0.7),
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.red),
                          child: Text(
                            state.cardDatas.length < 10
                                ? "${state.cardDatas.length}"
                                : "9+",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: const SafeArea(
            child: TabBarView(
              physics: BouncingScrollPhysics(),
              children: [PageOne(), PageTwo()],
            ),
          ),
        );
      }),
    );
  }
}
