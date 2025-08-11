import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_delivery_latest/profile_screen.dart';

void main() {
  group('ProfileScreen Tests', () {
    testWidgets('should display all UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      expect(find.text('Profile'), findsOneWidget);
      expect(find.byType(CircleAvatar), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.text('Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Save Profile'), findsOneWidget);
    });

    testWidgets('should show success message when save button is pressed', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      await tester.tap(find.text('Save Profile'));
      await tester.pump();

      expect(find.text('Profile updated!'), findsOneWidget);
    });

    testWidgets('should accept text input in name field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      final nameField = find.widgetWithText(TextField, 'Name');
      await tester.enterText(nameField, 'John Doe');
      await tester.pump();

      expect(find.text('John Doe'), findsOneWidget);
    });

    testWidgets('should accept text input in email field', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      final emailField = find.widgetWithText(TextField, 'Email');
      await tester.enterText(emailField, 'john@example.com');
      await tester.pump();

      expect(find.text('john@example.com'), findsOneWidget);
    });

    testWidgets('should display avatar with add photo icon initially', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

      expect(find.byIcon(Icons.add_a_photo), findsOneWidget);
    });
  });
}