import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'imc_provider.dart';
import 'widgets/widgets.dart';

class ImcPage extends ConsumerStatefulWidget {
  const ImcPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ImcPageState();
}

class _ImcPageState extends ConsumerState<ImcPage> {
  late dynamic controller;
  late String imc;
  late double? altura;
  late double? peso;
  late TextEditingController wtController;
  late TextEditingController htController;

  @override
  void initState() {
    wtController = TextEditingController();
    htController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller = ref.read(imcNotifierProvider.notifier);
    imc = ref.watch(imcNotifierProvider).infoText;
    altura = ref.watch(imcNotifierProvider).height;
    peso = ref.watch(imcNotifierProvider).weight;

    final button = ButtonCalculate(
      onPressed: () {
        if (wtController.text.isEmpty || htController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Insira seus dados!'),
            ),
          );
        } else {
          controller.calculate();
        }
      },
      title: 'Calcular',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              controller.reset();
              wtController.clear();
              htController.clear();
            },
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
            TextFormFieldWidget(
              htController: wtController,
              onChange: (value) => controller.updateWeight(value),
              title: 'Peso',
            ),
            TextFormFieldWidget(
              htController: htController,
              onChange: (value) => controller.updateHeight(value),
              title: 'Altura',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                height: 50.0,
                child: button,
              ),
            ),
            Column(
              children: [
                Text(
                  imc,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                ),
                const AlturaImcConsumrExemplo(),
                Text(
                  'Altura: ${altura ?? ''}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    wtController.dispose();
    htController.dispose();
    super.dispose();
  }
}
