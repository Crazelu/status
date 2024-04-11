import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// A custom set of date patterns for the `ig` locale.
///
/// These are not accurate and are just a clone of the date patterns for the
/// `ig` locale to demonstrate how one would write and use custom date patterns.
// #docregion Date
const igLocaleDatePatterns = {
  'd': 'd.',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
// #enddocregion Date
  'LLLL': 'LLLL',
  'M': 'L.',
  'Md': 'd.M.',
  'MEd': 'EEE d.M.',
  'MMM': 'LLL',
  'MMMd': 'd. MMM',
  'MMMEd': 'EEE d. MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd. MMMM',
  'MMMMEEEEd': 'EEEE d. MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'M.y',
  'yMd': 'd.M.y',
  'yMEd': 'EEE d.MM.y',
  'yMMM': 'MMM y',
  'yMMMd': 'd. MMM y',
  'yMMMEd': 'EEE d. MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd. MMMM y',
  'yMMMMEEEEd': 'EEEE d. MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

/// A custom set of date symbols for the `ig` locale.
///
/// These are not accurate and are just a clone of the date symbols for the
/// `ig` locale to demonstrate how one would write and use custom date symbols.
// #docregion Date2
const igDateSymbols = {
  'NAME': 'ig',
  'ERAS': <dynamic>[
    't.Kr.',
    'm.Kr.',
  ],
// #enddocregion Date2
  'ERANAMES': <dynamic>[
    'tupu kraist',
    'mgbe mraist gachara',
  ],
  'NARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'E',
    'M',
    'J',
    'J',
    'Ọ',
    'S',
    'Ọ',
    'N',
    'D',
  ],
  'STANDALONENARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'E',
    'M',
    'J',
    'J',
    'Ọ',
    'S',
    'Ọ',
    'N',
    'D',
  ],
  'MONTHS': <dynamic>[
    'jenụwarị',
    'febrụwarị',
    'maachị',
    'eprel',
    'mee',
    'junị',
    'julaị',
    'ọgọst',
    'septemba',
    'ọktoba',
    'novemba',
    'disemba',
  ],
  'STANDALONEMONTHS': <dynamic>[
    'jenụwarị',
    'febrụwarị',
    'maachị',
    'eprel',
    'mee',
    'junị',
    'julaị',
    'ọgọst',
    'septemba',
    'ọktoba',
    'novemba',
    'disemba',
  ],
  'SHORTMONTHS': <dynamic>[
    'jen.',
    'feb.',
    'maa.',
    'epr.',
    'mee',
    'jun.',
    'jul.',
    'ọgọ.',
    'sep.',
    'ọkt.',
    'nov.',
    'dis.',
  ],
  'STANDALONESHORTMONTHS': <dynamic>[
    'jen.',
    'feb.',
    'maa.',
    'epr.',
    'mee',
    'jun.',
    'jul.',
    'ọgọ.',
    'sep.',
    'ọkt.',
    'nov.',
    'dis.',
  ],
  'WEEKDAYS': <dynamic>[
    'sundee',
    'mọndè',
    'tuzdee',
    'wenzdee',
    'tọsdee',
    'fraidei',
    'satọdee',
  ],
  'STANDALONEWEEKDAYS': <dynamic>[
    'sundee',
    'mọndè',
    'tuzdee',
    'wenzdee',
    'tọsdee',
    'fraidei',
    'satọdee',
  ],
  'SHORTWEEKDAYS': <dynamic>[
    'sun.',
    'mọn.',
    'tuz.',
    'wen.',
    'tọs.',
    'fra.',
    'sat.',
  ],
  'STANDALONESHORTWEEKDAYS': <dynamic>[
    'sun.',
    'mọn.',
    'tuz.',
    'wen.',
    'tọs.',
    'fra.',
    'sat.',
  ],
  'NARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'O',
    'T',
    'F',
    'S',
  ],
  'STANDALONENARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'O',
    'T',
    'F',
    'S',
  ],
  'SHORTQUARTERS': <dynamic>[
    'K1',
    'K2',
    'K3',
    'K4',
  ],
  'QUARTERS': <dynamic>[
    '1. kvartal',
    '2. kvartal',
    '3. kvartal',
    '4. kvartal',
  ],
  'AMPMS': <dynamic>[
    'a.m.',
    'p.m.',
  ],
  'DATEFORMATS': <dynamic>[
    'EEEE d. MMMM y',
    'd. MMMM y',
    'd. MMM y',
    'dd.MM.y',
  ],
  'TIMEFORMATS': <dynamic>[
    'HH:mm:ss zzzz',
    'HH:mm:ss z',
    'HH:mm:ss',
    'HH:mm',
  ],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': <dynamic>[
    5,
    6,
  ],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': <dynamic>[
    '{1} {0}',
    '{1} \'kl\'. {0}',
    '{1}, {0}',
    '{1}, {0}',
  ],
};

class _IgMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const _IgMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ig';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());

    // The locale (in this case `ig`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: igLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(igDateSymbols),
    );

    return SynchronousFuture<MaterialLocalizations>(
      IgMaterialLocalizations(
        localeName: localeName,
        // The `intl` library's NumberFormat class is generated from CLDR data
        // (see https://github.com/dart-lang/intl/blob/master/lib/number_symbols_data.dart).
        // Unfortunately, there is no way to use a locale that isn't defined in
        // this map and the only way to work around this is to use a listed
        // locale's NumberFormat symbols. So, here we use the number formats
        // for 'en_US' instead.
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
        // DateFormat here will use the symbols and patterns provided in the
        // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
        // However, an alternative is to simply use a supported locale's
        // DateFormat symbols, similar to NumberFormat above.
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_IgMaterialLocalizationsDelegate old) => false;
}

class _IgCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _IgCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'ig';

  @override
  Future<CupertinoLocalizations> load(Locale locale) async {
    final String localeName = intl.Intl.canonicalizedLocale(locale.toString());

    // The locale (in this case `ig`) needs to be initialized into the custom
    // date symbols and patterns setup that Flutter uses.
    date_symbol_data_custom.initializeDateFormattingCustom(
      locale: localeName,
      patterns: igLocaleDatePatterns,
      symbols: intl.DateSymbols.deserializeFromMap(igDateSymbols),
    );

    return SynchronousFuture<CupertinoLocalizations>(
      IgCupertinoLocalizations(
        localeName: localeName,
        // The `intl` library's NumberFormat class is generated from CLDR data
        // (see https://github.com/dart-lang/intl/blob/master/lib/number_symbols_data.dart).
        // Unfortunately, there is no way to use a locale that isn't defined in
        // this map and the only way to work around this is to use a listed
        // locale's NumberFormat symbols. So, here we use the number formats
        // for 'en_US' instead.
        decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
        twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
        // DateFormat here will use the symbols and patterns provided in the
        // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
        // However, an alternative is to simply use a supported locale's
        // DateFormat symbols, similar to NumberFormat above.
        fullYearFormat: intl.DateFormat('y', localeName),
        compactDateFormat: intl.DateFormat('yMd', localeName),
        shortDateFormat: intl.DateFormat('yMMMd', localeName),
        mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
        longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
        yearMonthFormat: intl.DateFormat('MMMM y', localeName),
        shortMonthDayFormat: intl.DateFormat('MMM d', localeName),
      ),
    );
  }

  @override
  bool shouldReload(_IgCupertinoLocalizationsDelegate old) => false;
}

class IgCupertinoLocalizations extends GlobalCupertinoLocalizations {
  const IgCupertinoLocalizations({
    String localeName = 'ig',
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat compactDateFormat,
    required intl.DateFormat shortDateFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat longDateFormat,
    required intl.DateFormat yearMonthFormat,
    required intl.DateFormat shortMonthDayFormat,
    required intl.NumberFormat decimalFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          dayFormat: shortDateFormat,
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          mediumDateFormat: mediumDateFormat,
          decimalFormat: decimalFormat,
          singleDigitHourFormat: shortDateFormat,
          singleDigitMinuteFormat: shortDateFormat,
          singleDigitSecondFormat: shortDateFormat,
          doubleDigitMinuteFormat: shortDateFormat,
        );

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _IgCupertinoLocalizationsDelegate();

  @override
  String get alertDialogLabel => throw UnimplementedError();

  @override
  String get anteMeridiemAbbreviation => throw UnimplementedError();

  @override
  String get clearButtonLabel => throw UnimplementedError();

  @override
  String get copyButtonLabel => throw UnimplementedError();

  @override
  String get cutButtonLabel => throw UnimplementedError();

  @override
  String get datePickerDateOrderString => throw UnimplementedError();

  @override
  String get datePickerDateTimeOrderString => throw UnimplementedError();

  @override
  String? get datePickerHourSemanticsLabelOther => throw UnimplementedError();

  @override
  String? get datePickerMinuteSemanticsLabelOther => throw UnimplementedError();

  @override
  String get lookUpButtonLabel => throw UnimplementedError();

  @override
  String get menuDismissLabel => throw UnimplementedError();

  @override
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  String get noSpellCheckReplacementsLabel => throw UnimplementedError();

  @override
  String get pasteButtonLabel => throw UnimplementedError();

  @override
  String get postMeridiemAbbreviation => throw UnimplementedError();

  @override
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  String get searchWebButtonLabel => throw UnimplementedError();

  @override
  String get selectAllButtonLabel => throw UnimplementedError();

  @override
  String get shareButtonLabel => throw UnimplementedError();

  @override
  String get tabSemanticsLabelRaw => throw UnimplementedError();

  @override
  String? get timerPickerHourLabelOther => throw UnimplementedError();

  @override
  String? get timerPickerMinuteLabelOther => throw UnimplementedError();

  @override
  String? get timerPickerSecondLabelOther => throw UnimplementedError();

  @override
  String get todayLabel => throw UnimplementedError();
}

/// A custom set of localizations for the 'nn' locale. In this example, only
/// the value for openAppDrawerTooltip was modified to use a custom message as
/// an example. Everything else uses the American English (en_US) messages
/// and formatting.
class IgMaterialLocalizations extends GlobalMaterialLocalizations {
  const IgMaterialLocalizations({
    String localeName = 'ig',
    required intl.DateFormat fullYearFormat,
    required intl.DateFormat compactDateFormat,
    required intl.DateFormat shortDateFormat,
    required intl.DateFormat mediumDateFormat,
    required intl.DateFormat longDateFormat,
    required intl.DateFormat yearMonthFormat,
    required intl.DateFormat shortMonthDayFormat,
    required intl.NumberFormat decimalFormat,
    required intl.NumberFormat twoDigitZeroPaddedFormat,
  }) : super(
          localeName: localeName,
          fullYearFormat: fullYearFormat,
          compactDateFormat: compactDateFormat,
          shortDateFormat: shortDateFormat,
          mediumDateFormat: mediumDateFormat,
          longDateFormat: longDateFormat,
          yearMonthFormat: yearMonthFormat,
          shortMonthDayFormat: shortMonthDayFormat,
          decimalFormat: decimalFormat,
          twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
        );

// #docregion Getters
  @override
  String get moreButtonTooltip => r'More';

  @override
  String get aboutListTileTitleRaw => r'About $applicationName';

  @override
  String get alertDialogLabel => r'Alert';
// #enddocregion Getters

  @override
  String get anteMeridiemAbbreviation => r'AM';

  @override
  String get backButtonTooltip => r'Back';

  @override
  String get cancelButtonLabel => r'CANCEL';

  @override
  String get closeButtonLabel => r'CLOSE';

  @override
  String get closeButtonTooltip => r'Close';

  @override
  String get collapsedIconTapHint => r'Expand';

  @override
  String get continueButtonLabel => r'CONTINUE';

  @override
  String get copyButtonLabel => r'COPY';

  @override
  String get cutButtonLabel => r'CUT';

  @override
  String get deleteButtonTooltip => r'Delete';

  @override
  String get dialogLabel => r'Dialog';

  @override
  String get drawerLabel => r'Navigation menu';

  @override
  String get expandedIconTapHint => r'Collapse';

  @override
  String get firstPageTooltip => r'First page';

  @override
  String get hideAccountsLabel => r'Hide accounts';

  @override
  String get lastPageTooltip => r'Last page';

  @override
  String get licensesPageTitle => r'Licenses';

  @override
  String get modalBarrierDismissLabel => r'Dismiss';

  @override
  String get nextMonthTooltip => r'Next month';

  @override
  String get nextPageTooltip => r'Next page';

  @override
  String get okButtonLabel => r'OK';

  @override
  // A custom drawer tooltip message.
  String get openAppDrawerTooltip => r'Custom Navigation Menu Tooltip';

// #docregion Raw
  @override
  String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

  @override
  String get pageRowsInfoTitleApproximateRaw =>
      r'$firstRow–$lastRow of about $rowCount';
// #enddocregion Raw

  @override
  String get pasteButtonLabel => r'PASTE';

  @override
  String get popupMenuLabel => r'Popup menu';

  @override
  String get postMeridiemAbbreviation => r'PM';

  @override
  String get previousMonthTooltip => r'Previous month';

  @override
  String get previousPageTooltip => r'Previous page';

  @override
  String get refreshIndicatorSemanticLabel => r'Refresh';

  @override
  String? get remainingTextFieldCharacterCountFew => null;

  @override
  String? get remainingTextFieldCharacterCountMany => null;

  @override
  String get remainingTextFieldCharacterCountOne => r'1 character remaining';

  @override
  String get remainingTextFieldCharacterCountOther =>
      r'$remainingCount characters remaining';

  @override
  String? get remainingTextFieldCharacterCountTwo => null;

  @override
  String get remainingTextFieldCharacterCountZero => r'No characters remaining';

  @override
  String get reorderItemDown => r'Move down';

  @override
  String get reorderItemLeft => r'Move left';

  @override
  String get reorderItemRight => r'Move right';

  @override
  String get reorderItemToEnd => r'Move to the end';

  @override
  String get reorderItemToStart => r'Move to the start';

  @override
  String get reorderItemUp => r'Move up';

  @override
  String get rowsPerPageTitle => r'Rows per page:';

  @override
  ScriptCategory get scriptCategory => ScriptCategory.englishLike;

  @override
  String get searchFieldLabel => r'Search';

  @override
  String get selectAllButtonLabel => r'SELECT ALL';

  @override
  String? get selectedRowCountTitleFew => null;

  @override
  String? get selectedRowCountTitleMany => null;

  @override
  String get selectedRowCountTitleOne => r'1 item selected';

  @override
  String get selectedRowCountTitleOther => r'$selectedRowCount items selected';

  @override
  String? get selectedRowCountTitleTwo => null;

  @override
  String get selectedRowCountTitleZero => r'No items selected';

  @override
  String get showAccountsLabel => r'Show accounts';

  @override
  String get showMenuTooltip => r'Show menu';

  @override
  String get signedInLabel => r'Signed in';

  @override
  String get tabLabelRaw => r'Tab $tabIndex of $tabCount';

  @override
  TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

  @override
  String get timePickerHourModeAnnouncement => r'Select hours';

  @override
  String get timePickerMinuteModeAnnouncement => r'Select minutes';

  @override
  String get viewLicensesButtonLabel => r'VIEW LICENSES';

  @override
  List<String> get narrowWeekdays =>
      const <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'];

  @override
  int get firstDayOfWeekIndex => 0;

  static const LocalizationsDelegate<MaterialLocalizations> delegate =
      _IgMaterialLocalizationsDelegate();

  @override
  String get calendarModeButtonLabel => r'Switch to calendar';

  @override
  String get dateHelpText => r'mm/dd/yyyy';

  @override
  String get dateInputLabel => r'Enter Date';

  @override
  String get dateOutOfRangeLabel => r'Out of range.';

  @override
  String get datePickerHelpText => r'SELECT DATE';

  @override
  String get dateRangeEndDateSemanticLabelRaw => r'End date $fullDate';

  @override
  String get dateRangeEndLabel => r'End Date';

  @override
  String get dateRangePickerHelpText => 'SELECT RANGE';

  @override
  String get dateRangeStartDateSemanticLabelRaw => 'Start date \$fullDate';

  @override
  String get dateRangeStartLabel => 'Start Date';

  @override
  String get dateSeparator => '/';

  @override
  String get dialModeButtonLabel => 'Switch to dial picker mode';

  @override
  String get inputDateModeButtonLabel => 'Switch to input';

  @override
  String get inputTimeModeButtonLabel => 'Switch to text input mode';

  @override
  String get invalidDateFormatLabel => 'Invalid format.';

  @override
  String get invalidDateRangeLabel => 'Invalid range.';

  @override
  String get invalidTimeLabel => 'Enter a valid time';

  @override
  String get licensesPackageDetailTextOther => '\$licenseCount licenses';

  @override
  String get saveButtonLabel => 'SAVE';

  @override
  String get selectYearSemanticsLabel => 'Select year';

  @override
  String get timePickerDialHelpText => 'SELECT TIME';

  @override
  String get timePickerHourLabel => 'Hour';

  @override
  String get timePickerInputHelpText => 'ENTER TIME';

  @override
  String get timePickerMinuteLabel => 'Minute';

  @override
  String get unspecifiedDate => 'Date';

  @override
  String get unspecifiedDateRange => 'Date Range';

  @override
  String get bottomSheetLabel => 'Bottom Sheet';

  @override
  String get collapsedHint => 'Collapsed';

  @override
  String get currentDateLabel => 'Current Date';

  @override
  String get expandedHint => 'Expanded';

  @override
  String get expansionTileCollapsedHint => 'Collapsed';

  @override
  String get expansionTileCollapsedTapHint => 'Collapsed';

  @override
  String get expansionTileExpandedHint => 'Expanded';

  @override
  String get expansionTileExpandedTapHint => 'Expanded';

  @override
  String get keyboardKeyAlt => 'ALT';

  @override
  String get keyboardKeyAltGraph => 'ALT';

  @override
  String get keyboardKeyBackspace => 'Backspace';

  @override
  String get keyboardKeyCapsLock => 'Caps Lock';

  @override
  String get keyboardKeyChannelDown => '';

  @override
  String get keyboardKeyChannelUp => '';

  @override
  String get keyboardKeyControl => '';

  @override
  String get keyboardKeyDelete => '';

  @override
  String get keyboardKeyEject => '';

  @override
  String get keyboardKeyEnd => '';

  @override
  String get keyboardKeyEscape => '';

  @override
  String get keyboardKeyFn => '';

  @override
  String get keyboardKeyHome => '';

  @override
  String get keyboardKeyInsert => '';

  @override
  String get keyboardKeyMeta => '';

  @override
  String get keyboardKeyMetaMacOs => '';

  @override
  String get keyboardKeyMetaWindows => '';

  @override
  String get keyboardKeyNumLock => '';

  @override
  String get keyboardKeyNumpad0 => '';

  @override
  String get keyboardKeyNumpad1 => '';

  @override
  String get keyboardKeyNumpad2 => '';

  @override
  String get keyboardKeyNumpad3 => '';

  @override
  String get keyboardKeyNumpad4 => '';

  @override
  String get keyboardKeyNumpad5 => '';

  @override
  String get keyboardKeyNumpad6 => '';

  @override
  String get keyboardKeyNumpad7 => '';

  @override
  String get keyboardKeyNumpad8 => '';

  @override
  String get keyboardKeyNumpad9 => '';

  @override
  String get keyboardKeyNumpadAdd => '';

  @override
  String get keyboardKeyNumpadComma => '';

  @override
  String get keyboardKeyNumpadDecimal => '';

  @override
  String get keyboardKeyNumpadDivide => '';

  @override
  String get keyboardKeyNumpadEnter => '';

  @override
  String get keyboardKeyNumpadEqual => '';

  @override
  String get keyboardKeyNumpadMultiply => '';

  @override
  String get keyboardKeyNumpadParenLeft => '';

  @override
  String get keyboardKeyNumpadParenRight => '';

  @override
  String get keyboardKeyNumpadSubtract => '';

  @override
  String get keyboardKeyPageDown => '';

  @override
  String get keyboardKeyPageUp => '';

  @override
  String get keyboardKeyPower => '';

  @override
  String get keyboardKeyPowerOff => '';

  @override
  String get keyboardKeyPrintScreen => '';

  @override
  String get keyboardKeyScrollLock => '';

  @override
  String get keyboardKeySelect => '';

  @override
  String get keyboardKeyShift => '';

  @override
  String get keyboardKeySpace => '';

  @override
  String get lookUpButtonLabel => 'Menu';

  @override
  String get menuBarMenuLabel => 'Menu';

  @override
  String get menuDismissLabel => 'Dismiss';

  @override
  String get scanTextButtonLabel => 'Scan';

  @override
  String get scrimLabel => 'Scrim';

  @override
  String get scrimOnTapHintRaw => 'Tap Scrim';

  @override
  String get searchWebButtonLabel => 'Search';

  @override
  String get shareButtonLabel => 'Share';
}
