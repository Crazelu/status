import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ig.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'localization/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ig')
  ];

  /// The current language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// No description provided for @monday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get monday;

  /// No description provided for @tuesday.
  ///
  /// In en, this message translates to:
  /// **'Tuesday'**
  String get tuesday;

  /// No description provided for @wednesday.
  ///
  /// In en, this message translates to:
  /// **'Wednesday'**
  String get wednesday;

  /// No description provided for @thursday.
  ///
  /// In en, this message translates to:
  /// **'Thursday'**
  String get thursday;

  /// No description provided for @friday.
  ///
  /// In en, this message translates to:
  /// **'Friday'**
  String get friday;

  /// No description provided for @saturday.
  ///
  /// In en, this message translates to:
  /// **'Saturday'**
  String get saturday;

  /// No description provided for @sunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get sunday;

  /// No description provided for @january.
  ///
  /// In en, this message translates to:
  /// **'January'**
  String get january;

  /// No description provided for @february.
  ///
  /// In en, this message translates to:
  /// **'February'**
  String get february;

  /// No description provided for @march.
  ///
  /// In en, this message translates to:
  /// **'March'**
  String get march;

  /// No description provided for @april.
  ///
  /// In en, this message translates to:
  /// **'April'**
  String get april;

  /// No description provided for @may.
  ///
  /// In en, this message translates to:
  /// **'May'**
  String get may;

  /// No description provided for @june.
  ///
  /// In en, this message translates to:
  /// **'June'**
  String get june;

  /// No description provided for @july.
  ///
  /// In en, this message translates to:
  /// **'July'**
  String get july;

  /// No description provided for @august.
  ///
  /// In en, this message translates to:
  /// **'August'**
  String get august;

  /// No description provided for @september.
  ///
  /// In en, this message translates to:
  /// **'September'**
  String get september;

  /// No description provided for @october.
  ///
  /// In en, this message translates to:
  /// **'October'**
  String get october;

  /// No description provided for @november.
  ///
  /// In en, this message translates to:
  /// **'November'**
  String get november;

  /// No description provided for @december.
  ///
  /// In en, this message translates to:
  /// **'December'**
  String get december;

  /// No description provided for @first.
  ///
  /// In en, this message translates to:
  /// **'1st'**
  String get first;

  /// No description provided for @second.
  ///
  /// In en, this message translates to:
  /// **'2nd'**
  String get second;

  /// No description provided for @third.
  ///
  /// In en, this message translates to:
  /// **'3rd'**
  String get third;

  /// No description provided for @fourth.
  ///
  /// In en, this message translates to:
  /// **'4th'**
  String get fourth;

  /// No description provided for @fifth.
  ///
  /// In en, this message translates to:
  /// **'5th'**
  String get fifth;

  /// No description provided for @sixth.
  ///
  /// In en, this message translates to:
  /// **'6th'**
  String get sixth;

  /// No description provided for @seventh.
  ///
  /// In en, this message translates to:
  /// **'7th'**
  String get seventh;

  /// No description provided for @eighth.
  ///
  /// In en, this message translates to:
  /// **'8th'**
  String get eighth;

  /// No description provided for @ninth.
  ///
  /// In en, this message translates to:
  /// **'9th'**
  String get ninth;

  /// No description provided for @tenth.
  ///
  /// In en, this message translates to:
  /// **'10th'**
  String get tenth;

  /// No description provided for @eleventh.
  ///
  /// In en, this message translates to:
  /// **'11th'**
  String get eleventh;

  /// No description provided for @twelfth.
  ///
  /// In en, this message translates to:
  /// **'12th'**
  String get twelfth;

  /// No description provided for @thirteenth.
  ///
  /// In en, this message translates to:
  /// **'13th'**
  String get thirteenth;

  /// No description provided for @fourteenth.
  ///
  /// In en, this message translates to:
  /// **'14th'**
  String get fourteenth;

  /// No description provided for @fifteenth.
  ///
  /// In en, this message translates to:
  /// **'15th'**
  String get fifteenth;

  /// No description provided for @sixteenth.
  ///
  /// In en, this message translates to:
  /// **'16th'**
  String get sixteenth;

  /// No description provided for @seventeenth.
  ///
  /// In en, this message translates to:
  /// **'17th'**
  String get seventeenth;

  /// No description provided for @eighteenth.
  ///
  /// In en, this message translates to:
  /// **'18th'**
  String get eighteenth;

  /// No description provided for @nineteenth.
  ///
  /// In en, this message translates to:
  /// **'19th'**
  String get nineteenth;

  /// No description provided for @twentieth.
  ///
  /// In en, this message translates to:
  /// **'20th'**
  String get twentieth;

  /// No description provided for @twentyFirst.
  ///
  /// In en, this message translates to:
  /// **'21st'**
  String get twentyFirst;

  /// No description provided for @twentySecond.
  ///
  /// In en, this message translates to:
  /// **'22nd'**
  String get twentySecond;

  /// No description provided for @twentyThird.
  ///
  /// In en, this message translates to:
  /// **'23rd'**
  String get twentyThird;

  /// No description provided for @twentyFourth.
  ///
  /// In en, this message translates to:
  /// **'24th'**
  String get twentyFourth;

  /// No description provided for @twentyFifth.
  ///
  /// In en, this message translates to:
  /// **'25th'**
  String get twentyFifth;

  /// No description provided for @twentySixth.
  ///
  /// In en, this message translates to:
  /// **'26th'**
  String get twentySixth;

  /// No description provided for @twentySeventh.
  ///
  /// In en, this message translates to:
  /// **'27th'**
  String get twentySeventh;

  /// No description provided for @twentyEighth.
  ///
  /// In en, this message translates to:
  /// **'28th'**
  String get twentyEighth;

  /// No description provided for @twentyNinth.
  ///
  /// In en, this message translates to:
  /// **'29th'**
  String get twentyNinth;

  /// No description provided for @thirtieth.
  ///
  /// In en, this message translates to:
  /// **'30th'**
  String get thirtieth;

  /// No description provided for @thirtyFirst.
  ///
  /// In en, this message translates to:
  /// **'31st'**
  String get thirtyFirst;

  /// No description provided for @sorryDudeButTheresNoWayImLettingYouViewThisOnYourMobile.
  ///
  /// In en, this message translates to:
  /// **'Sorry dude but there\'s no way I\'m letting you view this on your mobile.'**
  String get sorryDudeButTheresNoWayImLettingYouViewThisOnYourMobile;

  /// No description provided for @pleaseGoOnYourDesktop.
  ///
  /// In en, this message translates to:
  /// **'Please go on your desktop'**
  String get pleaseGoOnYourDesktop;

  /// No description provided for @meeting.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meeting;

  /// No description provided for @focusedWork.
  ///
  /// In en, this message translates to:
  /// **'Focused Work'**
  String get focusedWork;

  /// No description provided for @holiday.
  ///
  /// In en, this message translates to:
  /// **'Holiday'**
  String get holiday;

  /// No description provided for @offSick.
  ///
  /// In en, this message translates to:
  /// **'Off Sick'**
  String get offSick;

  /// No description provided for @personalSchedule.
  ///
  /// In en, this message translates to:
  /// **'Personal Schedule'**
  String get personalSchedule;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get schedule;

  /// No description provided for @minimumNotice.
  ///
  /// In en, this message translates to:
  /// **'Minimum Notice'**
  String get minimumNotice;

  /// No description provided for @fourHours.
  ///
  /// In en, this message translates to:
  /// **'4 hours'**
  String get fourHours;

  /// No description provided for @luckysStatus.
  ///
  /// In en, this message translates to:
  /// **'Lucky\'s Status'**
  String get luckysStatus;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ig'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ig': return AppLocalizationsIg();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
