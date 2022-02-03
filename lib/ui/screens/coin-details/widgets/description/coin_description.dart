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

  String descriptionText() {
    return widget.description.isEmpty
        ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Consectetur libero id faucibus nisl tincidunt eget nullam. Cursus eget nunc scelerisque viverra mauris in aliquam sem. Faucibus nisl tincidunt eget nullam non nisi est sit. Tristique magna sit amet purus gravida quis. Blandit massa enim nec dui nunc mattis enim ut tellus. Integer enim neque volutpat ac. Enim praesent elementum facilisis leo vel fringilla est ullamcorper eget. Sapien pellentesque habitant morbi tristique senectus et netus et. Laoreet sit amet cursus sit amet. Sed id semper risus in hendrerit. Et netus et malesuada fames ac turpis egestas sed. Lobortis mattis aliquam faucibus purus in. Viverra tellus in hac habitasse. Interdum velit euismod in pellentesque massa placerat duis ultricies. Sit amet cursus sit amet dictum sit amet justo donec.'
        : widget.description.removeHTMLTags;
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
            descriptionText(),
            maxLines: maxLinesNumber,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          GestureDetector(
            onTap: _changeMaxLine,
            child: Text(
              maxLinesNumber == numberOfpharagraphes
                  ? 'Show less'
                  : 'Show more',
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
