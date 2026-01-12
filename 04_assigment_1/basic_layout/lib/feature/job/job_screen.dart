import 'package:basic_layout/feature/job/job.dart';
import 'package:basic_layout/feature/job/job_view_model.dart';
import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  const JobScreen({
    super.key,
    required this.viewModel,
  });
  // 메모리에 올라갔다 내려갔다 할 필요없어서 빌드 밖에 선언함

  final JobViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Job>(
          future: viewModel.getMyJob(minimumMoney: 1000),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('error: ${snapshot.error}');
            }

            return Text('MY JOB : ${snapshot.data?.jobName ?? 'NULL'}');
          },
        ),
      ),
    );
  }
}
