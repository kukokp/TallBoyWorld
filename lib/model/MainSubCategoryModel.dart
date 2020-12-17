class MainSubCategoryModel {
  int catId;
  int catParentId;
  String catName;
  String catImageURL;
  String catDescription;

  MainSubCategoryModel(
      { this.catId,
       this.catParentId,
       this.catName,
        this.catImageURL,
        this.catDescription});

  MainSubCategoryModel.fromJson(Map<String, dynamic> json) {
    catId = json['id'];
    catParentId = json['albumId'];
    catName = json['title'];
    catImageURL = json['thumbnailUrl'];
    catDescription = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.catId;
    data['albumId'] = this.catParentId;
    data['title'] = this.catName;
    data['thumbnailUrl'] = this.catImageURL;
    data['url'] = this.catDescription;
    return data;
  }
}
