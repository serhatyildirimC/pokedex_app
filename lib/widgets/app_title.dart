import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_app/constants/u%C4%B1_helper.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);
  final String _pokeballUrl = 'images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeigth(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getPadding(),
            child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pokedex',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              _pokeballUrl,
              width: ScreenUtil().orientation == Orientation.portrait
                  ? 0.2.sh
                  : 0.2.sw,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
      ),
    );
  }
}
