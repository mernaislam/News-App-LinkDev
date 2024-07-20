import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/helpers/spacing.dart';

class NewsFailed extends StatelessWidget {
  const NewsFailed({super.key, required this.onRefresh});
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Something went wrong.\nPlease try again later.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25.sp,
            ),
          ),
        ),
        verticalSpace(30),
        ElevatedButton(
          onPressed: onRefresh,
          style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.black),
          child: const Text(
            'Try again',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
