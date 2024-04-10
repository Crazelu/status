import 'package:flutter/material.dart';
import 'package:status/core/extensions/locale_extension.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: context.locale
                        .sorryDudeButTheresNoWayImLettingYouViewThisOnYourMobile,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: ' '),
                      TextSpan(text: context.locale.pleaseGoOnYourDesktop)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
