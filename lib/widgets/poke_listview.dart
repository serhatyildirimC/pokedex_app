import 'package:flutter/material.dart';
import 'package:pokedex_app/models/poke_model.dart';

import '../services/pokedex_api.dart';

class PokeListview extends StatefulWidget {
  const PokeListview({Key? key}) : super(key: key);

  @override
  State<PokeListview> createState() => _PokeListviewState();
}

class _PokeListviewState extends State<PokeListview> {
  late final Future<List<PokemonModel>> _pokeList;
  @override
  void initState() {
    super.initState();
    _pokeList = PokeApi.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokeList,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            List<PokemonModel> listem = snapshot.data!;
            return ListView.builder(
                itemCount: listem.length,
                itemBuilder: (context, index) {
                  var oankiPoke = listem[index];
                  return ListTile(
                    title: Text(
                      oankiPoke.name.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return const Text('Hata Çıktı');
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }));
  }
}
