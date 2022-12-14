import 'user.dart';

import 'enum/notification_type.dart';

class Notification {
  final String id;
  final DateTime dateHour;
  final bool isSeen;
  final NotificationType notificationType;
  final String? contentLinked;
  final User userRecipient;
  final User? userLinked;

  Notification({
    required this.id,
    required this.dateHour,
    required this.isSeen,
    required this.notificationType,
    this.contentLinked,
    required this.userRecipient,
    this.userLinked,
  });
}
