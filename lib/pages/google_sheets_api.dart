import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // credentials from google cloud console
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "saveya",
  "private_key_id": ${env['GOOGLE_SHEETS_KEY_ID']},
  "private_key": ${env['GOOGLE_SHEETS_KEY']},
  "client_email": "saveya@saveya.iam.gserviceaccount.com",
  "client_id": "115240864495117452903",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/saveya%40saveya.iam.gserviceaccount.com"
}
  ''';

  // set up & connection to the spreadsheet
  static final _spreadsheetId = '1b3UbwiYlcStmlcKkiWTDcm-svg4phZ0uECWaDtk8ldA';
  static final _gsheets = GSheets(_credentials);
  static Worksheet _worksheet;

  // variables
  static int numberOfTransactions = 0;
  static List<List<dynamic>> currentTransactions = [];
  static bool loading = true;

  // initialization to the spreadsheet
  Future init() async {
    final ss = await _gsheets.spreadsheet(_spreadsheetId);
    _worksheet = ss.worksheetByTitle('main');
    countRows();
  }

  static Future countRows() async {
    while ((await _worksheet.values
            .value(column: 1, row: numberOfTransactions + 1)) !=
        '') {
      numberOfTransactions++;
    }
    // Loading of transactions
    loadTransactions();
  }

  // loading of existing notes from the spreadsheet
  static Future loadTransactions() async {
    if (_worksheet == null) return;

    for (int i = 1; i < numberOfTransactions; i++) {
      final String transactionName =
          await _worksheet.values.value(column: 1, row: i + 1);
      final String transactionAmount =
          await _worksheet.values.value(column: 2, row: i + 1);
      final String transactionType =
          await _worksheet.values.value(column: 3, row: i + 1);

      if (currentTransactions.length < numberOfTransactions) {
        currentTransactions.add([
          transactionName,
          transactionAmount,
          transactionType,
        ]);
      }
    }
    print(currentTransactions);
    // Stopping the circular loading indicator
    loading = false;
  }

  // insertion of a new transaction
  static Future insert(String name, String amount, bool _isDeposit) async {
    if (_worksheet == null) return;
    numberOfTransactions++;
    currentTransactions.add([
      name,
      amount,
      _isDeposit == true ? 'deposit' : 'withdraw',
    ]);
    await _worksheet.values.appendRow([
      name,
      amount,
      _isDeposit == true ? 'deposit' : 'withdraw',
    ]);
  }

  // Calculation of deposits
  static double calculateDeposits() {
    double totalDeposit = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'deposit') {
        totalDeposit += double.parse(currentTransactions[i][1]);
      }
    }
    return totalDeposit;
  }

  // Calculation of withdrawals
  static double calculateWithdrawals() {
    double totalWithdraws = 0;
    for (int i = 0; i < currentTransactions.length; i++) {
      if (currentTransactions[i][2] == 'withdraw') {
        totalWithdraws += double.parse(currentTransactions[i][1]);
      }
    }
    return totalWithdraws;
  }
}
