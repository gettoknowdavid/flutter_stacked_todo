import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'stats_view_model.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StatsViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Stats')),
          body: const Center(
            child: Text('Stats View'),
          ),
        );
      },
      viewModelBuilder: () => StatsViewModel(),
    );
  }
}
