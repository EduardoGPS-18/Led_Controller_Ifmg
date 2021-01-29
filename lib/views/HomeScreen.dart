import 'package:flutter/material.dart';
import '../models/LedState.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LedState _led1State = LedState(), _led2State = LedState(), _led3State = LedState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[600],
        title: Text(
          "Controle dos Led's",
          style: TextStyle(color: Colors.grey[700]),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushReplacementNamed(context, "/"),
            color: Colors.grey[700],
          )
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: ledWidget(
                led: _led1State,
                ledOnColor: Colors.red,
              ),
            ),
            Flexible(
              child: ledWidget(
                led: _led2State,
                ledOnColor: Colors.green,
              ),
            ),
            Flexible(
              child: ledWidget(
                led: _led3State,
                ledOnColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ledWidget({
    @required final LedState led,
    final MaterialColor ledOnColor = Colors.amber,
    final int onLedValueHigh = 600,
    final int onLedValueLow = 200,
    final MaterialColor ledOffColor = Colors.grey,
    final int offLedValueHigh = 600,
    final int offLedValueLow = 400,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        IconButton(
          icon: Icon(
            led.ledState ? Icons.lightbulb : Icons.lightbulb_outline,
            size: 58,
            color: led.ledState ? ledOnColor[onLedValueHigh] : ledOnColor[offLedValueLow],
          ),
          onPressed: () {
            setState(() {
              led.ledInvert();
            });
          },
        ),
        Container(
          padding: const EdgeInsets.all(9.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      led.ledOn();
                    });
                  },
                  child: Text("Ligado!"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(led.ledState ? ledOnColor[onLedValueHigh] : ledOnColor[onLedValueLow]),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      led.ledOff();
                    });
                  },
                  child: Text("Desligado!"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(!led.ledState ? ledOffColor[onLedValueHigh] : ledOffColor[offLedValueLow]),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
