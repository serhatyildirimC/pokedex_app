import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/models/poke_model.dart';

class PokeApi {
  static const String _url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/0c457d1c35f46b10e19d4fb0940ce4991c224ac7/pokedex.json';

  static Future<List<PokemonModel>> getPokemons() async {
    List<PokemonModel> list = [];
    var result = await Dio().get(_url);
    var pokeList = jsonDecode(result.data)['pokemon'];

    if (pokeList is List) {
      list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }

    return list;
  }
}
