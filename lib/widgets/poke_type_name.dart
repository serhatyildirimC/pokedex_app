import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/models/poke_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name.toString(),
                style: Constants.getPokeNameTextStyle(),
              ),
              Text(
                '#${pokemon.num}',
                style: Constants.getPokeNameTextStyle(),
              )
            ],
          ),
          SizedBox(
            height: 0.02.sh,
          ),
          Chip(
              label: Text(
            pokemon.type?.join(' , ') ?? '',
          ))
        ],
      ),
    );
  }
}
