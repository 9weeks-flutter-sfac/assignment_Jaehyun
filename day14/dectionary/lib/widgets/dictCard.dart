import 'package:assignment2/widgets/meaningCard.dart';
import 'package:flutter/material.dart';

import '../model/dict.dart';

class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dict});
  final Dict dict;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              dict.word,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
            Divider(),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dict.meanings.length,
                itemBuilder: (context, index) {
                  return MeaningCard(meaning: dict.meanings[index]);
                })
          ],
        ),
      ),
    );
  }
}
