import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';
import 'package:mindful/util/logging.dart';

/// Handles all interaction with firebase remote config
@injectable
@singleton
class RemoteConfigManager {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigManager({
    required FirebaseRemoteConfig remoteConfig,
  }) : _remoteConfig = remoteConfig;

  /// Initialize remote config and setting defaults
  Future initialize() async {
    await _remoteConfig.setDefaults(<String, dynamic>{
      'base_url': 'www.and-go.app/',
    });
    try {
      await _remoteConfig.fetchAndActivate();
    } catch (exception) {
      logger.w(
        'Unable to fetch remote config. Cached or default values will be '
        'used',
      );
    }
  }

// String _string(String key) {
//   return _remoteConfig.getString(key);
// }

// bool _bool(String key) {
//   return _remoteConfig.getBool(key);
// }

// int _int(String key) {
//   return _remoteConfig.getInt(key);
// }

// String get jobSchedulerConfig {
//   final json = _remoteConfig.getString('job_scheduler_config');
//   return json;
// }

}
