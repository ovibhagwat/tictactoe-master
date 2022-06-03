import 'package:flutter/material.dart';
import 'package:skyline_template_app/viewmodels/game_viewmodel.dart';
import 'package:skyline_template_app/core/utilities/constants.dart';
import 'package:stacked/stacked.dart';
import 'package:skyline_template_app/locator.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GameViewModel>.reactive(
      viewModelBuilder: () => locator<GameViewModel>(),
      disposeViewModel: false,
      onModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) => Scaffold(
        backgroundColor: kColorStorm,
        body: Column(
          children: [
            Container(
              child: Center(
                  child: Text(
                "Game Page",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: kColorLinen),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Image.asset('assets/TTTBoard.png'),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                viewModel.routeToHomeView();
              },
              style: ElevatedButton.styleFrom(primary: kColorLinen),
              child: Text('Return to HomeView',
                  style: TextStyle(color: kColorStorm)),
            ),
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
