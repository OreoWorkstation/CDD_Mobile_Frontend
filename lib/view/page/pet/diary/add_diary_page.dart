import 'package:cdd_mobile_frontend/utils/format_date.dart';
import 'package:cdd_mobile_frontend/view_model/diary_view_model.dart';
import 'package:cdd_mobile_frontend/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDiaryPage extends StatelessWidget {
  final petIndex;
  final petId;
  const AddDiaryPage({Key key, this.petIndex, this.petId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _titleController = TextEditingController();
    final _contentController = TextEditingController();
    return Consumer2<DiaryViewModel, UserViewModel>(
      builder: (context, diaryVM, userVM, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green[400],
            title: Text(FormatDate.getTimeInYMD(DateTime.now())),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(Icons.backspace),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () async {
                  print(_titleController.text);
                  print(_contentController.text);
                  var val = await diaryVM.addDiary(
                      petId, _titleController.text, _contentController.text);
                  if (val == true) {
                    await userVM.changeDiaryNumber(petIndex, 1);
                    Navigator.of(context).pop();
                  }
                },
                icon: Icon(Icons.save),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(hintText: "输入日记标题..."),
                  ),
                  TextField(
                    controller: _contentController,
                    maxLines: null,
                    decoration:
                        InputDecoration.collapsed(hintText: "输入日记内容..."),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
