/*
 * Copyright (c) 2021 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical
 * or instructional purposes related to programming, coding, application
 * development, or information technology.  Permission for such use, copying,
 * modification, merger, publication, distribution, sublicensing, creation of
 * derivative works, or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'package:flutter/material.dart';

void main() {
  runApp(const CalcTipApp());
}

class CalcTipApp extends StatelessWidget {
  const CalcTipApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalcTip',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const CalcTipScreen(),
    );
  }
}

class CalcTipScreen extends StatefulWidget {
  const CalcTipScreen({Key? key}) : super(key: key);

  @override
  State<CalcTipScreen> createState() => _CalcTipScreenState();
}

class _CalcTipScreenState extends State<CalcTipScreen> {
  double _bill = 0;
  double _tipPercentage = 15;
  double _tipAmount = 0;
  double _totalAmount = 0;

  void _calculateTip() {
    setState(() {
      _tipAmount = _bill * _tipPercentage / 100.0;
      _totalAmount = _bill + _tipAmount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          repeat: ImageRepeat.repeat,
          image: AssetImage('assets/images/table.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: const Text('CalcTip')),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
            child: Card(
              shape: const ContinuousRectangleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      autofocus: true,
                      initialValue: '$_bill',
                      textAlign: TextAlign.right,
                      onChanged: (value) {
                        _bill = double.tryParse(value) ?? 0.0;
                        _calculateTip();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Bill',
                        prefixText: '\$',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      initialValue: '$_tipPercentage',
                      textAlign: TextAlign.right,
                      onChanged: (value) {
                        _tipPercentage = double.tryParse(value) ?? 0.0;
                        _calculateTip();
                      },
                      decoration: const InputDecoration(
                        labelText: 'Tip %',
                        suffixText: '%',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(height: 10),
                    InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Tip Amount',
                        prefixText: '\$',
                      ),
                      child: Text(
                        '${_tipAmount.toStringAsFixed(2)}',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'Total amount',
                        prefixText: '\$',
                      ),
                      child: Text(
                        '${_totalAmount.toStringAsFixed(2)}',
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
