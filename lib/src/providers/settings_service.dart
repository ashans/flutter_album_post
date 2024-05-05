import 'package:sample_application/src/domain/services/setting_service.dart';
import 'package:sample_application/src/providers/storage_provider.dart';

class SettingsServiceImpl extends SettingsService {
  final StorageProvider storage;

  SettingsServiceImpl(this.storage);

  @override
  bool get isDark => storage.isDarkTheme;

  @override
  set isDark(bool isDark) {
    storage.isDarkTheme = isDark;
    notifyListeners();
  }
}
