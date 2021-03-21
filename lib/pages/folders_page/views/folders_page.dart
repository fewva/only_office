import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:only_office/bloc/folders_bloc.dart';
import 'package:only_office/components/custom_app_bar.dart';
import 'package:only_office/components/file_tile.dart';
import 'package:only_office/components/folder_tile.dart';
import 'package:only_office/models/file.dart';
import 'package:only_office/models/folder.dart';
import 'package:only_office/pages/folders_page/local_blocs/user_info_bloc.dart';
import 'package:only_office/utils/logout.dart';

part 'scaffold_body.dart';
part 'drawer_children.dart';

class FoldersPage extends StatelessWidget {
  const FoldersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoldersBloc, FoldersState>(
      builder: (context, state) => Scaffold(
        appBar: CustomAppBar(foldersState: state),
        drawer: Drawer(child: DrawerChildren()),
        body: ScaffoldBody(foldersState: state),
      ),
    );
  }
}

