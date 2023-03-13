import 'package:flutter/material.dart';

class CustomStreamScreen extends StatelessWidget {
  var list = <String>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder(
          stream: productsStream(),
          builder: (BuildContext context, AsyncSnapshot<Product> snapshot) {
            print(
                snapshot.hasData ? snapshot.data!.name.toString() : 'no data');
            snapshot.hasData ? list.add(snapshot.data!.name.toString()) : print;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  return Text(
                    snapshot.hasData
                        ? snapshot.data!.name.toString()
                        : 'no data',
                    style: Theme.of(context).textTheme.headline4,
                  );
                });
          },
        ),
      ),
    );
  }
}

Stream<Product> productsStream() async* {
  while (true) {
    await Future.delayed(const Duration(seconds: 30));
    Product someProduct = Product('bob');
    yield someProduct;
  }
}

class Product {
  final String name;
  Product(this.name);
}
