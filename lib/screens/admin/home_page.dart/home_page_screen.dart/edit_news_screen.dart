import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maju_trackmate/apis/admin/add_new_news.dart';
import 'package:maju_trackmate/model/student_classes/home_page/news_data.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/utils/dialog/my_dialogs.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class EditNewsScreen extends StatefulWidget {
  final News news;
  const EditNewsScreen({
    super.key,
    required this.news,
  });

  @override
  State<EditNewsScreen> createState() => _EditNewsScreenState();
}

class _EditNewsScreenState extends State<EditNewsScreen> {
  File? _file;
  final newsTitleController = TextEditingController();
  final newsContentController = TextEditingController();
  final youtubeLinkController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsTitleController.text = widget.news.title!;
    newsContentController.text = widget.news.content!;
    youtubeLinkController.text = widget.news.youtubeLink!;
  }

  @override
  void dispose() {
    super.dispose();
    newsContentController.dispose();
    newsTitleController.dispose();
    youtubeLinkController.dispose();
  }

  Future<void> _pickFile(Function(File) onFilePicked) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      final file = File(result.files.single.path!);
      onFilePicked(file);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select a file'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        actions: [
          getLogoutButton(),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: mq.height * 0.2,
                  width: mq.width,
                  decoration: const BoxDecoration(
                    color: Color(0xff0D4065),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: mq.width * 0.3,
                        height: mq.height * 0.1,
                        child: Image.asset(
                          'assets/png/icons/student/events.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Text(
                        'Edit News',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.02,
                ),
                const Text(
                  "Maju Highlights",
                  style: TextStyle(
                    color: Color(0xff0D4065),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: const Divider(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: newsTitleController,
                    decoration: const InputDecoration(
                      labelText: 'News title',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: newsContentController,
                    decoration: const InputDecoration(
                      labelText: 'News content',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                SizedBox(
                  width: mq.width * 0.8,
                  child: TextFormField(
                    controller: youtubeLinkController,
                    decoration: const InputDecoration(
                      labelText: 'Youtube link',
                      labelStyle: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.01,
                ),
                Container(
                  height: mq.height * 0.06,
                  width: mq.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Semantics(
                        button: true,
                        child: InkWell(
                          onTap: () {
                            _pickFile((file) => setState(() {
                                  _file = file;
                                }));
                          },
                          child: Container(
                            height: mq.height * 0.06,
                            width: mq.width * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10)),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Center(child: Text("Choose File")),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: _file == null
                                ? const Text("No file selected")
                                : Text(_file!.path.split('/').last),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mq.height * 0.03,
                ),
                SizedBox(
                  height: mq.height * 0.05,
                  width: mq.width * 0.5,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (newsTitleController.text.isEmpty ||
                          newsContentController.text.isEmpty ||
                          youtubeLinkController.text.isEmpty ||
                          _file == null) {
                        MyDialogs.error(
                            msg:
                                "Activity name, date, month and year are required");
                      } else {
                        bool value = await AddNewNewsApi().editNews(
                            widget.news.newsId.toString(),
                            newsTitleController.text,
                            newsContentController.text,
                            youtubeLinkController.text,
                            _file!);
                        if (value) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text(
                                      "News Uploaded",
                                      style: TextStyle(
                                        color: Color(0xff0D4065),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    content: SizedBox(
                                      width: mq.width * 0.2,
                                      child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Get.back(result: true);
                                          },
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  const WidgetStatePropertyAll(
                                                Color(0xff0D4065),
                                              ),
                                              shape: WidgetStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              )),
                                          child: const Text(
                                            "Ok",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    ),
                                  ));
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          const WidgetStatePropertyAll(Color(0xff0D4065)),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
