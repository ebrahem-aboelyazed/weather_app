import 'package:flutter/material.dart';
import 'package:weather_app/utils/borders.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.onSubmit,
    this.onClear,
    this.padding = EdgeInsets.zero,
    this.hint = 'Search',
  });

  final void Function(String value) onSubmit;
  final void Function()? onClear;
  final EdgeInsets padding;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 45,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.bottom,
          onFieldSubmitted: onSubmit,
          style: const TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
            fillColor: Colors.white,
            focusColor: Colors.white,
            border: searchBorder,
            enabledBorder: searchBorder,
            focusedBorder: searchBorder,
            hintStyle: const TextStyle(color: Color(0xffB0B0BC)),
            hintText: hint,
            suffixIcon: const Icon(Icons.search, color: Color(0xffAAAAB5)),
          ),
        ),
      ),
    );
  }
}
