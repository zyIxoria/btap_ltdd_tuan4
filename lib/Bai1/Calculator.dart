import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});

  final List<String> buttons = [
    '%','CE', 'C', '⌫', '1/x', 'x²', '√x', '÷', '7',
    '8', '9', '×', '4', '5', '6', '-', '1',
    '2', '3', '+', '+/-', '0',
    '.', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7FA), // nền hồng rất nhạt
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE4EC),
        elevation: 0,
        leading: const Icon(Icons.menu, color: Color(0xFFB03060)),
        title: const Text(
          'Standard',
          style: TextStyle(
            color: Color(0xFFB03060),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.history, color: Color(0xFFB03060)),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            // Font responsive
            final resultFontSize = (screenWidth * 0.14).clamp(36.0, 72.0);
            final expressionFontSize = (screenWidth * 0.06).clamp(18.0, 28.0);
            final buttonFontSize = (screenWidth * 0.05).clamp(16.0, 26.0);
            final memoryFontSize = (screenWidth * 0.035).clamp(11.0, 16.0);

            return Column(
              children: [
                // Khu vực hiển thị biểu thức và kết quả
                Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFF7FA),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: expressionFontSize,
                            color: Colors.pink[300],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerRight,
                          child: Text(
                            '0',
                            style: TextStyle(
                              fontSize: resultFontSize,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink[900],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Hàng memory
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.02,
                    vertical: screenHeight * 0.005,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: ['MC', 'MR', 'M+', 'M-', 'MS', 'M⌄']
                        .map(
                          (e) => Text(
                        e,
                        style: TextStyle(
                          fontSize: memoryFontSize,
                          color: Colors.pink[400],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),

                // Lưới nút bấm
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buttons.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: screenWidth * 0.015,
                        mainAxisSpacing: screenWidth * 0.015,
                        childAspectRatio: screenWidth / (screenHeight * 0.18),
                      ),
                      itemBuilder: (context, index) {
                        final text = buttons[index];
                        final isEqual = text == '=';
                        final isOperator = [
                          '%',
                          'CE',
                          'C',
                          '⌫',
                          '1/x',
                          'x²',
                          '√x',
                          '÷',
                          '×',
                          '-',
                          '+',
                          '+/-',
                        ].contains(text);

                        return ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: isEqual
                                ? const Color(0xFFE91E63)
                                : isOperator
                                ? const Color(0xFFFFE4EC)
                                : Colors.white,
                            foregroundColor: isEqual
                                ? Colors.white
                                : const Color(0xFF880E4F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              text,
                              style: TextStyle(
                                fontSize: buttonFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}