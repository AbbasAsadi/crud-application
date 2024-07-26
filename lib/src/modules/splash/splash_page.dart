import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/modules/splash/routes/splash_provider.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.logo.path,
              fit: BoxFit.contain,

            ),
            const Gap(32),
            Image.asset(
              Assets.images.loading.path,
              height: 40,
              color: AppColors.primaryMedium,
            ),
          ],
        ),
      ),
    );
  }
}
