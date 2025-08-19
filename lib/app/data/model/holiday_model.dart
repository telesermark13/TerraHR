/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class Holiday {
  int? id;
  String? holidaydate;
  String? holidayname;
  String? month;
  String? year;
  String? createdat;
  String? updatedat;

  Holiday(
      {this.id,
      this.holidaydate,
      this.holidayname,
      this.month,
      this.year,
      this.createdat,
      this.updatedat});

  Holiday.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holidaydate = json['holiday_date'];
    holidayname = json['holiday_name'];
    month = json['month'];
    year = json['year'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['holiday_date'] = holidaydate;
    data['holiday_name'] = holidayname;
    data['month'] = month;
    data['year'] = year;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class HolidayRoot {
  bool? success;
  int? statuscode;
  List<Holiday?>? data;
  String? message;

  HolidayRoot({this.success, this.statuscode, this.data, this.message});

  HolidayRoot.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statuscode = json['status_code'];
    data = (json['data'] as List?)
        ?.map((v) => Holiday.fromJson(v as Map<String, dynamic>))
        .toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['status_code'] = statuscode;
    data['data'] = this.data?.map((v) => v?.toJson()).toList();
    data['message'] = message;
    return data;
  }
}
