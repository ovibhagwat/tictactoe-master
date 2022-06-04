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
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Row(
            //   children: [
            //     Container(
            //       child:()
            //     ),
            //     Container(),
            //   ],
            // ),
            Container(
              child: Center(
                  child: Text(
                "Impossible",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: kColorStorm),
              )),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Center(
                  child: Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: kColorStorm),
                  )),
            ),
            SizedBox(
              height: 150,
            ),
            SizedBox(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.routeToGameView();
                },
                style: ElevatedButton.styleFrom(
                  primary: kColorBlue,
                ),
                child: Text(
                  "PLAY",
                  style: TextStyle(color: kColorLinen, fontSize: 20, ),
                ),
              ),
            ),

          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
