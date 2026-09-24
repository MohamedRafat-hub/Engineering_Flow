import 'package:flutter/material.dart';

/// Centered, scrollable, width-constrained column used as a screen body.
class ScrollableCenteredBody extends StatelessWidget {
  const ScrollableCenteredBody({
    super.key,
    required this.children,
    this.maxWidth = 440,
  });

  final List<Widget> children;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ),
    );
  }
}