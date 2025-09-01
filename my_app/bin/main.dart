import 'package:my_app/exceptions/transaction_excepitons.dart';
import 'package:my_app/screens/account_screen.dart';
import 'package:my_app/services/transaction_service.dart';

void main() async {
  try {
  await TransactionService().makeTransaction(
    idSender: "ID001",
    idReceiver: "ID002",
    amount: 10,
  );
} on InsufficientFundsException catch (e) {
  print(e.message);
   print("${e.cause.name} possui saldo ${e.cause.balance} menor que ${e.amount + e.taxes}");
}

}