import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'imc_controller.dart';
import 'imc_model.dart';

final imcNotifierProvider =
    AutoDisposeNotifierProvider<IMCController, ImcModel>(IMCController.new);

final alturaProvider = StateProvider<String>((ref) {
  return "";
});
