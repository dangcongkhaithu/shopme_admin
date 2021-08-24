import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopme_admin/pages/application/application.dart';

import 'core/common/constants/localization_constant.dart';
import 'data/shared_preferences/shared_pref.dart';
import 'di/injection.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    SharedPref.ensureInitialized(),
  ]);

  runApp(
    EasyLocalization(
      path: 'assets/translations',
      fallbackLocale: LocalizationConstant.defaultLanguage,
      supportedLocales: LocalizationConstant.supportedLanguages,
      useOnlyLangCode: true,
      child: Application(),
    ),
  );
}
