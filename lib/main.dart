import 'package:dars_cards/bloc/card_bloc.dart';
import 'package:dars_cards/cubit/page_one_cubit.dart';
import 'package:dars_cards/my_example/bloc/counter_bloc.dart';
import 'package:dars_cards/my_example/home_page.dart';
import 'package:dars_cards/ui/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PageOneCubit()),
          BlocProvider(create: (context) => CardBloc()),
        ],
        child: const HomePage(),
      ),
    );
  }
}
