// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.code,
    this.data,
    this.success,
  });

  int code;
  Data data;
  bool success;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    code: json["code"],
    data: Data.fromJson(json["data"]),
    success: json["success"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "data": data.toJson(),
    "success": success,
  };
}

class Data {
  Data({
    this.cursor,
    this.tournamentCount,
    this.tournaments,
    this.isLastBatch,
  });

  String cursor;
  dynamic tournamentCount;
  List<Tournament> tournaments;
  bool isLastBatch;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    cursor: json["cursor"],
    tournamentCount: json["tournament_count"],
    tournaments: List<Tournament>.from(json["tournaments"].map((x) => Tournament.fromJson(x))),
    isLastBatch: json["is_last_batch"],
  );

  Map<String, dynamic> toJson() => {
    "cursor": cursor,
    "tournament_count": tournamentCount,
    "tournaments": List<dynamic>.from(tournaments.map((x) => x.toJson())),
    "is_last_batch": isLastBatch,
  };
}

class Tournament {
  Tournament({
    this.isCheckInRequired,
    this.tournamentId,
    this.tournamentEnded,
    this.tournamentEndDate,
    this.areRandomTeamsAllowed,
    this.registeredTeams,
    this.adminLocale,
    this.regEndDate,
    this.startDate,
    this.rules,
    this.maxTeams,
    this.tournamentUrl,
    this.prizes,
    this.matchStyleType,
    this.pwaUrl,
    this.tournamentType,
    this.geo,
    this.maxLevelId,
    this.isPasswordRequired,
    this.name,
    this.matchStyle,
    this.registrationUrl,
    this.gamePkg,
    this.isRegistrationOpen,
    this.isWaitlistEnabled,
    this.incompleteTeamsAllowed,
    this.isAutoResultAllowed,
    this.teamSize,
    this.status,
    this.isLevelsEnabled,
    this.indexPage,
    this.dynamicAppUrl,
    this.minLevelId,
    this.gameFormat,
    this.details,
    this.gameIconUrl,
    this.regStartDate,
    this.coverUrl,
    this.bracketsUrl,
    this.tournamentSlug,
    this.discordUrl,
    this.gameId,
    this.resultSubmissionByAdmin,
    this.country,
    this.adminUsername,
    this.gameName,
    this.streamUrl,
    this.winnersCount,
  });

  bool isCheckInRequired;
  String tournamentId;
  bool tournamentEnded;
  String tournamentEndDate;
  bool areRandomTeamsAllowed;
  int registeredTeams;
  String adminLocale;
  String regEndDate;
  String startDate;
  String rules;
  int maxTeams;
  String tournamentUrl;
  String prizes;
  MatchStyleType matchStyleType;
  String pwaUrl;
  TournamentType tournamentType;
  String geo;
  dynamic maxLevelId;
  bool isPasswordRequired;
  String name;
  MatchStyle matchStyle;
  String registrationUrl;
  dynamic gamePkg;
  bool isRegistrationOpen;
  bool isWaitlistEnabled;
  bool incompleteTeamsAllowed;
  bool isAutoResultAllowed;
  int teamSize;
  Status status;
  bool isLevelsEnabled;
  bool indexPage;
  String dynamicAppUrl;
  dynamic minLevelId;
  String gameFormat;
  String details;
  String gameIconUrl;
  String regStartDate;
  String coverUrl;
  dynamic bracketsUrl;
  String tournamentSlug;
  String discordUrl;
  String gameId;
  bool resultSubmissionByAdmin;
  String country;
  String adminUsername;
  String gameName;
  String streamUrl;
  int winnersCount;

  factory Tournament.fromJson(Map<String, dynamic> json) => Tournament(
    isCheckInRequired: json["is_check_in_required"],
    tournamentId: json["tournament_id"],
    tournamentEnded: json["tournament_ended"],
    tournamentEndDate: json["tournament_end_date"],
    areRandomTeamsAllowed: json["are_random_teams_allowed"],
    registeredTeams: json["registered_teams"],
    adminLocale: json["admin_locale"],
    regEndDate: json["reg_end_date"],
    startDate: json["start_date"],
    rules: json["rules"],
    maxTeams: json["max_teams"],
    tournamentUrl: json["tournament_url"],
    prizes: json["prizes"],
    matchStyleType: matchStyleTypeValues.map[json["match_style_type"]],
    pwaUrl: json["pwa_url"] == null ? null : json["pwa_url"],
    tournamentType: tournamentTypeValues.map[json["tournament_type"]],
    geo: json["geo"],
    maxLevelId: json["max_level_id"],
    isPasswordRequired: json["is_password_required"],
    name: json["name"],
    matchStyle: matchStyleValues.map[json["match_style"]],
    registrationUrl: json["registration_url"],
    gamePkg: json["game_pkg"],
    isRegistrationOpen: json["is_registration_open"],
    isWaitlistEnabled: json["is_waitlist_enabled"],
    incompleteTeamsAllowed: json["incomplete_teams_allowed"],
    isAutoResultAllowed: json["is_auto_result_allowed"],
    teamSize: json["team_size"],
    status: statusValues.map[json["status"]],
    isLevelsEnabled: json["is_levels_enabled"],
    indexPage: json["index_page"],
    dynamicAppUrl: json["dynamic_app_url"],
    minLevelId: json["min_level_id"],
    gameFormat: json["game_format"],
    details: json["details"],
    gameIconUrl: json["game_icon_url"],
    regStartDate: json["reg_start_date"],
    coverUrl: json["cover_url"],
    bracketsUrl: json["brackets_url"],
    tournamentSlug: json["tournament_slug"],
    discordUrl: json["discord_url"],
    gameId: json["game_id"],
    resultSubmissionByAdmin: json["result_submission_by_admin"],
    country: json["country"],
    adminUsername: json["admin_username"],
    gameName: json["game_name"],
    streamUrl: json["stream_url"],
    winnersCount: json["winners_count"] == null ? null : json["winners_count"],
  );

  Map<String, dynamic> toJson() => {
    "is_check_in_required": isCheckInRequired,
    "tournament_id": tournamentId,
    "tournament_ended": tournamentEnded,
    "tournament_end_date": tournamentEndDate,
    "are_random_teams_allowed": areRandomTeamsAllowed,
    "registered_teams": registeredTeams,
    "admin_locale": adminLocale,
    "reg_end_date": regEndDate,
    "start_date": startDate,
    "rules": rules,
    "max_teams": maxTeams,
    "tournament_url": tournamentUrl,
    "prizes": prizes,
    "match_style_type": matchStyleTypeValues.reverse[matchStyleType],
    "pwa_url": pwaUrl == null ? null : pwaUrl,
    "tournament_type": tournamentTypeValues.reverse[tournamentType],
    "geo": geo,
    "max_level_id": maxLevelId,
    "is_password_required": isPasswordRequired,
    "name": name,
    "match_style": matchStyleValues.reverse[matchStyle],
    "registration_url": registrationUrl,
    "game_pkg": gamePkg,
    "is_registration_open": isRegistrationOpen,
    "is_waitlist_enabled": isWaitlistEnabled,
    "incomplete_teams_allowed": incompleteTeamsAllowed,
    "is_auto_result_allowed": isAutoResultAllowed,
    "team_size": teamSize,
    "status": statusValues.reverse[status],
    "is_levels_enabled": isLevelsEnabled,
    "index_page": indexPage,
    "dynamic_app_url": dynamicAppUrl,
    "min_level_id": minLevelId,
    "game_format": gameFormat,
    "details": details,
    "game_icon_url": gameIconUrl,
    "reg_start_date": regStartDate,
    "cover_url": coverUrl,
    "brackets_url": bracketsUrl,
    "tournament_slug": tournamentSlug,
    "discord_url": discordUrl,
    "game_id": gameId,
    "result_submission_by_admin": resultSubmissionByAdmin,
    "country": country,
    "admin_username": adminUsername,
    "game_name": gameName,
    "stream_url": streamUrl,
    "winners_count": winnersCount == null ? null : winnersCount,
  };
}

enum MatchStyle { LOBBY, BRACKETS }

final matchStyleValues = EnumValues({
  "brackets": MatchStyle.BRACKETS,
  "lobby": MatchStyle.LOBBY
});

enum MatchStyleType { SINGLE_LOBBY, ELIMINATION, SINGLE_ELIMINATION }

final matchStyleTypeValues = EnumValues({
  "elimination": MatchStyleType.ELIMINATION,
  "single_elimination": MatchStyleType.SINGLE_ELIMINATION,
  "single_lobby": MatchStyleType.SINGLE_LOBBY
});

enum Status { PUBLISHED }

final statusValues = EnumValues({
  "published": Status.PUBLISHED
});

enum TournamentType { DISCORD, WEB }

final tournamentTypeValues = EnumValues({
  "discord": TournamentType.DISCORD,
  "web": TournamentType.WEB
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
