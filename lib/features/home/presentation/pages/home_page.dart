import 'package:flutter/material.dart';
import 'package:status/core/extensions/locale_extension.dart';
import 'package:status/core/presentation/viewmodel/view_model_provider.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';
import 'package:status/features/home/presentation/pages/desktop_page.dart';
import 'package:status/features/home/presentation/pages/mobile_page.dart';
import 'package:status/features/home/presentation/viewmodels/home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider(
      create: () => HomeViewModel(locale: context.locale),
      initialize: (vm) => vm.initialize(),
      child: const ResponsiveWidgetBuilder(
        mobile: HomeMobilePage(),
        desktop: HomeDesktopPage(),
      ),
    );
  }
}
