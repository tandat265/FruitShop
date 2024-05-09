import 'package:flutter/material.dart';

class detail_item extends StatefulWidget {
  const detail_item({super.key});

  @override
  State<detail_item> createState() => _detail_itemState();
}

class _detail_itemState extends State<detail_item> {
  bool _isLiked = false;
  bool isExpanded = false;
  int maxLength = 150; // Số ký tự tối đa trước khi hiển thị "Xem thêm"
  String cmtContent =
      "Nội dung ở đây Nội dung ở đâyNội dung ở đâyNội dung ở đâyNội dung ở đâyNội dung ở đâyNội dung ở đây";
  final FocusNode _commentFocusNode = FocusNode();

  Widget commentWidget() {
    if (cmtContent.length <= maxLength || isExpanded) {
      return Text(
        cmtContent,
        style: const TextStyle(fontSize: 13.0),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${cmtContent.substring(0, maxLength)}...",
            style: const TextStyle(fontSize: 13.0),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isExpanded = true;
              });
            },
            child: const Text(
              "Xem thêm",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget expandedCommentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cmtContent,
          style: const TextStyle(fontSize: 13.0),
        ),
        InkWell(
          onTap: () {
            setState(() {
              isExpanded = false;
            });
          },
          child: const Text(
            "Ẩn",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                child: ImageList()),

            /// title
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                "Kiwi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.green, // Màu chữ
                ),
              ),
            ),

            /// description
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Text(
                "Kiwi",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Colors.blue, // Màu chữ
                ),
              ),
            ),

            // đánh giá
            const Text(
              'Comments and Reviews',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // Expanded(
            //   child: ListView(
            //     children: const [
            //       // List of comments and reviews will go here
            //     ],
            //   ),
            // ),
            Column(
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/avatar.jpg"),
                  ),
                  title: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                      children: [
                        const TextSpan(
                          text: "Ngô Tấn Đạt",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "\n${DateTime.now().toString()}",
                          style: const TextStyle(
                            fontSize: 13.0, // Đặt cỡ chữ cho thời gian
                            color:
                                Colors.grey, // Tùy chỉnh màu sắc cho thời gian
                          ),
                        ),
                        // Đặt thời gian ở title
                      ],
                    ),
                  ),

                  // subtitle: const Text(
                  //   "Nội dung bình luận ở đây",
                  //   style: TextStyle(
                  //     fontSize: 13.0, // Đặt cỡ chữ cho nội dung bình luận
                  //   ), // Đặt nội dung bình luận ở subtitle
                  // ),
                  subtitle:
                      isExpanded ? expandedCommentWidget() : commentWidget(),

                  trailing: const Icon(Icons
                      .more_vert), // Add your custom actions here if needed
                  contentPadding: const EdgeInsets.all(0),
                  dense: true,
                  onTap: () {
                    // Add onTap functionality if needed
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(55, 0, 0, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLiked = !_isLiked;
                          });
                        },
                        child: Icon(
                          Icons.thumb_up_alt,
                          size: 12,
                          color: _isLiked ? Colors.blue : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        "5 ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const Text(
                        "Likes",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        "•",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context)
                              .requestFocus(_commentFocusNode);
                        },
                        child: const Text(
                          "Reply",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _commentFocusNode,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(),
                        contentPadding:
                            EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      // Add comment logic here
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // drawer: const sidebar(),
    );
  }
}

class ImageList extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/images/kiwi.jpg',
    'assets/images/kiwi_1.jpg',
    'assets/images/kiwi_2.jpg',
    // Thêm các đường dẫn của hình ảnh khác vào đây
  ];

  ImageList({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return AspectRatio(
              aspectRatio: 16 / 9, // Tỉ lệ của hình ảnh
              child: Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
              ));
        });
  }
}
