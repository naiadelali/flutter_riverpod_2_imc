import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_exemple/imc_model.dart';

import 'imc_provider.dart';

class IMCNotifier extends Notifier<ImcModel> {
  ImcModel _viewModel = ImcModel();

  get altura => ref.watch(alturaProvider);

  updateWeight(String value) {
    _viewModel = _viewModel.copyWith(weight: double.tryParse(value) ?? 0);
  }

  updateHeight(String value) {
    _viewModel = _viewModel.copyWith(height: double.tryParse(value) ?? 0);
    ref.read(alturaProvider.notifier).state = value;
  }

  void calculate() {
    String? result;
    final double wt = _viewModel.weight ?? 0;
    final double ht = _viewModel.height ?? 0;
    final double imc = (wt / ((ht * ht) / 100) * 100);

    if (imc < 18.6) {
      result = 'Abaixo do peso -> (${imc.toStringAsPrecision(2)})';
    } else if (imc >= 18.6 && imc < 24.9) {
      result = 'Peso Ideal -> (${imc.toStringAsPrecision(2)})';
    } else if (imc >= 24.9 && imc < 29.9) {
      result = 'Levemente acima do peso -> (${imc.toStringAsPrecision(2)})';
    } else if (imc >= 29.9 && imc < 34.9) {
      result = 'Obesidade Grau I -> (${imc.toStringAsPrecision(2)})';
    } else if (imc >= 34.9 && imc < 39.9) {
      result = 'Obesidade Grau II -> (${imc.toStringAsPrecision(2)})';
    } else if (imc >= 40) {
      result = 'Obesidade Grau III -> (${imc.toStringAsPrecision(2)})';
    }

    state = _viewModel.copyWith(infoText: result);
  }

  @override
  ImcModel build() {
    ref.onDispose(() {
      print("IMCNotifier disposed");
    });

    return ImcModel();
  }
}
