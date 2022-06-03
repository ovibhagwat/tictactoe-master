import 'package:flutter/material.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:skyline_template_app/viewmodels/home_viewmodel.dart';
import 'package:skyline_template_app/locator.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      disposeViewModel: false,
      viewModelBuilder: () => locator<HomeViewModel>(),
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: Colors.grey,
        body: Column(
          children: [
            Container(
              child: Center(
                  child: Text(
                "Impossible Tic Tac Toe",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Image.asset('assets/playButton.png'),
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.routeToGameView();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black54,
              ),
              child: Text(
                "Play",
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
