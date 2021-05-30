import 'package:flutter/material.dart';

class DraDraggableScrollable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DraggableScrollableSheet'),
      ),
      body: SizedBox.expand(
        child: DraggableScrollableSheet(
          maxChildSize: 0.5,
          minChildSize: 0.2,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              color: Colors.blue[100],
              child: ListView.builder(
                controller: scrollController,
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('saya $index'));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
