import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/models/poke_model.dart';
import 'package:pokedex_app/widgets/poke_list_item.dart';

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
            return GridView.builder(
                itemCount: listem.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount:
                        ScreenUtil().orientation == Orientation.portrait
                            ? 2
                            : 3),
                itemBuilder: ((context, index) => PokeItem(
                      pokemon: listem[index],
                    )));
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
