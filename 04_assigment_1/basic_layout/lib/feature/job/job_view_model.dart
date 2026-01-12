import 'package:basic_layout/feature/job/job.dart';

class JobViewModel {
  Future<Job> getMyJob({required int minimumMoney}) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    final Job danalJob = Job(jobName: 'DANAL', money: 100000000);
    final Job smallJob = Job(jobName: 'small', money: 10000);

    if (minimumMoney > danalJob.money) {
      return danalJob;
    } else {
      return smallJob;
    }
  }
}
