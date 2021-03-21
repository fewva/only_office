class Folder {
    Folder({
        this.parentId,
        this.filesCount,
        this.foldersCount,
        this.isShareable,
        this.id,
        this.title,
        this.access,
        this.shared,
        this.rootFolderType,
        this.created,
        this.updated,
    });

    final int parentId;
    final int filesCount;
    final int foldersCount;
    final bool isShareable;
    final int id;
    final String title;
    final int access;
    final bool shared;
    final int rootFolderType;
    final DateTime created;
    final DateTime updated;

    factory Folder.fromJson(Map<String, dynamic> json) => Folder(
        parentId: json['parentId'],
        filesCount: json['filesCount'],
        foldersCount: json['foldersCount'],
        isShareable: json['isShareable'],
        id: json['id'],
        title: json['title'],
        access: json['access'],
        shared: json['shared'],
        rootFolderType: json['rootFolderType'],
        created: DateTime.parse(json['created']),
        updated: DateTime.parse(json['updated']),
    );

    Map<String, dynamic> toJson() => {
        'parentId': parentId,
        'filesCount': filesCount,
        'foldersCount': foldersCount,
        'isShareable': isShareable,
        'id': id,
        'title': title,
        'access': access,
        'shared': shared,
        'rootFolderType': rootFolderType,
        'created': created.toIso8601String(),
        'updated': updated.toIso8601String(),
    };
}