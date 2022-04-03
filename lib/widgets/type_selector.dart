import 'package:flutter/material.dart';

class TypeSelector<T> extends StatelessWidget {
  final List<T> types;
  final T selected;
  final void Function(T) onChange;
  final String Function(T)? elementToText;

  const TypeSelector({
    required this.types,
    required this.selected,
    required this.onChange,
    this.elementToText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = types.indexOf(selected);
    final label = elementToText != null
        ? elementToText!.call(selected)
        : selected.toString();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: IconButton(
            color: Theme.of(context).colorScheme.onPrimary,
            icon: const Icon(Icons.chevron_left),
            onPressed: index > 0 ? () => onChange(types[index - 1]) : null,
          ),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 4,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        Flexible(
          child: IconButton(
            icon: const Icon(Icons.chevron_right),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: index < types.length - 1
                ? () => onChange(types[index + 1])
                : null,
          ),
        ),
      ],
    );
  }
}
