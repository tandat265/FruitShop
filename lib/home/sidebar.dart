import 'package:flutter/material.dart';
import 'package:fruitshop/categories/categories.dart';
import 'package:fruitshop/home/home_screen.dart';

class sidebar extends StatelessWidget {
  const sidebar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const Row(
            children: [
              Expanded(
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo/login_screen.jpg',
                      ),
                      fit: BoxFit.contain,
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child:
                      null, // Bạn có thể không cần child nếu bạn chỉ muốn hiển thị hình ảnh
                ),
              ),
            ],
          ),
          title_sidebar(
              context, Icons.home, "Home Page", "Home Page", home_screen()),
          title_sidebar(context, Icons.category, "Category", "Home Page",
              const categories()),
          // Thêm các mục khác tương tự ở đây
        ],
      ),
    );
  }

  Column title_sidebar(BuildContext context, IconData icon, String title,
      String descrip, Widget destinations) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(icon), // Icon ở bên trái
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ), // Tiêu đề
          onTap: () {
            // Xử lý khi người dùng chọn mục 1
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destinations),
            );
            // Navigator.pop(context); // Đóng drawer
          },
          trailing: const Icon(Icons.arrow_forward_ios), // Icon ở bên phải
          subtitle: Text(descrip), // Mô tả
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          dense: true,
        ),
        const Divider(), // Khoảng cách giữa các nội dung
      ],
    );
  }
}
