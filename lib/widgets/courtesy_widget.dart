import 'package:flutter/material.dart';

class CourtesyWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const CourtesyWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Text(
            title,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              subtitle,
            ),
          ),
        ],
      );
}
