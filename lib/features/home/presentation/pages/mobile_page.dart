import 'package:flutter/material.dart';
import 'package:status/core/extensions/locale_extension.dart';
import 'package:status/core/presentation/widgets/localization_toggle.dart';

class HomeMobilePage extends StatelessWidget {
  const HomeMobilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          LocalizationToggle(),
        ],
      ),
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
