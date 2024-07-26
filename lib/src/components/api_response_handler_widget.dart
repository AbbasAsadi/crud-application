import 'package:crud/gen/assets.gen.dart';
import 'package:crud/src/models/base/api_request_status.dart';
import 'package:crud/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ApiResponseHandlerWidget extends StatelessWidget {
  const ApiResponseHandlerWidget(
      {super.key,
      required this.status,
      this.customNotStartedWidget,
      this.customLoadingWidget,
      this.customErrorWidget,
      required this.customSuccessWidget,
      required this.onRetryTapped});

  final ApiRequestStatus status;
  final Widget? customNotStartedWidget;
  final Widget? customLoadingWidget;
  final Widget? customErrorWidget;
  final Widget customSuccessWidget;
  final VoidCallback onRetryTapped;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case ApiRequestStatus.notStarted:
        return customNotStartedWidget ?? customLoadingWidget ?? const DefaultLoadingWidget();
      case ApiRequestStatus.loading:
        return customLoadingWidget ?? const DefaultLoadingWidget();
      case ApiRequestStatus.success:
        return customSuccessWidget;
      case ApiRequestStatus.unauthorized:
      case ApiRequestStatus.error:
        return customErrorWidget ?? DefaultErrorWidget(onRetryTapped: onRetryTapped);
    }
  }
}

class DefaultErrorWidget extends StatelessWidget {
  const DefaultErrorWidget({
    super.key,
    required this.onRetryTapped,
  });

  final VoidCallback onRetryTapped;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: OutlinedButton(
          onPressed: onRetryTapped,
          child: const Text('tryAgain'),
        ),
      ),
    );
  }
}

class DefaultLoadingWidget extends StatelessWidget {
  const DefaultLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Image.asset(
          Assets.images.loading.path,
          color: AppColors.primaryMedium,
          height: 32,
        ),
      ),
    );
  }
}
