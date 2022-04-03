// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:mindful/app/app.dart';
import 'package:mindful/app/bootstrap.dart';
import 'package:mindful/firebase_options_dev.dart';

void main() {
  bootstrap(
    () => const App(),
    Flavor.develop,
    DefaultFirebaseOptions.currentPlatform,
  );
}
