import 'package:flutter/material.dart';

class ReviewDialog extends StatefulWidget {
  final Function(int, String) onReviewSubmitted;
  const ReviewDialog({super.key, required this.onReviewSubmitted});

  @override
  ReviewDialogState createState() => ReviewDialogState();
}

class ReviewDialogState extends State<ReviewDialog> {
  double _rating = 0;
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Review Order', style: Theme.of(context).textTheme.headlineSmall),
          SizedBox(height: 16),
          Text('Rate your experience', style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 8),

          // Rating bar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _rating = index + 1.0;
                  });
                },
              );
            }),
          ),

          SizedBox(height: 16),

          TextField(
            controller: _commentController,
            maxLines: 3,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Comment',
            ),
          ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed:
                _rating == 0 ? null : () => widget.onReviewSubmitted.call(_rating.toInt(), _commentController.text),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Submit'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
