import 'package:flutter/material.dart';

import 'package:animated_rotation/animated_rotation.dart' as rot;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ToggleSearch extends StatefulWidget {
  const ToggleSearch(
      {Key? key,
      this.borderRadius = 12,
      this.fillColor = Colors.white,
      this.iconColor = Colors.black45,
      this.options = const [
        "All",
        "Videos",
        "Images",
        "News",
      ]})
      : super(key: key);

  final double? borderRadius;
  final Color? fillColor;
  final Color? iconColor;

  final List<String>? options;
  List<String>? get items => options;

  @override
  State<ToggleSearch> createState() => _ToggleSearchState();
}

class _ToggleSearchState extends State<ToggleSearch>
    with SingleTickerProviderStateMixin {
  num _angle = 0;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius!),
      child: TextField(
        style: const TextStyle(
          color: Colors.black87,
          height: 1.3,
        ),
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _angle = _angle + 360 / widget.options!.length;
                    _index++;

                    if (_index == widget.options!.length) {
                      _index = 0;
                      _angle = 0;
                    }
                    setState(() {});
                  },
                  onDoubleTap: () {
                    _angle = 0;
                    _index = 0;
                    setState(() {});
                  },
                  child: rot.AnimatedRotation(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 500),
                      angle: _angle,
                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: widget.iconColor,
                        size: 20,
                      )),
                ),
                const SizedBox(width: 9),
                Text(
                  widget.options![_index],
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: widget.iconColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 6),
              ],
            ),
          ),
          filled: true,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

void main(List<String> args) {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Color(0xffe6aa0b),
    body: Center(
        child: Container(
      width: 400,
      child: ToggleSearch(),
    )),
  )));
}