// To parse this JSON data, do
//
//     final modelFIle = modelFIleFromJson(jsonString);

import 'dart:convert';

ModelFIle modelFIleFromJson(String str) => ModelFIle.fromJson(json.decode(str));

String modelFIleToJson(ModelFIle data) => json.encode(data.toJson());

class ModelFIle {
  ModelFIle({
    this.id,
    this.nickname,
    this.gravatarId,
    this.githubProfile,
    this.twitterProfile,
    this.contributionsCount,
    this.organisations,
    this.link,
    this.pullRequests,
  });

  int? id;
  String? nickname;
  String? gravatarId;
  String? githubProfile;
  dynamic? twitterProfile;
  int? contributionsCount;
  List<Organisation>? organisations;
  String? link;
  List<PullRequest>? pullRequests;

  factory ModelFIle.fromJson(Map<String, dynamic> json) => ModelFIle(
    id: json["id"],
    nickname: json["nickname"],
    gravatarId: json["gravatar_id"],
    githubProfile: json["github_profile"],
    twitterProfile: json["twitter_profile"],
    contributionsCount: json["contributions_count"],
    organisations: List<Organisation>.from(json["organisations"].map((x) => Organisation.fromJson(x))),
    link: json["link"],
    pullRequests: List<PullRequest>.from(json["pull_requests"].map((x) => PullRequest.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nickname": nickname,
    "gravatar_id": gravatarId,
    "github_profile": githubProfile,
    "twitter_profile": twitterProfile,
    "contributions_count": contributionsCount,
    "organisations": List<dynamic>.from(organisations!.map((x) => x.toJson())),
    "link": link,
    "pull_requests": List<dynamic>.from(pullRequests!.map((x) => x.toJson())),
  };
}

class Organisation {
  Organisation({
    this.login,
    this.avatarUrl,
    this.link,
  });

  String? login;
  String? avatarUrl;
  String? link;

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
    login: json["login"],
    avatarUrl: json["avatar_url"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "avatar_url": avatarUrl,
    "link": link,
  };
}

class PullRequest {
  PullRequest({
    this.title,
    this.issueUrl,
    this.repoName,
    this.body,
    this.createdAt,
  });

  String? title;
  String? issueUrl;
  String? repoName;
  String? body;
  String? createdAt;

  factory PullRequest.fromJson(Map<String, dynamic> json) => PullRequest(
    title: json["title"],
    issueUrl: json["issue_url"],
    repoName: json["repo_name"],
    body: json["body"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "issue_url": issueUrl,
    "repo_name": repoName,
    "body": body,
    "created_at": createdAt,
  };
}
