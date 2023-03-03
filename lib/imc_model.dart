class ImcModel {
  final String infoText;
  final double? weight;
  final double? height;

  ImcModel({this.infoText = "Informe os dados", this.height, this.weight});

  copyWith({
    String? infoText,
    double? weight,
    double? height,
  }) {
    return ImcModel(
        infoText: infoText ?? this.infoText,
        weight: weight ?? this.weight,
        height: height ?? this.height);
  }
}
