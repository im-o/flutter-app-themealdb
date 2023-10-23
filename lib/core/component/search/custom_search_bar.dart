/// Created by github.com/im-o on 10/22/2023.

import 'package:flutter/material.dart';
import 'package:mealsmaster/core/core.dart';

class CustomSearchBar extends StatefulWidget {
  final String query;
  final String hint;
  final bool isEnabled;
  final EdgeInsetsGeometry margin;
  final double? height;
  final Function()? onSearchClicked;
  final Function(String) onQueryChange;
  final Function(String?)? onSubmitted;

  const CustomSearchBar({
    Key? key,
    required this.query,
    this.hint = 'Search...',
    this.isEnabled = true,
    this.margin = const EdgeInsets.all(Dimens.dp0),
    this.height = double.infinity,
    this.onSearchClicked,
    required this.onQueryChange,
    this.onSubmitted,
  }) : super(key: key);

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  bool isTextFieldFocused = false;
  bool isTextFieldExist = false;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.query;
    if (widget.isEnabled) _textFieldFocusNode.requestFocus();
    _textFieldFocusNode.addListener(() {
      setState(() {
        isTextFieldFocused = _textFieldFocusNode.hasFocus;
      });
    });
    _controller.addListener(() {
      setState(() {
        _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSearchClicked,
      child: Container(
        height: widget.height,
        width: double.infinity,
        margin: widget.margin,
        child: TextField(
          controller: _controller,
          focusNode: _textFieldFocusNode,
          textInputAction: TextInputAction.search,
          onChanged: widget.onQueryChange,
          enabled: widget.isEnabled,
          onSubmitted: widget.onSubmitted,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white24,
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1.0,
                color: Colors.grey,
              ),
            ),
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.white60),
            suffixIcon: isTextFieldFocused && _controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      widget.onQueryChange('');
                      _controller.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
                : null,
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.white60,
          ),
        ),
      ),
    );
  }
}
