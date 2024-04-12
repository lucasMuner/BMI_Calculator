import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  double _bmi = 0;

  CalculatorBrain(this.height, this.weight);

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Acima do peso!';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso!';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Seu índice de massa corporal indica que você está acima do peso. Recomendamos consultar um profissional de saúde para orientações e recomendações sobre estilo de vida e nutrição.!';
    } else if (_bmi > 18.5) {
      return 'Seu índice de massa corporal está dentro da faixa considerada normal. Continue com os hábitos saudáveis e a prática de exercícios físicos para manter sua saúde.';
    } else {
      return 'Seu índice de massa corporal indica que você está abaixo do peso. É importante conversar com um médico para entender as possíveis causas e receber orientações sobre como alcançar um peso saudável.';
    }
  }
}
