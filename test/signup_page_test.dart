import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dynamic_delivery_latest/signup_page.dart';

void main() {
  group('SignupPage Tests', () {
    testWidgets('should display all form fields and button', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      expect(find.text('Sign Up'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(3));
      expect(find.text('Full Name'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    testWidgets('should show validation errors for empty fields', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Please enter your name'), findsOneWidget);
      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter a password'), findsOneWidget);
    });

    testWidgets('should validate email format', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'invalid-email');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Please enter a valid email'), findsOneWidget);
    });

    testWidgets('should validate password length', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), '123');
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should show success message with valid inputs', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: SignupPage()));

      await tester.enterText(find.widgetWithText(TextFormField, 'Full Name'), 'John Doe');
      await tester.enterText(find.widgetWithText(TextFormField, 'Email'), 'john@example.com');
      await tester.enterText(find.widgetWithText(TextFormField, 'Password'), 'password123');
      
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      expect(find.text('Signup successful!'), findsOneWidget);
    });
  });
}