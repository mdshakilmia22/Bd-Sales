class NudusModel{
  String ? title;
  dynamic price;
  String ? description;
  String ? pictureUrl;
  dynamic weight;
  NudusModel({this.title, this.description, this.pictureUrl, this.weight,this.price});

  NudusModel.fromJson(dynamic json){
    title= json['productTitle'];
    price =json['productPrice'];
    description=json['productDescription'];
    pictureUrl=json['pictureUrl'];
    weight=json['productWeight'];
  }
  Map<String, dynamic> toJson(){
    final map=<String, dynamic>{};
    map['productTitle'] =title;
    map['productDescription']=description;
    map['productWeight']=weight;
    map['productPrice']=price;
    map['pictureUrl']=pictureUrl;
    return map;
  }
}
