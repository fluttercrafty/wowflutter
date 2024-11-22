
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wowflutter/widgets/custom_widgets.dart';

class SixDigitCodeInput extends StatefulWidget {
  final Function(String) onComplete;
  final double boxWidth;
  final double boxHeight;
  final double fontSize;
  final Color borderColor;
  final String text;

  const SixDigitCodeInput({
    super.key,
    required this.onComplete,
    required this.text,
    this.boxWidth = 50,
    this.boxHeight = 60,
    this.fontSize = 20,
    this.borderColor = Colors.blue,
  });

  @override
  State<SixDigitCodeInput> createState() => _SixDigitCodeInputState();
}

class _SixDigitCodeInputState extends State<SixDigitCodeInput> {
  final List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  void _submitCode() {
    final code = controllers.map((controller) => controller.text).join();
    if (code.length == 6) {
      widget.onComplete(code);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a 6-digit code')),
      );
    }
  }

  void _handleKeyPress(RawKeyEvent event, int index) {
    if (event is RawKeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace) {
      // If backspace is pressed and the current field is empty, move focus to the previous field
      if (controllers[index].text.isEmpty && index > 0) {
        focusNodes[index - 1].requestFocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return SizedBox(
              width: widget.boxWidth,
              height: widget.boxHeight,
              child: RawKeyboardListener(
                focusNode: FocusNode(),
                onKey: (event) => _handleKeyPress(event, index),
                child: TextFormField(
                  controller: controllers[index],
                  focusNode: focusNodes[index],
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  maxLength: 1,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: widget.borderColor),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < 5) {
                      focusNodes[index + 1].requestFocus();
                    }
                    // if (index == 5 && value.isNotEmpty) {
                      
                    // }
                  },
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),
        CustomElevatedButton(
          onTap: _submitCode,
          text: widget.text,
        ),
      ],
    );
  }
}
