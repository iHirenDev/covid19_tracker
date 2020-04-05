
import 'dart:convert';

CovidModel covidFromJson(String str) => CovidModel.fromJson(json.decode(str));

String covidToJson(CovidModel data) => json.encode(data.toJson());

class CovidModel {
    String covidGet;
    List<dynamic> parameters;
    List<dynamic> errors;
    int results;
    List<Response> response;

    CovidModel({
        this.covidGet,
        this.parameters,
        this.errors,
        this.results,
        this.response,
    });

    factory CovidModel.fromJson(Map<String, dynamic> json) => CovidModel(
        covidGet: json["get"],
        parameters: List<dynamic>.from(json["parameters"].map((x) => x)),
        errors: List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"],
        response: List<Response>.from(json["response"].map((x) => Response.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "get": covidGet,
        "parameters": List<dynamic>.from(parameters.map((x) => x)),
        "errors": List<dynamic>.from(errors.map((x) => x)),
        "results": results,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
    };
}

class Response {
    String country;
    Cases cases;
    Deaths deaths;
    DateTime day;
    DateTime time;

    Response({
        this.country,
        this.cases,
        this.deaths,
        this.day,
        this.time,
    });

    factory Response.fromJson(Map<String, dynamic> json) => Response(
        country: json["country"],
        cases: Cases.fromJson(json["cases"]),
        deaths: Deaths.fromJson(json["deaths"]),
        day: DateTime.parse(json["day"]),
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "cases": cases.toJson(),
        "deaths": deaths.toJson(),
        "day": "${day.year.toString().padLeft(4, '0')}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}",
        "time": time.toIso8601String(),
    };
}

class Cases {
    String casesNew;
    int active;
    int critical;
    int recovered;
    int total;

    Cases({
        this.casesNew,
        this.active,
        this.critical,
        this.recovered,
        this.total,
    });

    factory Cases.fromJson(Map<String, dynamic> json) => Cases(
        casesNew: json["new"] == null ? null : json["new"],
        active: json["active"],
        critical: json["critical"],
        recovered: json["recovered"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "new": casesNew == null ? null : casesNew,
        "active": active,
        "critical": critical,
        "recovered": recovered,
        "total": total,
    };
}

class Deaths {
    String deathsNew;
    int total;

    Deaths({
        this.deathsNew,
        this.total,
    });

    factory Deaths.fromJson(Map<String, dynamic> json) => Deaths(
        deathsNew: json["new"] == null ? null : json["new"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "new": deathsNew == null ? null : deathsNew,
        "total": total,
    };
}