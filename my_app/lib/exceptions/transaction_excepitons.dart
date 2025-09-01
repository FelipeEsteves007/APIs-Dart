import 'package:my_app/models/account.dart';

class SenderNotExistException implements Exception{

}

class ReceiverNotExistsException implements Exception {

}

class InsufficientFundsException implements Exception{
    String message; // Mensagem amigável
    Account cause; // Objeto causador da exceção
    double amount; // Informações específicas
    double taxes; // Informações específicas
    
    InsufficientFundsException({
        this.message = "Fundos insuficientes",
        required this.cause,
        required this.amount,
        required this.taxes,
    });
}