import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/constants.dart';
import 'package:pokedex_app/constants/u%C4%B1_helper.dart';
import 'package:pokedex_app/models/poke_model.dart';
import 'package:pokedex_app/pages/details.dart';
import 'package:pokedex_app/widgets/poke_img.dart';

class PokeItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailsPage(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getPadding(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokeNameTextStyle(),
                ),
                Chip(label: Text(pokemon.type![0])),
                Expanded(child: PokeImage(pokemon: pokemon))
              ]),
        ),
      ),
    );
  }
}
