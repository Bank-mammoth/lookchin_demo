// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TEST1234`
  String get test {
    return Intl.message(
      'TEST1234',
      name: 'test',
      desc: '',
      args: [],
    );
  }

  /// `12 + 4 = {result}`
  String test2(Object result) {
    return Intl.message(
      '12 + 4 = $result',
      name: 'test2',
      desc: '',
      args: [result],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to LookChin`
  String get Onboading_welcome {
    return Intl.message(
      'Welcome to LookChin',
      name: 'Onboading_welcome',
      desc: '',
      args: [],
    );
  }

  /// `thailand`
  String get Onboading_thailand {
    return Intl.message(
      'thailand',
      name: 'Onboading_thailand',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get Onboading_start {
    return Intl.message(
      'Get started',
      name: 'Onboading_start',
      desc: '',
      args: [],
    );
  }

  /// `Select current country`
  String get Onboading_country {
    return Intl.message(
      'Select current country',
      name: 'Onboading_country',
      desc: '',
      args: [],
    );
  }

  /// `Agree All `
  String get TermsAgree_Agreeall {
    return Intl.message(
      'Agree All ',
      name: 'TermsAgree_Agreeall',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service Agreement`
  String get TermsAgree_TermsAgree {
    return Intl.message(
      'Terms of Service Agreement',
      name: 'TermsAgree_TermsAgree',
      desc: '',
      args: [],
    );
  }

  /// `Personal Information Collection and Usage Agreement`
  String get TermsAgree_Policy {
    return Intl.message(
      'Personal Information Collection and Usage Agreement',
      name: 'TermsAgree_Policy',
      desc: '',
      args: [],
    );
  }

  /// `I am over 18 years old.`
  String get TermsAgree_age {
    return Intl.message(
      'I am over 18 years old.',
      name: 'TermsAgree_age',
      desc: '',
      args: [],
    );
  }

  /// `Agree to get started`
  String get TermsAgree_accept {
    return Intl.message(
      'Agree to get started',
      name: 'TermsAgree_accept',
      desc: '',
      args: [],
    );
  }

  /// `Let's verify your Phone number`
  String get login_signup_phoneno {
    return Intl.message(
      'Let\'s verify your Phone number',
      name: 'login_signup_phoneno',
      desc: '',
      args: [],
    );
  }

  /// `Your number is not shown to others and is only used for verification`
  String get login_signup_phoneno1 {
    return Intl.message(
      'Your number is not shown to others and is only used for verification',
      name: 'login_signup_phoneno1',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get login_signup_phoneno2 {
    return Intl.message(
      'Enter phone number',
      name: 'login_signup_phoneno2',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get login_signup_sendcode {
    return Intl.message(
      'Send code',
      name: 'login_signup_sendcode',
      desc: '',
      args: [],
    );
  }

  /// `Changed phone number?  Find account by email.`
  String get login_signup_changeno {
    return Intl.message(
      'Changed phone number?  Find account by email.',
      name: 'login_signup_changeno',
      desc: '',
      args: [],
    );
  }

  /// `Enter code`
  String get login_signup_password {
    return Intl.message(
      'Enter code',
      name: 'login_signup_password',
      desc: '',
      args: [],
    );
  }

  /// `Send code again`
  String get login_signup_password1 {
    return Intl.message(
      'Send code again',
      name: 'login_signup_password1',
      desc: '',
      args: [],
    );
  }

  /// `Do not share this with anyone else.`
  String get login_signup_otp {
    return Intl.message(
      'Do not share this with anyone else.',
      name: 'login_signup_otp',
      desc: '',
      args: [],
    );
  }

  /// `Agree to get started`
  String get login_signup_start {
    return Intl.message(
      'Agree to get started',
      name: 'login_signup_start',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use and Privacy Policy`
  String get login_signup_tremsagree {
    return Intl.message(
      'Terms of Use and Privacy Policy',
      name: 'login_signup_tremsagree',
      desc: '',
      args: [],
    );
  }

  /// `We've sent you a text with the code. (It could take up to 30 seconds.)`
  String get login_signup_sendotp {
    return Intl.message(
      'We\'ve sent you a text with the code. (It could take up to 30 seconds.)',
      name: 'login_signup_sendotp',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code again.`
  String get login_signup_wrongotp {
    return Intl.message(
      'Enter the verification code again.',
      name: 'login_signup_wrongotp',
      desc: '',
      args: [],
    );
  }

  /// `Input time has expired. Try send code again.`
  String get login_signup_expire {
    return Intl.message(
      'Input time has expired. Try send code again.',
      name: 'login_signup_expire',
      desc: '',
      args: [],
    );
  }

  /// `Make sure your mobile number is entered correctly. Try again.`
  String get login_signup_checkphonno {
    return Intl.message(
      'Make sure your mobile number is entered correctly. Try again.',
      name: 'login_signup_checkphonno',
      desc: '',
      args: [],
    );
  }

  /// `Unable to resend verification code within 10 seconds.`
  String get login_signup_wait10sec {
    return Intl.message(
      'Unable to resend verification code within 10 seconds.',
      name: 'login_signup_wait10sec',
      desc: '',
      args: [],
    );
  }

  /// `You have 3 remaining verification codes for today.`
  String get login_signup_remaining {
    return Intl.message(
      'You have 3 remaining verification codes for today.',
      name: 'login_signup_remaining',
      desc: '',
      args: [],
    );
  }

  /// `You can receive the verification code up to 5 times per day. Try again tomorrow.`
  String get login_signup_trytmr {
    return Intl.message(
      'You can receive the verification code up to 5 times per day. Try again tomorrow.',
      name: 'login_signup_trytmr',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get setting_setting {
    return Intl.message(
      'Settings',
      name: 'setting_setting',
      desc: '',
      args: [],
    );
  }

  /// `Alerts`
  String get setting_noti {
    return Intl.message(
      'Alerts',
      name: 'setting_noti',
      desc: '',
      args: [],
    );
  }

  /// `User settings`
  String get setting_usersetting {
    return Intl.message(
      'User settings',
      name: 'setting_usersetting',
      desc: '',
      args: [],
    );
  }

  /// `Change country`
  String get setting_country {
    return Intl.message(
      'Change country',
      name: 'setting_country',
      desc: '',
      args: [],
    );
  }

  /// `Language settings`
  String get setting_language {
    return Intl.message(
      'Language settings',
      name: 'setting_language',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get setting_theme {
    return Intl.message(
      'Theme',
      name: 'setting_theme',
      desc: '',
      args: [],
    );
  }

  /// `More info and support`
  String get setting_infoandsupport {
    return Intl.message(
      'More info and support',
      name: 'setting_infoandsupport',
      desc: '',
      args: [],
    );
  }

  /// `What's new?`
  String get setting_new {
    return Intl.message(
      'What\'s new?',
      name: 'setting_new',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get setting_help {
    return Intl.message(
      'Help',
      name: 'setting_help',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get setting_terms {
    return Intl.message(
      'Terms of Use',
      name: 'setting_terms',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get setting_policy {
    return Intl.message(
      'Privacy Policy',
      name: 'setting_policy',
      desc: '',
      args: [],
    );
  }

  /// `Location-Based Services Terms`
  String get setting_locationterms {
    return Intl.message(
      'Location-Based Services Terms',
      name: 'setting_locationterms',
      desc: '',
      args: [],
    );
  }

  /// `version`
  String get setting_version {
    return Intl.message(
      'version',
      name: 'setting_version',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get setting_logout {
    return Intl.message(
      'Log out',
      name: 'setting_logout',
      desc: '',
      args: [],
    );
  }

  /// `deleteAccount`
  String get setting_deleteac {
    return Intl.message(
      'deleteAccount',
      name: 'setting_deleteac',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'th'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
