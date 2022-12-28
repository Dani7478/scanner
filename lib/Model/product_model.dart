class Product {
  int? id;
  String? branch;
  String? srNumber;
  String? qrNumber;
  String? assetCategory;
  String? assetSubCategory;
  String? assetDescription;
  String? assetQRBarCode;

  Product(
      {this.id,
        this.branch,
        this.srNumber,
        this.qrNumber,
        this.assetCategory,
        this.assetSubCategory,
        this.assetDescription,
        this.assetQRBarCode});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch = json['branch'];
    srNumber = json['srNumber'];
    qrNumber = json['qrNumber'];
    assetCategory = json['assetCategory'];
    assetSubCategory = json['assetSubCategory'];
    assetDescription = json['assetDescription'];
    assetQRBarCode = json['assetQRBarCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch'] = this.branch;
    data['srNumber'] = this.srNumber;
    data['qrNumber'] = this.qrNumber;
    data['assetCategory'] = this.assetCategory;
    data['assetSubCategory'] = this.assetSubCategory;
    data['assetDescription'] = this.assetDescription;
    data['assetQRBarCode'] = this.assetQRBarCode;
    return data;
  }
}