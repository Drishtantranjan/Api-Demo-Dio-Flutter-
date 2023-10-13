import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<Result> result;

  Welcome({
    required this.result,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  List<String> bodyValue;
  List<String> bodyValueOriginal;
  List<String> city;
  int created;
  String feedShareText;
  List<String> fieldCategoryValue;
  List<String> fieldLocalNewsSubjectValue;
  String fieldSourceLanguage;
  List<dynamic> fieldYouTubeVideoLinkInput;
  List<dynamic>? imageFids;
  int nid;
  String nodeCreationTimeAgoFormat;
  String nodeType;
  bool status;
  String title;
  int uid;
  int updated;
  List<String> videoDownloadUrl;
  List<int> videoFid;
  List<String> videoThumbnailUrl;
  List<String> videoUrl;
  List<dynamic> youTubeVideoThumbnailUrl;
  List<String>? imageUrl;

  Result({
    required this.bodyValue,
    required this.bodyValueOriginal,
    required this.city,
    required this.created,
    required this.feedShareText,
    required this.fieldCategoryValue,
    required this.fieldLocalNewsSubjectValue,
    required this.fieldSourceLanguage,
    required this.fieldYouTubeVideoLinkInput,
    this.imageFids,
    required this.nid,
    required this.nodeCreationTimeAgoFormat,
    required this.nodeType,
    required this.status,
    required this.title,
    required this.uid,
    required this.updated,
    required this.videoDownloadUrl,
    required this.videoFid,
    required this.videoThumbnailUrl,
    required this.videoUrl,
    required this.youTubeVideoThumbnailUrl,
    this.imageUrl,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        bodyValue: List<String>.from(json["body_value"].map((x) => x)),
        bodyValueOriginal:
            List<String>.from(json["body_value_original"].map((x) => x)),
        city: List<String>.from(json["city"].map((x) => x)),
        created: json["created"],
        feedShareText: json["feed_share_text"],
        fieldCategoryValue:
            List<String>.from(json["field_category_value"].map((x) => x)),
        fieldLocalNewsSubjectValue: List<String>.from(
            json["field_local_news_subject_value"].map((x) => x)),
        fieldSourceLanguage: json["field_source_language"],
        fieldYouTubeVideoLinkInput: List<dynamic>.from(
            json["field_you_tube_video_link_input"].map((x) => x)),
        imageFids: json["image_fids"] == null
            ? []
            : List<dynamic>.from(json["image_fids"]!.map((x) => x)),
        nid: json["nid"],
        nodeCreationTimeAgoFormat: json["node_creation_time_ago_format"],
        nodeType: json["node_type"],
        status: json["status"],
        title: json["title"],
        uid: json["uid"],
        updated: json["updated"],
        videoDownloadUrl:
            List<String>.from(json["video_download_url"].map((x) => x)),
        videoFid: List<int>.from(json["video_fid"].map((x) => x)),
        videoThumbnailUrl:
            List<String>.from(json["video_thumbnail_url"].map((x) => x)),
        videoUrl: List<String>.from(json["video_url"].map((x) => x)),
        youTubeVideoThumbnailUrl: List<dynamic>.from(
            json["you_tube_video_thumbnail_url"].map((x) => x)),
        imageUrl: json["image_url"] == null
            ? []
            : List<String>.from(json["image_url"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "body_value": List<dynamic>.from(bodyValue.map((x) => x)),
        "body_value_original":
            List<dynamic>.from(bodyValueOriginal.map((x) => x)),
        "city": List<dynamic>.from(city.map((x) => x)),
        "created": created,
        "feed_share_text": feedShareText,
        "field_category_value":
            List<dynamic>.from(fieldCategoryValue.map((x) => x)),
        "field_local_news_subject_value":
            List<dynamic>.from(fieldLocalNewsSubjectValue.map((x) => x)),
        "field_source_language": fieldSourceLanguage,
        "field_you_tube_video_link_input":
            List<dynamic>.from(fieldYouTubeVideoLinkInput.map((x) => x)),
        "image_fids": imageFids == null
            ? []
            : List<dynamic>.from(imageFids!.map((x) => x)),
        "nid": nid,
        "node_creation_time_ago_format": nodeCreationTimeAgoFormat,
        "node_type": nodeType,
        "status": status,
        "title": title,
        "uid": uid,
        "updated": updated,
        "video_download_url":
            List<dynamic>.from(videoDownloadUrl.map((x) => x)),
        "video_fid": List<dynamic>.from(videoFid.map((x) => x)),
        "video_thumbnail_url":
            List<dynamic>.from(videoThumbnailUrl.map((x) => x)),
        "video_url": List<dynamic>.from(videoUrl.map((x) => x)),
        "you_tube_video_thumbnail_url":
            List<dynamic>.from(youTubeVideoThumbnailUrl.map((x) => x)),
        "image_url":
            imageUrl == null ? [] : List<dynamic>.from(imageUrl!.map((x) => x)),
      };
}
