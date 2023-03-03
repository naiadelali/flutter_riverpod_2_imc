import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'imc_notifier.dart';
import 'imc_model.dart';

final imcNotifierProvider =
    NotifierProvider<IMCNotifier, ImcModel>(IMCNotifier.new);

final alturaProvider = StateProvider<String>((ref) {
  return "";
});
