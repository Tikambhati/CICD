import 'package:flutter_test/flutter_test.dart';
import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:cicd_demo/login_page.dart';

void main() {
  testWidgets('Login page renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const CupertinoApp(home: Loginpage()));

    // Check login heading
    expect(find.text('Sign in to your\naccount.'), findsOneWidget);

    // Check email and password fields
    expect(find.byType(CupertinoTextField), findsNWidgets(2));

    // Check Sign In button
    expect(find.text('Sign In'), findsOneWidget);

    // Check Create Account
    expect(find.text('Create Account'), findsOneWidget);
  });
}
