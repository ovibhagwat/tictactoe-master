import 'package:skyline_template_app/core/utilities/route_names.dart';
import 'package:skyline_template_app/viewmodels/base_viewmodel.dart';
import 'package:skyline_template_app/core/enums/view_state.dart';
import 'package:skyline_template_app/core/services/navigation_service.dart';
import 'package:skyline_template_app/locator.dart';

class GameViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool pageLoaded = false;

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

  void tapped() {
    //what happens when player taps screen
    //CheckWinner();
    //if CheckWinner = false, computerPlays();
    notifyListeners();
  }

  void routeToHomeView() {
    _navigationService.navigateTo(HomeViewRoute);
  }
}
