import 'package:flutter/material.dart';

import '../widgets/headers.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //body: SquareHeaders(),
      //body: CircularHeaders(),
      //body: DiagonalHeaders(),
      //body: TriangleHeaders(),
      //body: PeakHeaders(),
      //body: CurvedHeaders(),
      //body: WavesHeaders(),
      body: GradientWavesHeaders(),
    );
  }
}
