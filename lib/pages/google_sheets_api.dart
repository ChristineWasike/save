import 'package:gsheets/gsheets.dart';

class GoogleSheetsApi {
  // credentials from google cloud console
  static const _credentials = r'''
{
  "type": "service_account",
  "project_id": "deposits-335019",
  "private_key_id": "d8b574931c89f29696559960c30f221265faa4e4",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQD4z0MZ4X7FkA5K\nXhvfc2fWpM2Aih6B002piw52CeC/14ZWdbgEMdNNWqQXa09y/xj2QTr0ezhH3MGm\n5iZLwZ/pYbx/bA9oy/G/5lVRtIVUgmkQvzrIWLVYErmGutIfNeeATLF/83mJZjVE\n4nKdgEmN6n+o7zGqnqLndZUKgvYfdVY/KhBrgfmLLfHoovf9YR/HbsaWqg2KYPFV\nsya/CSSreNiOaUNYCM2FlxqlEmK12YorYNCeSPdAVH3JFOhI1e2K+3yFxpykXssb\nB09FpiyEjzRBJ5I0TTIFQCnvERsQAiUfy6jUpDM8saLdoi4++HBgS7P7oszp9lpA\n09PkQh21AgMBAAECggEAD07aid2Z/01pK6yARNkPXaE/HuD16+E/HnwhPs7wcS0x\nT+F8mbl3uYMm+bqO+qbKTOBfiwoya211dq94p2GO1VI/luFkTft6RhHFqboUbUom\nwl0u9dj2CKis7yaluz4wSPBZsrhyqlWhAmTM+MwbT8F1QES93AmtloBhU/JnHTFB\nDQ1jqVbHMO7h1e4EDcHyNa8hXUwzYTkFuP9Xh4Ddc6zLQj1bVuTQB10n5s4wStSU\n7tHczxnJ626A4dvYjAAGJSJXKkWzy/H8xmvHIETXsy2125h3KMihkaVJKx44xGvQ\nfxjfy8ZmFwvyGCBIYUt0dGKBgvSNcYc+3ZjhNzzDcQKBgQD9D8Oytw3mFa67WSXZ\n9KYSOITIq+GFOYnH9Pgl+C4qmhg+0BfkNCNFsAtS0Y8c4ZD75jQXn366XtDMKtK3\nSwnZ6Fyyrl1Pap+PIiWgOvIY7kVMP17jBQw/c25Jj6HfMfSG5f0XdXWd2tMoI1qX\naaN3sdLv5B1+AZixBpgVU2PvvQKBgQD7stvJaStbhvkYhVGV9XjjcicjwuscxQAo\neidmIwx68usmOOXmcQQbDhJXFP8U4K60QPR+m8WiL3v93f+Ab+IZK4EhZZVLo7l+\n4qLAjST731bIIF2E5TeXmnllAiIXRGoFh1tcywcPMLRuC98TGTECjcGKw2zGp3pt\nseft1kCpWQKBgAFk2dYdLgVrbyf3CL9XmqaVCx4z3C0osPqZ/dfvswlnCeUmrksC\ngoM6wgU1xE0LbQoGLZlHtqH+LbZCMiDyV96Mah5N2ZO7aZ+XN4/XY0gB3/3Yh4RG\nndenoh7jnKenFcq8b5V2fyxcbTdWYoRc/5qELz5FCmiMR7QJ7kKH0BAdAoGBAOob\n4XxEGvTl5Pkev9ToXknHmooTuZWn0s7TV6QTg380RO3nTEb75aK4guyGdf/YQAce\nx4qfnsKMwhpOC2FOL5HTuibzElspbNaNPG42mijAAjrgh7udbAjRwInn4webNbXw\nwVTc7rL9TUVyO0nLS5+hdFx6Csn3atNu/1djyf75AoGBAOMIe+9MdRqB9sa2gFu8\n4ra4oPAihfUaES03SgyK87GWnB7Nt7LarpgYiehBR4B3pirFsrWCZG4jGtLemeRt\nhMU9yZL3/3x5iX+e5HaAjEBce+aESzeEdixkbcDAldkD8iVMk1QyQqiH95wAbiZT\n1S54d6vhwE4uEHqwpmlnjvSi\n-----END PRIVATE KEY-----\n",
  "client_email": "deposits@deposits-335019.iam.gserviceaccount.com",
  "client_id": "111318878382461673812",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/deposits%40deposits-335019.iam.gserviceaccount.com"
}
  ''';

  // set up & connection to the spreadsheet
  static final _spreadsheetId = '14Xn_l8U0EdAOdOQ7TvoJLoxfgyU9lIHndd9YPRjeMFY';
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
