import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/modules/splash/splash_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(context),
      child: const _SplashPage(),
    );
  }
}

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<SplashProvider>();

    return Scaffold(
      backgroundColor: AppColors.primaryMedium,
      body: Container(
        width: context.width,
        padding: const EdgeInsets.all(24.0),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset(
              Assets.images.logo.path,
              height: 64,
              fit: BoxFit.contain,
            ),
            const Spacer(),
            Image.asset(
              Assets.images.loading.path,
              height: 32,
            ),
            const Gap(32),
          ],
        ),
      ),
    );
  }
}
