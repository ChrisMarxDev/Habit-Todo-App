import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/themes.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/widgets/quadratic_selector_button.dart';

class ColorPaletteRowSelector extends StatelessWidget {
  final ColorPalette palette;

  // final bool selected;

  const ColorPaletteRowSelector({
    required this.palette,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected =
        context.watch<ColorPaletteCubit>().state.name == palette.name;
    return Column(
      children: [
        Row(
          children: [
            AnimatedContainer(
              duration: Animations.baseDuration,
              decoration: BoxDecoration(
                border: Border.fromBorderSide(
                  BorderSide(
                    color: selected
                        ? getPalette(context).primary
                        : Colors.transparent,
                    width: 4,
                  ),
                ),
                borderRadius: const BorderRadius.all(Radius.circular(24)),
              ),
              child: ColorPaletteRow(
                palette: palette,
              ),
            )
          ],
        ),
        const Divider()
      ],
    );
  }
}

class ColorPaletteRow extends StatelessWidget {
  final ColorPalette palette;

  const ColorPaletteRow({
    required this.palette,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ColorPaletteCubit>().changePalette(palette),
      child: SizedBox(
        height: 64,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: palette.colors
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8),
                  child: QuadraticSelectorButton(
                    isActive: false,
                    colors: e,
                    onTap: null,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
