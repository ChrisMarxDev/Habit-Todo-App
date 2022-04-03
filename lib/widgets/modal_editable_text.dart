import 'package:flutter/material.dart';
import 'package:linkable/linkable.dart';

class ModalEditableText extends StatefulWidget {
  final TextStyle? style;
  final String text;
  final String label;
  final bool isEditable;
  final bool forceEditableAppearance;
  final bool enableUrls;
  final bool autoFocus;
  final TextAlign textAlign;
  final int? maxLines;
  final Widget? icon;
  final void Function(String)? onSubmit;
  final void Function(String)? onChange;

  const ModalEditableText(
    this.text, {
    this.label = '',
    this.isEditable = true,
    this.forceEditableAppearance = false,
    this.style,
    this.icon,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.enableUrls = false,
    this.onSubmit,
    this.onChange,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  _ModalEditableTextState createState() => _ModalEditableTextState();
}

class _ModalEditableTextState extends State<ModalEditableText> {
  late final TextEditingController textController;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    textController = TextEditingController(text: widget.text);
    focusNode.addListener(_onFocusChange);
    if (widget.autoFocus) {
      focusNode.requestFocus();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ModalEditableText oldWidget) {
    // textController.text = widget.text;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    textController.dispose();
    focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (!focusNode.hasFocus) {
      widget.onSubmit?.call(textController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headline4!.merge(widget.style);

    final showEditableStyle =
        widget.isEditable || widget.forceEditableAppearance;
    final border = showEditableStyle
        ? UnderlineInputBorder(
            // borderRadius: BorderRadius.circular(Dimens.borderRadiusInput),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(56),
              topRight: Radius.circular(5),
            ),
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
            ),
          )
        : InputBorder.none;

    final inputDecoration = InputDecoration(
      hintText: widget.label,
      hintStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
      ),
      // label: Text(widget.label),
      enabledBorder: border,
      errorBorder: border,
      focusedBorder: border,
      contentPadding: EdgeInsets.zero,
      border: border,
      disabledBorder: border,
      filled: showEditableStyle,
      fillColor: Colors.transparent,
      // suffixIcon: SizedBox(
      //   width: Dimens.defaultIconSize,
      //   height: Dimens.defaultIconSize,
      //   child: GestureDetector(
      //     onTap: () => focusNode.toggle(),
      //     child: widget.isEditable || widget.forceEditableAppearance
      //         ? widget.icon ?? const Icon(LineAwesomeIcons.edit)
      //         : null,
      //   ),
      // ),
    );

    if (!widget.isEditable && widget.enableUrls) {
      return Linkable(
        text: textController.text,
        style: style,
        textAlign: widget.textAlign,
        linkColor: Theme.of(context).colorScheme.primary,
        textColor: Theme.of(context).textTheme.bodyText1!.color,
      );
    }
    return TextField(
      focusNode: focusNode,
      enabled: widget.isEditable,
      controller: textController,
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      onChanged: widget.onChange,
      onSubmitted: (value) {
        widget.onSubmit?.call(value);
      },
      style: style,
      decoration: inputDecoration,
    );
  }
}
