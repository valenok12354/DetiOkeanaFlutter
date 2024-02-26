import '../features/list/view/single_user/single_user_screen.dart';
import '../features/list/view/user_list_screen.dart';

final routes = {
  "/": (context) => UserListScreen(title: 'Дети океана'),
  "/user": (context) => const SingleUserScreen(),
};