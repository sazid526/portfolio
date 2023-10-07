import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> buttonNames = ['S', 'M', 'L', 'XL'];
  final List<String> buttonName = ['XXL', 'XXXL'];

  int selectedButtonIndex = -1;

  void onButtonPressed(int index) {
    setState(() {
      selectedButtonIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Size Selector")),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                final size = ["S", "M", "L", "XL"][index];
                return ElevatedButton(
                  onPressed: () {
                    onButtonPressed(index);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedButtonIndex == index ? Colors.blue : Colors.grey,
                    ),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(2, (index) {
                final size = ["XXL", "XXXL"][index];
                final buttonIndex = index + 4;
                return ElevatedButton(
                  onPressed: () {
                    onButtonPressed(buttonIndex);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedButtonIndex == buttonIndex
                          ? Colors.blue
                          : Colors.grey,
                    ),
                  ),
                  child: Text(
                    size,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
