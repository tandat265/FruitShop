import 'package:flutter/material.dart';
import 'package:fruitshop/categories/detail_item.dart';
import 'package:page_transition/page_transition.dart';

import '../models/tab_item.dart';

class list_item extends StatefulWidget {
  const list_item({super.key});

  @override
  State<list_item> createState() => _list_itemState();
}

class _list_itemState extends State<list_item> {
  final TextEditingController _searchController = TextEditingController();

  int selectedIndex = 0;
  // chỉ một trong hai tab có isSelected = true
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('hotel'),
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
          verticalDirection: VerticalDirection.down,
          children: [
            // thanh tìm kiếm
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled:
                        true, // Đặt filled là true để tạo nền cho ô tìm kiếm
                    fillColor: Colors.grey[200], // Màu nền của ô tìm kiếm
                    hintText: 'Search...',
                    hintStyle:
                        TextStyle(color: Colors.grey[500]), // Màu chữ chú thích
                    prefixIcon: Icon(Icons.search,
                        color: Colors.grey[500]), // Màu icon tìm kiếm
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear,
                          color: Colors.grey[500]), // Icon xóa
                      onPressed: () {
                        // Xử lý khi nhấn nút xóa
                        _searchController.clear();
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Bo tròn viền ô tìm kiếm
                      borderSide: BorderSide.none, // Ẩn viền
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Bo tròn viền khi ô tìm kiếm được focus
                      borderSide: BorderSide.none, // Ẩn viền
                    ),
                  ),
                  onChanged: (value) {
                    // Xử lý khi nội dung của ô tìm kiếm thay đổi
                    print('Tìm kiếm: $value');
                  },
                ),
              ),
            ),
            // Container(
            //   alignment: Alignment.topLeft,
            //   margin: const EdgeInsets.only(left: 20, top: 20),
            //   child: const Text(
            //     "Best for you",
            //     style: TextStyle(
            //       fontSize: 20,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                    child: TabItem(
                      text: 'Most Popular',
                      isSelected: selectedIndex == 0,
                      onPressed: () {
                        // Xử lý khi tab 1 được chọn
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                    child: TabItem(
                      text: 'All items',
                      isSelected: selectedIndex == 1,
                      onPressed: () {
                        // Xử lý khi tab 2 được chọn
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),

            lstImages(),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Padding lstImages() {
    double remainingHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        200;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Container(
          alignment: Alignment.bottomLeft,
          height: remainingHeight,
          child: GridView.count(
            shrinkWrap: false,
            crossAxisCount: 2, // Số cột là 2
            mainAxisSpacing: 20.0, // Khoảng cách giữa các hàng
            crossAxisSpacing: 20.0, // Khoảng cách giữa các cột
            childAspectRatio:
                0.7, // Tỷ lệ giữa chiều rộng và chiều cao của mỗi item
            children: List.generate(
              7,
              (index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType
                            .leftToRight, // Loại hiệu ứng chuyển động
                        duration: const Duration(
                            milliseconds: 500), // Thời gian chuyển động
                        child: const detail_item(), // Màn hình chi tiết
                      ),
                    );
                  },
                  child: Container(
                    // margin: const EdgeInsets.only(right: 10.0),
                    child: Card(
                      shadowColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: SizedBox(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: DecoratedBox(
                            position: DecorationPosition.background,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/fruit/kiwi/kiwi.jpg"),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              verticalDirection: VerticalDirection.down,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(right: 90, bottom: 10),
                                  child: Text(
                                    "Alibag Beach",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: const Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.place,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            "India",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            Text(
                                              "4.7",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
