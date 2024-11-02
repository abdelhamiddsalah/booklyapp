import 'package:json_annotation/json_annotation.dart';
part 'books_model.g.dart';

@JsonSerializable()
class booksmodel {
  String? kind;
  int? totalItems;
  List<Items>? items;
  booksmodel({this.kind, this.totalItems, this.items});

   factory booksmodel.fromJson(Map<String, dynamic> json) => _$booksmodelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$booksmodelToJson(this);
}

@JsonSerializable()
class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;
  Items(
      {this.kind,
      this.id,
      this.etag,
      this.selfLink,
      this.volumeInfo,
      this.saleInfo,
      this.accessInfo,
      this.searchInfo});

      factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
@JsonSerializable()
class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? subtitle;
  VolumeInfo(
      {this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingModes,
      this.pageCount,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.panelizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.subtitle});

      factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}
@JsonSerializable()
class IndustryIdentifiers {
  String? type;
  String? identifier;
  IndustryIdentifiers({this.type, this.identifier});

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) => _$IndustryIdentifiersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$IndustryIdentifiersToJson(this);
}
@JsonSerializable()
class ReadingModes {
  bool? text;
  bool? image;
  ReadingModes({this.text, this.image});

  factory ReadingModes.fromJson(Map<String, dynamic> json) => _$ReadingModesFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ReadingModesToJson(this);
}
@JsonSerializable()
class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;
  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});
  factory PanelizationSummary.fromJson(Map<String, dynamic> json) => _$PanelizationSummaryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PanelizationSummaryToJson(this);
}
@JsonSerializable()
class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;
  ImageLinks({this.smallThumbnail, this.thumbnail});
  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}
@JsonSerializable()
class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  String? buyLink;
  List<Offers>? offers;
  SaleInfo(
      {this.country,
      this.saleability,
      this.isEbook,
      this.listPrice,
      this.retailPrice,
      this.buyLink,
      this.offers});

      factory SaleInfo.fromJson(Map<String, dynamic> json) => _$SaleInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SaleInfoToJson(this);
}
@JsonSerializable()
class ListPrice {
  double? amount;
  String? currencyCode;
  ListPrice({this.amount, this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => _$ListPriceFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ListPriceToJson(this);
}
@JsonSerializable()
class Offers {
  int? finskyOfferType;
  ListPrice? listPrice;
  ListPrice? retailPrice;
  Offers({this.finskyOfferType, this.listPrice, this.retailPrice});

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$OffersToJson(this);
}

@JsonSerializable()
class ListPrice2 {
  int? amountInMicros;
  String? currencyCode;
  ListPrice2({this.amountInMicros, this.currencyCode});
  factory ListPrice2.fromJson(Map<String, dynamic> json) => _$ListPrice2FromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ListPrice2ToJson(this);
}
@JsonSerializable()
class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;
  String? textToSpeechPermission;
  Epub? epub;
  Epub? pdf;
  String? webReaderLink;
  String? accessViewStatus;
  bool? quoteSharingAllowed;
  AccessInfo(
      {this.country,
      this.viewability,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed});
      factory AccessInfo.fromJson(Map<String, dynamic> json) => _$AccessInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccessInfoToJson(this);
}
@JsonSerializable()
class Epub {
  bool? isAvailable;
  String? acsTokenLink;
  Epub({this.isAvailable, this.acsTokenLink});
   factory Epub.fromJson(Map<String, dynamic> json) => _$EpubFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$EpubToJson(this);
}
@JsonSerializable()
class SearchInfo {
  String? textSnippet;
  SearchInfo({this.textSnippet});
   factory SearchInfo.fromJson(Map<String, dynamic> json) => _$SearchInfoFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SearchInfoToJson(this);
}