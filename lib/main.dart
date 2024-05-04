import 'package:flutter/material.dart';
import 'package:muta_test/locator/locate.dart';
import 'package:muta_test/main_muta_test.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainMutaTest());
}
