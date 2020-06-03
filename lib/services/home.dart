import 'package:quick_loan_demo/services/api.dart';
import 'package:quick_loan_demo/services/baseService.dart';

class HomeService extends BaseService {

}


class LoginService extends BaseService {
  sendSmsCode(phoneNumber) async {
    return await dioInstance(
      method: 'post',
      url: API.sendSmsCode,
      data: {"phoneNumber": phoneNumber},
    );
  }

  checkSmsCode({phoneNumber, smsCode}) async {
    return await dioInstance(
        method: 'post',
        url: API.checkSmsCode,
        data: {phoneNumber: phoneNumber, smsCode: smsCode}
    );
  }
}
