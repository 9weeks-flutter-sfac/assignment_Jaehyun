import 'package:flutter/material.dart';

import '../model/dict.dart';

class MeaningCard extends StatelessWidget {
  const MeaningCard({super.key, required this.meaning});
  final Meanings meaning;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: meaning.definitions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(meaning.definitions[index].definition),
          );
        },
      ),
    );
  }
}
