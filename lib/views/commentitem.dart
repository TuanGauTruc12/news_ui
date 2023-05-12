import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  const CommentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text('Phạm Anh Tuấn'), Text('23-4-2023')],
        ),
        const Text("Hay quá")
      ],
    );
  }
}
