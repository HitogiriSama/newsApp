class Article {
  String? id;
  String? catId;
  String? title;
  String? content;
  String? subTitle;
  String? alternativeHeadline;
  String? author;
  String? active;
  String? datePosted;
  String? dateEdited;
  String? views;
  String? tags;
  String? editorspick;
  String? mainpagearticle;
  String? headlinePost;
  String? filename;
  String? wideScreen;
  String? nsfw;
  String? photocredit;
  String? url;
  String? name;
  String? publisherFilename;
  String? publishername;
  String? address;
  String? profile;

  Article(
      {this.id,
        this.catId,
        this.title,
        this.content,
        this.subTitle,
        this.alternativeHeadline,
        this.author,
        this.active,
        this.datePosted,
        this.dateEdited,
        this.views,
        this.tags,
        this.editorspick,
        this.mainpagearticle,
        this.headlinePost,
        this.filename,
        this.wideScreen,
        this.nsfw,
        this.photocredit,
        this.url,
        this.name,
        this.publisherFilename,
        this.publishername,
        this.address,
        this.profile});

  Article.fromJson(Map<String, dynamic> json) {
    this.id = json["ID"];
    this.catId = json["CatID"];
    this.title = json["Title"];
    this.content = json["Content"];
    this.subTitle = json["SubTitle"];
    this.alternativeHeadline = json["alternativeHeadline"];
    this.author = json["Author"];
    this.active = json["Active"];
    this.datePosted = json["DatePosted"];
    this.dateEdited = json["DateEdited"];
    this.views = json["Views"];
    this.tags = json["tags"];
    this.editorspick = json["editorspick"];
    this.mainpagearticle = json["mainpagearticle"];
    this.headlinePost = json["headlinePost"];
    this.filename = json["filename"];
    this.wideScreen = json["wide_screen"];
    this.nsfw = json["nsfw"];
    this.photocredit = json["photocredit"];
    this.url = json["url"];
    this.name = json["Name"];
    this.publisherFilename = json["publisher_filename"];
    this.publishername = json["name"];
    this.address = json["address"];
    this.profile = json["profile"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["ID"] = this.id;
    data["CatID"] = this.catId;
    data["Title"] = this.title;
    data["Content"] = this.content;
    data["SubTitle"] = this.subTitle;
    data["alternativeHeadline"] = this.alternativeHeadline;
    data["Author"] = this.author;
    data["Active"] = this.active;
    data["DatePosted"] = this.datePosted;
    data["DateEdited"] = this.dateEdited;
    data["Views"] = this.views;
    data["tags"] = this.tags;
    data["editorspick"] = this.editorspick;
    data["mainpagearticle"] = this.mainpagearticle;
    data["headlinePost"] = this.headlinePost;
    data["filename"] = this.filename;
    data["wide_screen"] = this.wideScreen;
    data["nsfw"] = this.nsfw;
    data["photocredit"] = this.photocredit;
    data["url"] = this.url;
    data["Name"] = this.name;
    data["publisher_filename"] = this.publisherFilename;
    data["name"] = this.publishername;
    data["address"] = this.address;
    data["profile"] = this.profile;
    return data;
  }
}