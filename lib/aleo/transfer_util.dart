import 'dart:developer';

import 'package:flutter_aleo_sdk/flutter_aleo_sdk.dart';

String logTag = "Flutter_Aleo_SDK";

class TransferUtil {
  TransferUtil._();

  /// return transaction id if success
  /// [amount] double value, if transfer 10 credits to recipient, just input 10, it will convert to miroCredits inside transfer function on rust side
  /// [priorityFee] 0.0 is allow
  static Future<String> transferPublic(
    String privateKey,
    String recipient,
    double amount,
    double priorityFee,
  ) async {
    try {
      return transfer(
        recipient: recipient,
        transferType: "public",
        amount: amount,
        fee: priorityFee,
        privateFee: false,
        privateKey: privateKey,
      );
    } catch (e) {
      log("$logTag: $e");
      rethrow;
    }
  }

  /// recommend value for execute public transfer
  static double getPublicTransferFee({bool defaultValue = true}) {
    if (defaultValue) {
      return 0.263;
    } else {
      throw Error.safeToString("currently only support defaultValue");
    }
  }
}
