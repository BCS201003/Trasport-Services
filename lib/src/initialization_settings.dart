import '../Notification/flutter_local_notifications.dart';

/// Settings for initializing the plugin for each platform.
class InitializationSettings {
  /// Constructs an instance of [InitializationSettings].
  const InitializationSettings({
    this.android,
  });
  final AndroidInitializationSettings? android;
}
