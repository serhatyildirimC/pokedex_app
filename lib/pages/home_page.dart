import 'package:flutter/material.dart';
import 'package:pokedex_app/widgets/app_title.dart';
import 'package:pokedex_app/widgets/poke_listview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: const [
        AppTitle(),
        Expanded(child: PokeListview()),
      ],
    ));
  }
}
