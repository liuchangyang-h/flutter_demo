import 'package:dio/dio.dart';
import 'dart:io';

import 'loadWidget.dart';

class UploadFile {
//签名
  static requestOssUrl(
      String filePath,
      Map<String, Object> parameters,
      successBlock(int code, String message, String data),
      errorBlock(error)) async {
    //创建dio对象
    Dio dio = new Dio();
    //dio的请求配置
    dio.options.responseType = ResponseType.plain;
    dio.options.contentType = ContentType.parse('multipart/form-data').toString();
    //文件名
    String path = filePath;
    String name = DateTime.now().millisecondsSinceEpoch.toString() +
        filePath.substring(filePath.lastIndexOf("."));


    String fileName = DateTime.now().millisecondsSinceEpoch.toString() +
        path.substring(path.lastIndexOf('.'), path.length);
    //创建一个formdata，作为dio的参数
    File file = new File(filePath);
    print(parameters);
    FormData formData = new FormData.fromMap({
//      'chunk': '0',
      'OSSAccessKeyId': parameters['accessid'],
      'policy': parameters['policy'],
      'signature': parameters['signature'],
      'Expires': parameters['expire'],
      'key': parameters['dir'].toString() + fileName,
      'dri': parameters['dir'],
      'success_action_status': '200',
      'Access-Control-Allow-Origin': '*',
      'Filename': name,
      'x-oss-security-token': parameters['stsToken'].toString(),
//      'callback':parameters['callback'],
      'file':  await MultipartFile.fromFile(filePath, filename: fileName),
    });

    try {
      Response response = await dio.post(parameters['host'], data: formData);

      print(parameters['host'].toString() + '/' +
          parameters['dir'].toString() +
          fileName);
      print(fileName);
      print(response);

      if (response.statusCode == 200) {
        int code = 0;
        String msg = '';
        Object data = parameters['host'].toString() + '/' +
            parameters['dir'].toString() +
            fileName;

        return successBlock(code, msg, data);
      } else {
        int code = -1;
        String msg = '上传失败';
        Object data;

        return successBlock(code, msg, data);
      }

    } on DioError catch (error) {
      print('上传失败');
      print(error);
      LoadWidget.dismiss();
      return errorBlock(error);
    }
  }
}