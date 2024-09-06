import 'package:flutter/material.dart';

Column homeLoading(BuildContext context) {
  return const Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircularProgressIndicator(),
      SizedBox(
        height: 15,
      ),
      Text("Loading Articles ...")
    ],
  );
}
