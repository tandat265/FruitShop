import 'package:flutter/material.dart';
import 'package:fruitshop/categories/list_item.dart';
import 'package:fruitshop/home/sidebar.dart';

class categories extends StatelessWidget {
  const categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      drawer: const sidebar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                listMenu(
                    context, Icons.hotel, 'hotel', Colors.green, list_item()),
                listMenu(
                    context, Icons.train, 'train', Colors.black, list_item()),
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Padding listMenu(BuildContext context, IconData icon, String text,
      Color color, Widget destinations) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: 165,
        height: 60,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 212, 225, 246),
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinations),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.white,
                  child: Icon(
                    icon,
                    color: color,
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
