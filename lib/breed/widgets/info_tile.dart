import 'package:catbreeds/app_ui/app_spacing/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final dynamic value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    if (value == null) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      width: double.infinity,
      padding: const EdgeInsets.only(right: AppSpacing.md),
      decoration: ShapeDecoration(
        color: theme.colorScheme.surface,
        shape: StadiumBorder(
          side: BorderSide(
            color: theme.colorScheme.primary,
            width: AppSpacing.xs,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            // width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.xs,
            ),
            decoration: ShapeDecoration(
              color: theme.colorScheme.primary,
              shape: StadiumBorder(
                side: BorderSide(
                  color: theme.colorScheme.primary,
                  width: AppSpacing.xs,
                ),
              ),
            ),
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onPrimary,
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: switch (value) {
                final String value => _TextValue(value: value),
                final int value => _IntValue(value: value),
                final bool value => _BoolValue(value: value),
                final Uri value => _UriValue(value: value),
                _ => Text('Unknown type ${value.runtimeType}'),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BoolValue extends StatelessWidget {
  const _BoolValue({required this.value});

  final bool value;

  @override
  Widget build(BuildContext context) {
    // happy or sad
    return Icon(
      value ? Icons.sentiment_satisfied : Icons.sentiment_dissatisfied,
      color: value ? Colors.green : Colors.red,
    );
  }
}

class _IntValue extends StatelessWidget {
  const _IntValue({required this.value});

  final int value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(
        5,
        (index) => Icon(
          (5 - index) <= value ? Icons.star : Icons.star_border,
          color: theme.colorScheme.primary,
          // : theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _TextValue extends StatelessWidget {
  const _TextValue({required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if (value.length > 20) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          value,
          style: textTheme.bodySmall,
          overflow: TextOverflow.ellipsis,
        ),
      );
    }

    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        value,
        style: textTheme.titleSmall,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
      ),
    );
  }
}

class _UriValue extends StatelessWidget {
  const _UriValue({required this.value});

  final Uri value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Icon(Icons.link),
      onTap: () async {
        await launchUrl(value);
      },
    );
  }
}
