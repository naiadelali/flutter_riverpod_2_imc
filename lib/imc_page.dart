import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'imc_provider.dart';

class ImcPage extends ConsumerWidget {
  const ImcPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController wtController = TextEditingController();
    final TextEditingController htController = TextEditingController();
    final notifier = ref.read(imcNotifierProvider.notifier);
    final imc = ref.watch(imcNotifierProvider).infoText;

    final button = ElevatedButton(
      onPressed: () {
        if (wtController.text.isEmpty || htController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Insira seus dados!'),
            ),
          );
        } else {
          notifier.calculate();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: const Text(
        'Calcular',
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(imcNotifierProvider),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.person_outline, size: 120.0, color: Colors.purple),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Peso (Kg)',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.purple, fontSize: 25.0),
              controller: wtController,
              onChanged: (value) => notifier.updateWeight(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira seu peso.';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: 'Altura',
                labelStyle: TextStyle(
                  color: Colors.purple,
                ),
              ),
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.purple, fontSize: 25.0),
              controller: htController,
              onChanged: (value) => notifier.updateHeight(value),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira sua altura.';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50.0,
                child: button,
              ),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                //uso outro provider para alterar simultaneamente os valores sem afetar o provider do imcNotifier
                final altura = ref.watch(alturaProvider);
                return Column(
                  children: [
                    Text(
                      imc,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 25.0),
                    ),
                    Text(
                      'Altura: $altura',
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.purple, fontSize: 25.0),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
