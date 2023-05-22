// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shop_app_ui/data/utils/styles/color_scheme.dart';

class SearchFieldWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  const SearchFieldWidget({
    Key? key,
    required this.text,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 0.5,
            color: dividerColor,
          ),
        ],
        color: Colors.white,
      ),
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search Products...",
          hintStyle: TextStyle(color: secondaryTextColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          prefixIcon: const Icon(Icons.search),
          suffixIcon: widget.text.isEmpty
              ? const SizedBox()
              : IconButton(
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged('');
                  },
                  icon: const Icon(Icons.close),
                  color: primaryTextColor,
                ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
