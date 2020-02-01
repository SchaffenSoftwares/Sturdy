import 'package:bloc/bloc.dart';
import 'package:sturdy/home_page/dashboard.dart';
import 'package:sturdy/Ebooks/DashboardEbooks.dart';
import 'package:sturdy/Mentor/mentor.dart';
import 'package:sturdy/login_page/login_page.dart';

import '../calci.dart';
import '../money.dart';





enum NavigationEvents {
  DiscussionClickedEvent,
  EbookClickedEvent,
  CourseMaterialClickedEvent,
  MentorClickedEvent,
  DailyQuestionClickedEvent,
  SplitupBillClickedEvent,
  AttendanceCalciClickedEvent,
  ScientificCalciClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => CoursePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.DiscussionClickedEvent:
        yield CoursePage();
        break;
      case NavigationEvents.EbookClickedEvent:
        yield DiscussionEbooks();
        break;
      case NavigationEvents.CourseMaterialClickedEvent:
        yield CoursePage();
        break;
      case NavigationEvents.MentorClickedEvent:
        yield Mentor();
        break;
      case NavigationEvents.DailyQuestionClickedEvent:
        yield CoursePage();
        break;
      case NavigationEvents.SplitupBillClickedEvent:
        yield Money();
        break;
      case NavigationEvents.AttendanceCalciClickedEvent:
        yield CoursePage();
        break;
      case NavigationEvents.ScientificCalciClickedEvent:
        yield Calci();
        break;
    }
  }
}