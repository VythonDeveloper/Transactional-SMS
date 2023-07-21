// ----------------------------------------------------------------Final working code

// import 'dart:math';

// void main() {
//   Stopwatch s = Stopwatch();
//   s.start();
//   DateTime now = DateTime.now();
//   List<DateTime> dateMasterList = [];

// //   This one is for other days

//   DateTime end = now.subtract(Duration(days: 180));

//   for (DateTime date = now.subtract(Duration(days: 1));
//       date.isAfter(end);
//       date = date.subtract(Duration(days: 1))) {
//     List<DateTime> otherDaysRandomTimes = [];
//     otherDaysRandomTimes = generateRandomTimesForOtherDays(date, 15);
//     otherDaysRandomTimes.sort();
//     otherDaysRandomTimes = otherDaysRandomTimes.reversed.toList();
//     dateMasterList.addAll(otherDaysRandomTimes);
//   }

//   //    This one is for current day
//   List<DateTime> currentDayRandomTimes = [];
//   currentDayRandomTimes = generateRandomTimesForToday(now);
//   currentDayRandomTimes.sort();
//   currentDayRandomTimes = currentDayRandomTimes.reversed.toList();
//   dateMasterList.insertAll(0, currentDayRandomTimes);

//   for (DateTime time in dateMasterList) {
//     print(time);
//   }
//   print(dateMasterList.length);

//   s.stop();
//   print(s.elapsedMilliseconds);
// }

// List<DateTime> generateRandomTimesForOtherDays(DateTime startDate, int count) {
//   List<DateTime> randomTimes = [];

//   DateTime startTime =
//       DateTime(startDate.year, startDate.month, startDate.day, 6, 0);
//   DateTime endTime =
//       DateTime(startDate.year, startDate.month, startDate.day, 23, 49);

//   Random random = Random();

//   while (randomTimes.length < count) {
//     DateTime newTime = generateRandomTime(startTime, endTime, random);

//     randomTimes.add(newTime);
//   }

//   return randomTimes;
// }

// List<DateTime> generateRandomTimesForToday(DateTime startDate) {
//   List<DateTime> randomTimes = [];

//   DateTime startTime =
//       DateTime(startDate.year, startDate.month, startDate.day, 6, 0);
//   DateTime endTime = startDate;

//   Random random = Random();

//   int counter = 0;
//   while (counter < 15) {
//     counter += 1;
//     DateTime newTime = generateRandomTime(startTime, endTime, random);

//     if (newTime.isAfter(endTime)) {
//       continue;
//     }

//     randomTimes.add(newTime);
//   }

//   return randomTimes;
// }

// DateTime generateRandomTime(
//     DateTime startTime, DateTime endTime, Random random) {
//   int minutes = endTime.difference(startTime).inMinutes;
//   int randomMinutes = random.nextInt(minutes + 1);
//   int randomSecond = 1 + random.nextInt(59 - 1);

//   return startTime.add(Duration(minutes: randomMinutes, seconds: randomSecond));
// }
