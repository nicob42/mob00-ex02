import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

final List<String> buttons = [
  '7',
  '8',
  '9',
  'C',
  'AC',
  '4',
  '5',
  '6',
  '+',
  '-',
  '1',
  '2',
  '3',
  '*',
  '/',
  '0',
  '.',
  '00',
  '=',
];

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double appBarHeight = AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 98, 98, 126),
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: w,
            height: h / 2 - appBarHeight,
            color: Color.fromARGB(255, 127, 127, 162),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  '0',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
              color: Color.fromARGB(255, 98, 98, 126),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // Calcul du nombre de colonnes en fonction de la largeur de l'écran
                  int crossAxisCount = 5;

                  // Calcul du nombre de lignes en fonction du nombre de boutons
                  int rowCount = (buttons.length / crossAxisCount).ceil();

                  double availableHeight = constraints.maxHeight;
                  double buttonWidth = w / crossAxisCount;
                  double buttonHeight = availableHeight / rowCount;

                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      childAspectRatio: buttonWidth / buttonHeight,
                    ),
                    itemCount: buttons.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: buttonWidth,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            print(buttons[index]);
                          },
                          child: Text(buttons[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
