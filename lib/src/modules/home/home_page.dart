import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/components/api_response_handler_widget.dart';
import 'package:crud/src/helper/context_extensions.dart';
import 'package:crud/src/models/base/api_request_status.dart';
import 'package:crud/src/modules/home/_components/home_drawer.dart';
import 'package:crud/src/modules/home/_components/home_successful_widget.dart';
import 'package:crud/src/modules/home/home_provider.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(context),
      child: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    var staticProvider = context.read<HomeProvider>();

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.icons.search),
          ),
          const Gap(8),
        ],
      ),
      drawerEnableOpenDragGesture: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Text(
              'Last Articles',
              style: context.textTheme.titleLarge?.copyWith(color: AppColors.gray900),
            ),
            const Gap(16),
            Selector<HomeProvider, ApiRequestStatus>(
              selector: (_, provider) => provider.homeResponse.status,
              builder: (_, status, __) {
                return ApiResponseHandlerWidget(
                  status: status,
                  customSuccessWidget: HomeSuccessfulWidget(
                    data: staticProvider.homeResponse.data,
                    onRetryTapped: staticProvider.initialize,
                  ),
                  onRetryTapped: staticProvider.initialize,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
