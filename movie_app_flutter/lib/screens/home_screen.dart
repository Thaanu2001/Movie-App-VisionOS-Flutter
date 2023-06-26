import 'package:flutter/material.dart';

import '../widgets/continue_watching_section.dart';
import '../widgets/cover_widget.dart';
import '../widgets/header.dart';
import '../widgets/popular_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          padding: const EdgeInsets.all(60),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color(0xFA2B2B2B)),
          child: const SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                CoverWidget(),
                ContinueWatchingSection(),
                PopularSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
