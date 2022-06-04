import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/locator.dart';

class GameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool pageLoaded = false;
  int scoreX = 0;
  int scoreO = 0;
  bool turnOfO = true;
  int filledBoxes = 0;
  final List<String> xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  Future init() async {
    print("Game ViewModel init()");
    setState(ViewState.Busy);
    try {
      pageLoaded = true;
    } catch (e) {
      setState(ViewState.Error);
    }
    setState(ViewState.Idle);
  }

  void showAlertDialog(String, int) {
    //Add alert dialog
  }

  void computerPlays(){
     
  }

  bool checkWinner() {
    if (xOrOList[0] == xOrOList[1] &&
        xOrOList[0] == xOrOList[2] &&
        xOrOList[0] != '') {
      showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check second row
    if (xOrOList[3] == xOrOList[4] &&
        xOrOList[3] == xOrOList[5] &&
        xOrOList[3] != '') {
      showAlertDialog('Winner', xOrOList[3]);
      return true;
    }

    // check third row
    if (xOrOList[6] == xOrOList[7] &&
        xOrOList[6] == xOrOList[8] &&
        xOrOList[6] != '') {
      showAlertDialog('Winner', xOrOList[6]);
      return true;
    }

    // check first column
    if (xOrOList[0] == xOrOList[3] &&
        xOrOList[0] == xOrOList[6] &&
        xOrOList[0] != '') {
      showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check second column
    if (xOrOList[1] == xOrOList[4] &&
        xOrOList[1] == xOrOList[7] &&
        xOrOList[1] != '') {
      showAlertDialog('Winner', xOrOList[1]);
      return true;
    }

    // check third column
    if (xOrOList[2] == xOrOList[5] &&
        xOrOList[2] == xOrOList[8] &&
        xOrOList[2] != '') {
      showAlertDialog('Winner', xOrOList[2]);
      return true;
    }

    // check diagonal
    if (xOrOList[0] == xOrOList[4] &&
        xOrOList[0] == xOrOList[8] &&
        xOrOList[0] != '') {
      showAlertDialog('Winner', xOrOList[0]);
      return true;
    }

    // check diagonal
    if (xOrOList[2] == xOrOList[4] &&
        xOrOList[2] == xOrOList[6] &&
        xOrOList[2] != '') {
      showAlertDialog('Winner', xOrOList[2]);
      return true;
    }

    if (filledBoxes == 9) {
      showAlertDialog('Draw', '');
      return true;
    }
    return false;
  }

  //what happens when player taps screen
  void tapped(int index) {
    xOrOList[index] = 'o';
    filledBoxes += 1;
    checkWinner();
    if (checkWinner() == false) {
      computerPlays();
    }
    notifyListeners();
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }
}
