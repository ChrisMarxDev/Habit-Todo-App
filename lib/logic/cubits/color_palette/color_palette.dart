part of 'color_palette_cubit.dart';

@immutable
class ColorPalette {
  final List<List<Color>> colors;
  final String name;

  int get colorCount => colors.length;

  const ColorPalette(this.name, this.colors);

  Color get primary => colors.first.first;

  List<Color> get primaryGradient => colors.first;

  Color get secondary => get(1);

  List<Color> get secondaryGradient => getGradient(1);

  Color get(int index) => colors[index % colors.length].first;

  List<Color> getGradient(int index) => colors[index % colors.length];
}

const gradient1 = [
  Color(0xFF4A41A8),
  Color(0xFF24AEEA),
  Color(0xFF05BC9B),
];

const gradient2 = [
  Color(0xFFb5179e),
  Color(0xFF480ca8),
  Color(0xFF4895ef),
];
const gradient4 = [
  Color(0xFFE86868),
  Color(0xFFDA237B),
  Color(0xFF8651F6),
];
const gradient5 = [
  Color(0xFF1A0DA0),
  Color(0xFF50CAFF),
];

const blackGradient = [
  Color(0xFF000000),
  Color(0xFF404040),
];

const basePalette =
    ColorPalette('basePalette', [gradient1, gradient2, gradient4, gradient5]);

const alternatePalette =
    ColorPalette('alternate', [gradient4, gradient2, gradient1, gradient5]);
// const summerPalette =
//     ColorPalette('basePalette', [palette1, palette2, palette3]);
// const winterPalette =
//     ColorPalette('basePalette', [palette1, palette2, palette3]);
// const summerPalette = ColorPalette('summerPalette', palette2);
// const winterPalette = ColorPalette('winterPalette', palette3);
const blackPalette = ColorPalette('blackPalette', [blackGradient]);

final colorPalettes = <String, ColorPalette>{
  basePalette.name: basePalette,
  alternatePalette.name: alternatePalette,
  // summerPalette.name: summerPalette,
  // winterPalette.name: winterPalette,
  blackPalette.name: blackPalette,
};

ColorPalette getPalette(BuildContext context) {
  return context.watch<ColorPaletteCubit>().state;
}
