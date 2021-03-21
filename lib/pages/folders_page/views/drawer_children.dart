part of 'folders_page.dart';

class DrawerChildren extends StatelessWidget {
  const DrawerChildren({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoBloc(),
      child: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {

          if (state is UserInfoInitial) {
            WidgetsBinding.instance.addPostFrameCallback((_){
              BlocProvider.of<UserInfoBloc>(context).add(GetUserInfoEvent());
            });
          }

          if (state is UserInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is UserInfoLoadingError) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.error.toString()),
                  _LogoutButton()
                ],
              ),
            );
          }

          if (state is UserInfoLoadingCompleted) {
            return Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  accountEmail: Text(state.user.email),
                  // accountName: Text(state.user.userName),
                  accountName: Text(state.user.displayName),
                  currentAccountPicture: CachedNetworkImage(imageUrl: state.user.avatar),
                ),
                ListTile(
                  leading: Icon(
                    Icons.folder_rounded, 
                    color: BlocProvider.of<FoldersBloc>(context).getCurrentStorage == 'My documents'
                      ? Colors.blue
                      : Colors.grey,
                  ),
                  title: Text('My documents'),
                  onTap: () {
                    BlocProvider.of<FoldersBloc>(context).add(GetMyDocumentsEvent());
                    BlocProvider.of<FoldersBloc>(context).setCurrentStorage = 'My documents';
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.folder_rounded, 
                    color: BlocProvider.of<FoldersBloc>(context).getCurrentStorage == 'Common documents'
                      ? Colors.blue
                      : Colors.grey,
                  ),
                  title: Text('Common documents'),
                  onTap: () {
                    BlocProvider.of<FoldersBloc>(context).add(GetCommonDocumentsEvent());
                    BlocProvider.of<FoldersBloc>(context).setCurrentStorage = 'Common documents';
                    Navigator.pop(context);
                  }
                ),
                _LogoutButton()
              ],
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Center(child: Text('DUNNO WHAT IS IT')),
          );

        },
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      onPressed: () async {
        await logout(context);
        await Navigator.pushReplacementNamed(context, '/Home');
      }, 
      child: const Text('Logout')
    );
  }
}