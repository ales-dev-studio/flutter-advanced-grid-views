import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grid View')),
      body: GridView.builder(
        padding: EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 8, // Horizontal space between items
          mainAxisSpacing: 8, // Vertical space between items
        ),
        itemCount: 30,
        itemBuilder: (context, index) {
          return FadeInDown(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/id/$index/200/200',
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
