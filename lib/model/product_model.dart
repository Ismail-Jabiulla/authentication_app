
class productModel {
  String? wallpaperName;
  String? wallpaperUrl;
  int? totalViews;

  productModel({required this.wallpaperName, required this.wallpaperUrl,required this.totalViews});

  productModel.fromJson(Map<String, dynamic> json) {
    wallpaperName = json['wallpaperName'];
    wallpaperUrl = json['wallpaperUrl'];
    totalViews = json['totalViews'];

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['wallpaperName'] = this.wallpaperName;
      data['wallpaperUrl'] = this.wallpaperUrl;
      data['totalViews'] = this.totalViews;
      return data;
    }
  }
}