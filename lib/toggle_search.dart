import 'package:flutter/material.dart';

class ToggleSearch extends StatefulWidget {
  const ToggleSearch({
    super.key,
    required this.options,
    this.iconColor = Colors.black45,
    this.categories = const [
      "All",
      "Videos",
      "Images",
      "News",
    ],
  });

  final double? borderRadius = 6;
  final Color? iconColor;
  final List<String> options;

  final List<String>? categories;
  List<String>? get items => categories;

  @override
  State<ToggleSearch> createState() => _ToggleSearchState();
}

class _ToggleSearchState extends State<ToggleSearch> {
  double _angle = 0;
  int _index = 0;

  final GlobalKey fieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      optionsMaxHeight: 250,
      optionsViewBuilder: (BuildContext ccontext,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Transform.translate(
          offset: const Offset(0, -4),
          child: Align(
            alignment: Alignment.topLeft,
            child: Material(
              child: Container(
                constraints:
                    const BoxConstraints(maxWidth: 400, maxHeight: 200),
                key: fieldKey,
                color: Colors.white60,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final String option = options.elementAt(index);

                      return ListTile(
                        title: Text(option),
                        onTap: () {
                          onSelected(option);
                        },
                      );
                    }),
              ),
            ),
          ),
        );
      },
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius!)),
          child: TextFormField(
            controller: textEditingController,
            focusNode: focusNode,
            showCursor: true,
            cursorRadius: const Radius.circular(6.0),
            style: const TextStyle(
              color: Colors.black87,
              height: 1.4,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            decoration: InputDecoration(
              filled: true,
              border: InputBorder.none,
              fillColor: Colors.white,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _angle = _angle + 360 / widget.categories!.length;
                        _index++;

                        if (_index == widget.categories!.length) {
                          _angle = 0;
                          _index = 0;
                        }
                        setState(() {});
                      },
                      onDoubleTap: () {
                        _angle = 0;
                        _index = 0;
                        setState(() {});
                      },
                      child: GestureDetector(
                        onTap: () {
                          if (_index <= widget.categories!.length) {
                            _angle = _angle + (1.0 / widget.categories!.length);
                            _index++;
                            setState(() {});
                          }

                          if (_index == widget.categories!.length) {
                            _angle = 0;
                            _index = 0;
                          }
                        },
                        child: AnimatedRotation(
                            duration: const Duration(milliseconds: 400),
                            turns: _angle,
                            curve: Curves.easeInOutBack,
                            child: Transform.scale(
                              scale: 1.3,
                              child: Icon(
                                Icons.search_rounded,
                                color: widget.iconColor,
                                size: 20,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Transform.scale(
                      scale: 0.9,
                      child: Text(
                        widget.categories![_index],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: widget.iconColor,
                          height: 1.3,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        return widget.options.where((String option) {
          return option.contains(textEditingValue.text.toLowerCase());
        });
      },
    );
  }
}
