import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => new _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Stepper(
              currentStep: _currentStep,
              onStepTapped: (step) {
                setState(() {
                  _currentStep = step;
                });
              },
              steps: [
                Step(
                    isActive: _currentStep == 0,
                    title: Text('Esse cillum ut voluptate et.'),
                    subtitle: Text('Excepteur laboris incididunt.'),
                    content: Text(
                        'Duis adipisicing cupidatat voluptate commodo in ex nulla. Nulla ullamco culpa deserunt occaecat nisi adipisicing aliqua duis non. Esse occaecat duis tempor esse id labore in ut reprehenderit nostrud do consectetur. Minim dolor ea mollit velit duis irure incididunt labore ipsum ipsum est pariatur nostrud.')),
                Step(
                    isActive: _currentStep == 1,
                    title: Text('Esse cillum ut voluptate et.'),
                    subtitle: Text('Excepteur laboris incididunt.'),
                    content: Text(
                        'Duis adipisicing cupidatat voluptate commodo in ex nulla. Nulla ullamco culpa deserunt occaecat nisi adipisicing aliqua duis non. Esse occaecat duis tempor esse id labore in ut reprehenderit nostrud do consectetur. Minim dolor ea mollit velit duis irure incididunt labore ipsum ipsum est pariatur nostrud.')),
                Step(
                    isActive: _currentStep == 2,
                    title: Text('Esse cillum ut voluptate et.'),
                    subtitle: Text('Excepteur laboris incididunt.'),
                    content: Text(
                        'Duis adipisicing cupidatat voluptate commodo in ex nulla. Nulla ullamco culpa deserunt occaecat nisi adipisicing aliqua duis non. Esse occaecat duis tempor esse id labore in ut reprehenderit nostrud do consectetur. Minim dolor ea mollit velit duis irure incididunt labore ipsum ipsum est pariatur nostrud.')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
