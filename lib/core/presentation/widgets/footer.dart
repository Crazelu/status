import 'package:status/core/presentation/widgets/responsive_builder.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: ResponsiveBuilder<String>(
          desktop: "Made with so much ",
          mobile: "Made with ",
        ).resolve,
        style: TextStyle(
          color: Colors.black.withOpacity(.8),
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: "❤️ ",
            style: TextStyle(
              color: Colors.redAccent.withOpacity(.9),
              fontSize: 12,
            ),
          ),
          const TextSpan(text: "by "),
          TextSpan(
            text: "Crazelu",
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                launchUrl(Uri.parse("https://github.com/crazelu"));
              },
          )
        ],
      ),
    );
  }
}
