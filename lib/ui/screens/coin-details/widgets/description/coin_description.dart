import 'package:flutter/material.dart';

import '../../../../../constant/extension/extension.dart';

class CoinDescription extends StatefulWidget {
  const CoinDescription({required this.description, Key? key})
      : super(key: key);
  final String description;

  @override
  State<CoinDescription> createState() => _CoinDescriptionState();
}

class _CoinDescriptionState extends State<CoinDescription> {
  int? maxLinesNumber = 3;
  late int numberOfpharagraphes = widget.description.numberOfpharagraphes;

  void _changeMaxLine() {
    setState(() {
      maxLinesNumber =
          maxLinesNumber == numberOfpharagraphes ? 3 : numberOfpharagraphes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Text(
            widget.description.removeHTMLTags,
            maxLines: maxLinesNumber,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          GestureDetector(
            onTap: _changeMaxLine,
            child: Text(
              maxLinesNumber == numberOfpharagraphes ? 'Show less' : 'Show more',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
