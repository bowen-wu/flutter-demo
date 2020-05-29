import 'package:quick_loan_demo/services/api.dart';
import 'package:quick_loan_demo/services/baseService.dart';

class LoginService extends BaseService {
  sendSmsCode(phoneNumber) {
    return dioInstance(
      method: 'post',
      url: API.sendSmsCode,
      data: {"phoneNumber": phoneNumber},
    );
  }
}
