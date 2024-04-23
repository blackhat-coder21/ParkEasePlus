import 'package:flutter/material.dart';

class Custom_section_heading extends StatefulWidget {
  const Custom_section_heading({super.key,
    this.text_color,
    this.show_action_button = true,
    required this.title,
    this.on_pressed, required bool showActionButton});

  final Color? text_color;
  final bool show_action_button ;
  final String title;
  final void Function()? on_pressed;

  @override
  State<Custom_section_heading> createState() => _Custom_section_headingState();
}

class _Custom_section_headingState extends State<Custom_section_heading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color : widget.text_color),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        // if(widget.show_action_button)  TextButton(onPressed: widget.on_pressed, child: Text(widget.button_title,style: Theme.of(context).textTheme.bodySmall,))
      ],
    );
  }
}