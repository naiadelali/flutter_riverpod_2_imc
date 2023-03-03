import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'imc_model.dart';
import 'imc_notifier.dart';

final imcNotifierProvider =
    AutoDisposeNotifierProvider<IMCNotifier, ImcModel>(IMCNotifier.new);

final alturaProvider = StateProvider<String>((ref) {
  return "";
});
