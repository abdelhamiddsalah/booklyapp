import 'package:booklyapp/core/networking/api_errors.dart';

// تعريف ApiResult كـ abstract class للحالات الممكنة.
abstract class ApiResult<T> {
  const ApiResult();
}

// حالة النجاح Success
class Success<T> extends ApiResult<T> {
  final T data;
  const Success(this.data);
}

// حالة الفشل Failure
class Failure<T> extends ApiResult<T> {
  final ErrorHandler errorHandler;
  const Failure(this.errorHandler);
}


// يمكن استخدام ApiResult بالشكل التالي:

/*{
    "error": {
        "code": 400,
        "message": "Required parameter: q",
        "errors": [
            {
                "message": "Required parameter: q",
                "domain": "global",
                "reason": "required"
            }
        ]
    }
}*/
