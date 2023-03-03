import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../imc_provider.dart';

class AlturaImcConsumrExemplo extends ConsumerWidget {
  const AlturaImcConsumrExemplo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final altura = ref.watch(alturaProvider);
    return Text(
      'Widget filho consumer: $altura',
      textAlign: TextAlign.center,
      style: const TextStyle(color: Colors.purple, fontSize: 25.0),
    );
  }
}
