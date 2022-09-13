import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/u%C4%B1_helper.dart';
import 'package:pokedex_app/models/poke_model.dart';
import 'package:pokedex_app/widgets/poke_information.dart';
import 'package:pokedex_app/widgets/poke_type_name.dart';

class DetailsPage extends StatelessWidget {
  final PokemonModel pokemon;
  const DetailsPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeballUrl = 'images/pokeball.png';
    return ScreenUtil().orientation == Orientation.portrait
        ? _portraitBody(context, pokeballUrl)
        : _landscapeBody(context, pokeballUrl);
  }

  Scaffold _landscapeBody(BuildContext context, String pokeballUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.28.sw,
                            fit: BoxFit.fitHeight,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 5, child: PokeInformation(pokemon: pokemon)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _portraitBody(BuildContext context, String pokeballUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            PokeTypeName(pokemon: pokemon),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(
                      pokeballUrl,
                      height: 0.15.sh,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Positioned(
                      right: 0,
                      left: 0,
                      bottom: 0,
                      top: 0.12.sh,
                      child: PokeInformation(pokemon: pokemon)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Hero(
                      tag: pokemon.id!,
                      child: CachedNetworkImage(
                        imageUrl: pokemon.img ?? '',
                        height: 0.28.sh,
                        fit: BoxFit.fitHeight,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
