class File  {
    File({
        this.folderId,
        this.version,
        this.versionGroup,
        this.contentLength,
        this.pureContentLength,
        this.fileStatus,
        this.viewUrl,
        this.webUrl,
        this.fileType,
        this.fileExst,
        this.comment,
        this.thumbnailUrl,
        this.id,
        this.title,
        this.access,
        this.shared,
        this.rootFolderType,
        this.created,
        this.updated,
    });

    final int folderId;
    final int version;
    final int versionGroup;
    final String contentLength;
    final int pureContentLength;
    final int fileStatus;
    final String viewUrl;
    final String webUrl;
    final int fileType;
    final String fileExst;
    final String comment;
    final String thumbnailUrl;
    final int id;
    final String title;
    final int access;
    final bool shared;
    final int rootFolderType;
    final DateTime created;
    final DateTime updated;

    factory File.fromJson(Map<String, dynamic> json) => File(
        folderId: json['folderId'],
        version: json['version'],
        versionGroup: json['versionGroup'],
        contentLength: json['contentLength'],
        pureContentLength: json['pureContentLength'],
        fileStatus: json['fileStatus'],
        viewUrl: json['viewUrl'],
        webUrl: json['webUrl'],
        fileType: json['fileType'],
        fileExst: json['fileExst'],
        comment: json['comment'],
        thumbnailUrl: json['thumbnailUrl'],
        id: json['id'],
        title: json['title'],
        access: json['access'],
        shared: json['shared'],
        rootFolderType: json['rootFolderType'],
        created: DateTime.parse(json['created']),
        updated: DateTime.parse(json['updated']),
    );

    Map<String, dynamic> toJson() => {
        'folderId': folderId,
        'version': version,
        'versionGroup': versionGroup,
        'contentLength': contentLength,
        'pureContentLength': pureContentLength,
        'fileStatus': fileStatus,
        'viewUrl': viewUrl,
        'webUrl': webUrl,
        'fileType': fileType,
        'fileExst': fileExst,
        'comment': comment,
        'thumbnailUrl': thumbnailUrl,
        'id': id,
        'title': title,
        'access': access,
        'shared': shared,
        'rootFolderType': rootFolderType,
        'created': created.toIso8601String(),
        'updated': updated.toIso8601String(),
    };
}