import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_app/constants/u%C4%B1_helper.dart';
import 'package:pokedex_app/models/poke_model.dart';

class PokeImage extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballUrl = 'images/pokeball.png';
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballUrl,
            width: UIHelper.pokeImgSize(),
            height: UIHelper.pokeImgSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              width: UIHelper.pokeImgSize(),
              height: UIHelper.pokeImgSize(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const CircularProgressIndicator(
                    color: Colors.red,
                  )),
        )
      ],
    );
  }
}
