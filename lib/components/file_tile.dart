import 'package:flutter/material.dart';
import 'package:only_office/components/only_office_icons.dart';
import 'package:only_office/models/file.dart';

class FileTile extends StatelessWidget {

  final File file;
  const FileTile({
    Key key,
    this.file
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: OnlyIcon(icon: _getFileIcon(file.title), height: 34),
        title: Text(
          file.title,
          style: TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}

String _getFileIcon(String fileTitle){

  if (fileTitle.endsWith('.docx')) {
    return OnlyIcons.docx;
  }
  if (fileTitle.endsWith('.mp4')) {
    return OnlyIcons.mp4;
  }
  if (fileTitle.endsWith('.pptx')) {
    return OnlyIcons.pptx;
  }
  if (fileTitle.endsWith('.xls')) {
    return OnlyIcons.xlsx;
  }
  if (fileTitle.endsWith('.xlsx')) {
    return OnlyIcons.xlsx;
  } else {
    return OnlyIcons.file;
  }

}
