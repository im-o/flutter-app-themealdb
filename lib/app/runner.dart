import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_dicoding/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'locator.dart' as di;

Future runnerApp() async {
  await di.setupLocator();
  Bloc.observer = SimpleBlocObserver();
  runApp(const App());
}
