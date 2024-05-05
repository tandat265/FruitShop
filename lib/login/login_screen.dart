import 'package:flutter/material.dart';
import 'package:fruitshop/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class login_screen extends StatelessWidget {
  const login_screen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Ảnh chiếm 1/2 phía trên của màn hình
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 20.0),
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://cdn.tgdd.vn/Files/2018/03/15/1074573/6-loi-ich-bat-ngo-cua-trai-kiwi-202110211628557582.jpg',
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          // Nội dung của bạn
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: TextField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black87), // Màu chữ
              decoration: InputDecoration(
                hintText: 'Username', // Chú thích
                hintStyle:
                    const TextStyle(color: Colors.grey), // Màu chữ chú thích
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 227, 244),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.transparent), // Màu viền
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.transparent), // Màu viền khi không focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.blue), // Màu viền khi focus
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.red), // Màu viền khi có lỗi
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.red), // Màu viền khi focus và có lỗi
                ),
                // Nếu bạn muốn icon ở đầu textfield:
                prefixIcon:
                    const Icon(Icons.person, color: Colors.grey), // Icon ở đầu
                // Nếu bạn muốn icon ở cuối textfield:
                // suffixIcon: Icon(Icons.visibility), // Icon ở cuối
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 10.0,
            ),
            child: TextField(
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black87), // Màu chữ
              decoration: InputDecoration(
                hintText: 'Password', // Chú thích
                hintStyle:
                    const TextStyle(color: Colors.grey), // Màu chữ chú thích
                filled: true,
                fillColor: const Color.fromARGB(255, 220, 227, 244),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:
                      const BorderSide(color: Colors.transparent), // Màu viền
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.transparent), // Màu viền khi không focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.blue), // Màu viền khi focus
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.red), // Màu viền khi có lỗi
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                      color: Colors.red), // Màu viền khi focus và có lỗi
                ),
                // Nếu bạn muốn icon ở đầu textfield:
                prefixIcon:
                    const Icon(Icons.lock, color: Colors.grey), // Icon ở đầu
                // Nếu bạn muốn icon ở cuối textfield:
                // suffixIcon: Icon(Icons.visibility), // Icon ở cuối
              ),
            ),
          ),
          // Nút đăng nhập
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType
                        .fade, // Loại hiệu ứng chuyển trang (ví dụ: fade)
                    duration: const Duration(
                        milliseconds:
                            500), // Thời gian thực hiện hiệu ứng (milliseconds)
                    child: home_screen(), // Trang chuyển đến
                  ),
                );

                // Xử lý sự kiện khi nhấn nút đăng nhập
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 20.0), // Đặt kích thước của nút
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 15.0), // Đặt kích thước chữ
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  // Xử lý sự kiện khi nhấn nút đăng ký
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
