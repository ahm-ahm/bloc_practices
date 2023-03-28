
class Day {
  final DateTime datetime;
  final String title;
  final bool isChecked;

  Day(this.datetime, this.title, this.isChecked);

  Day.initial(DateTime dateTime, String title) : this(dateTime, title, false);

  Day copyWith(bool isChecked) => Day(datetime, title, isChecked);
  @override
  String toString() {
    // TODO: implement toString
    return 'dateTime:$datetime title:$title isChecked:$isChecked';
  }
}
