import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialog_manager/flutter_dialog_manager.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:status/core/extensions/locale_extension.dart';
import 'package:status/core/presentation/widgets/responsive_builder.dart';
import 'package:status/features/home/data/models/date.dart';
import 'package:status/features/home/data/models/event.dart';
import 'package:status/features/home/presentation/extensions/event_type_extension.dart';
import 'package:url_launcher/url_launcher.dart';

class EventDetailsDialogMessage extends Equatable {
  const EventDetailsDialogMessage({
    required this.event,
    required this.date,
  });

  final Event event;
  final Date date;

  @override
  List<Object?> get props => [event, date];
}

class EventDetailsDialog extends StatelessWidget {
  const EventDetailsDialog({super.key, required this.message});

  final EventDetailsDialogMessage message;

  @override
  Widget build(BuildContext context) {
    final event = message.event;

    return DialogBuilder(
      builder: (dialogKey) {
        return Container(
          key: dialogKey,
          width: (400.0, MediaQuery.sizeOf(context).width * 0.85).resolve,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              if (event.eventType == EventType.scheduleMeeting) ...{
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: context.locale.minimumNotice,
                    style: Theme.of(context).textTheme.bodyMedium,
                    children: [
                      const TextSpan(text: ' : '),
                      TextSpan(
                        text: context.locale.fourHours,
                      )
                    ],
                  ),
                ),
              },
              const SizedBox(height: 16),
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.calendarBlank(),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  _TextContainer(
                    key: ValueKey(
                      '${message.date.formattedDateWithoutYear}_TextContainer',
                    ),
                    text: message.date.formattedDateWithoutYear,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  PhosphorIcon(
                    PhosphorIcons.clock(),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  _TextContainer(
                    key: ValueKey('${event.startTime}_TextContainer'),
                    text: event.startTime.toString(),
                  ),
                  const SizedBox(width: 8),
                  Text(context.locale.to),
                  const SizedBox(width: 8),
                  _TextContainer(
                    key: ValueKey('${event.endTime}_TextContainer'),
                    text: event.endTime.toString(),
                  ),
                ],
              ),
              if (event.venue != null &&
                  (event.venue?.isNotEmpty ?? false)) ...{
                const SizedBox(height: 16),
                Row(
                  children: [
                    PhosphorIcon(
                      PhosphorIcons.mapPin(),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    _TextContainer(
                      key: ValueKey(
                        '${event.venue}_TextContainer',
                      ),
                      text: event.venue!,
                    ),
                  ],
                ),
              },
              const SizedBox(height: 24),
              if (event.eventType != EventType.scheduleMeeting)
                _EventTypeCard(
                  key: ValueKey('${event.eventType}_EventTypeCard'),
                  eventType: event.eventType,
                ),
              if (event.eventType == EventType.scheduleMeeting)
                TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(400, 48),
                    backgroundColor: event.eventType.cardColor,
                    foregroundColor:
                        event.eventType.cardColor.computeLuminance() > 0.5
                            ? Theme.of(context).primaryColorDark
                            : Theme.of(context).primaryColorLight,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(context.locale.schedule),
                  onPressed: () {
                    if (event.url != null) {
                      launchUrl(Uri.parse(event.url!));
                    }
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

class _TextContainer extends StatelessWidget {
  const _TextContainer({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F7),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _EventTypeCard extends StatelessWidget {
  const _EventTypeCard({super.key, required this.eventType});

  final EventType eventType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: eventType.cardColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        eventType.getDescription(context.locale),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
