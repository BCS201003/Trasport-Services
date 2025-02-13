enum Day {
  sunday(1),

  monday(2),

  tuesday(3),

  wednesday(4),

  thursday(5),

  friday(6),

  saturday(7);

  const Day(this.value);

  final int value;
}

enum DateTimeComponents {
  time,

  dayOfWeekAndTime,

  dayOfMonthAndTime,

  dateAndTime,
}
