import 'package:flutter/material.dart';

class detail_item extends StatelessWidget {
  const detail_item({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Thực hiện hành động khi nút được nhấn
            // Ví dụ: Navigator.pop(context); để quay lại trang trước
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: AspectRatio(
                aspectRatio: 16 / 9, // Tỉ lệ của hình ảnh
                child: Image.asset(
                  'assets/images/fruit/kiwi/kiwi.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      // drawer: const sidebar(),
    );
  }
}
