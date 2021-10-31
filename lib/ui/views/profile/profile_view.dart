import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'profile_view_model.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(title: const Text('Profile')),
          body: const Center(
            child: Text('Profile View'),
          ),
        );
      },
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
