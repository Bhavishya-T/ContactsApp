import 'package:nuclei_assignments/view/screens/add_contacts_screen.dart';
import 'package:nuclei_assignments/view/screens/contacts_screen.dart';
import 'package:nuclei_assignments/view/screens/update_screen.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: ContactsApp,initial: true),
    AutoRoute(page: AddContactsPage),
    AutoRoute(page: UpdateContactPage),
  ],
)
class $AppRouter {}