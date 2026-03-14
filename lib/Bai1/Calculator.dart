import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final List<String> buttons = [
    '%',
    'CE',
    'C',
    '⌫',
    '1/x',
    'x²',
    '√x',
    '÷',
    '7',
    '8',
    '9',
    '×',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '+/-',
    '0',
    '.',
    '=',
  ];

  String expression = '';
  String result = '0';

  void onButtonPressed(String value) {
    setState(() {
      switch (value) {
        case 'C':
          expression = '';
          result = '0';
          break;

        case 'CE':
          expression = '';
          break;

        case '⌫':
          if (expression.isNotEmpty) {
            expression = expression.substring(0, expression.length - 1);
          }
          break;

        case '=':
          calculateResult();
          break;

        case '+':
        case '-':
        case '×':
        case '÷':
          if (expression.isNotEmpty && !isOperator(expression[expression.length - 1])) {
            expression += value;
          }
          break;

        case '.':
          expression += '.';
          break;

        case '+/-':
          toggleSign();
          break;

        case '%':
          percent();
          break;

        case '1/x':
          reciprocal();
          break;

        case 'x²':
          square();
          break;

        case '√x':
          squareRoot();
          break;

        default:
          expression += value;
      }
    });
  }

  bool isOperator(String ch) {
    return ch == '+' || ch == '-' || ch == '×' || ch == '÷';
  }

  void calculateResult() {
    try {
      if (expression.isEmpty) return;

      String exp = expression.replaceAll('×', '*').replaceAll('÷', '/');

      double calc = evaluateExpression(exp);

      if (calc == calc.toInt()) {
        result = calc.toInt().toString();
      } else {
        result = calc.toString();
      }
    } catch (e) {
      result = 'Lỗi';
    }
  }

  // ===== Các chức năng đặc biệt =====
  void percent() {
    try {
      if (expression.isEmpty) return;

      double value = double.parse(expression);
      value = value / 100;

      expression = formatNumber(value);
      result = expression;
    } catch (e) {
      result = 'Lỗi';
    }
  }

  void reciprocal() {
    try {
      if (expression.isEmpty) return;

      double value = double.parse(expression);
      if (value == 0) {
        result = 'Lỗi';
        return;
      }

      value = 1 / value;
      expression = formatNumber(value);
      result = expression;
    } catch (e) {
      result = 'Lỗi';
    }
  }

  void square() {
    try {
      if (expression.isEmpty) return;

      double value = double.parse(expression);
      value = value * value;

      expression = formatNumber(value);
      result = expression;
    } catch (e) {
      result = 'Lỗi';
    }
  }

  void squareRoot() {
    try {
      if (expression.isEmpty) return;

      double value = double.parse(expression);
      if (value < 0) {
        result = 'Lỗi';
        return;
      }

      value = sqrtNewton(value);

      expression = formatNumber(value);
      result = expression;
    } catch (e) {
      result = 'Lỗi';
    }
  }

  void toggleSign() {
    try {
      if (expression.isEmpty) return;

      double value = double.parse(expression);
      value = -value;

      expression = formatNumber(value);
      result = expression;
    } catch (e) {
      result = 'Lỗi';
    }
  }

  // ===== Căn bậc 2 bằng Newton (không cần import math) =====
  double sqrtNewton(double number) {
    if (number == 0) return 0;

    double x = number;
    double root = 0.5 * (x + number / x);

    for (int i = 0; i < 20; i++) {
      root = 0.5 * (root + number / root);
    }

    return root;
  }

  // ===== Format số =====
  String formatNumber(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    return value.toString();
  }

  // ===== Tính biểu thức cơ bản =====
  double evaluateExpression(String exp) {
    List<String> tokens = tokenize(exp);

    if (tokens.isEmpty) return 0;

    // Xử lý * và /
    List<String> temp = [];
    temp.add(tokens[0]);

    int i = 1;
    while (i < tokens.length) {
      String op = tokens[i];
      double nextNum = double.parse(tokens[i + 1]);

      if (op == '*' || op == '/') {
        double prevNum = double.parse(temp.removeLast());
        double value = (op == '*') ? prevNum * nextNum : prevNum / nextNum;
        temp.add(value.toString());
      } else {
        temp.add(op);
        temp.add(nextNum.toString());
      }

      i += 2;
    }

    // Xử lý + và -
    double finalResult = double.parse(temp[0]);
    i = 1;

    while (i < temp.length) {
      String op = temp[i];
      double nextNum = double.parse(temp[i + 1]);

      if (op == '+') {
        finalResult += nextNum;
      } else if (op == '-') {
        finalResult -= nextNum;
      }

      i += 2;
    }

    return finalResult;
  }

  // ===== Tách biểu thức =====
  List<String> tokenize(String exp) {
    List<String> tokens = [];
    String number = '';

    for (int i = 0; i < exp.length; i++) {
      String ch = exp[i];

      if ('0123456789.'.contains(ch)) {
        number += ch;
      } else if ('+-*/'.contains(ch)) {
        if (number.isNotEmpty) {
          tokens.add(number);
          number = '';
        }
        tokens.add(ch);
      }
    }

    if (number.isNotEmpty) {
      tokens.add(number);
    }

    return tokens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Standard'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.history),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Hiển thị biểu thức
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
              child: Text(
                expression.isEmpty ? '' : expression,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
            ),

            // Màn hình kết quả
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Các nút Memory
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                'MC',
                'MR',
                'M+',
                'M-',
                'MS',
                'M⌄',
              ].map((e) => Text(e, style: const TextStyle(fontSize: 16))).toList(),
            ),

            const SizedBox(height: 6),

            // Lưới các nút bấm
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.3,
                ),
                itemBuilder: (context, index) {
                  final buttonText = buttons[index];
                  final isEqual = buttonText == '=';
                  final isOperatorButton = [
                    '÷',
                    '×',
                    '-',
                    '+',
                    '=',
                    '%',
                    'CE',
                    'C',
                    '⌫',
                    '1/x',
                    'x²',
                    '√x',
                    '+/-',
                  ].contains(buttonText);

                  return Container(
                    margin: const EdgeInsets.all(1),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isEqual
                            ? Colors.blue[800]
                            : isOperatorButton
                            ? Colors.grey[200]
                            : Colors.white,
                        foregroundColor: isEqual ? Colors.white : Colors.black,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        elevation: 0,
                      ),
                      onPressed: () => onButtonPressed(buttonText),
                      child: Text(
                        buttonText,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}