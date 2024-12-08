
class HomeSliderModel {
  String docid;
  String imageurl;

  HomeSliderModel({
    required this.docid,
    required this.imageurl,

  });

  HomeSliderModel copyWith({
    String? docid,
    String ?imageurl,

  }) {
    return HomeSliderModel(
      docid: docid??this.docid,
      imageurl: imageurl??this.imageurl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageurl':imageurl,
      'docid':docid,
    };
  }

  factory HomeSliderModel.fromMap(Map<String, dynamic> map) {
    return HomeSliderModel(
      imageurl: map['imageurl']??'',
      docid: map['docid']??[],


    );
  }
}
