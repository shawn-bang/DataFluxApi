package api.exception;

/**
 * 业务异常处理: json输入报文字段数据校验不通过
 * @author shawn
 * 2017-12-10 16:00:00
 */
public class InputDataErrorException extends ApiInternalErrorException {

    public InputDataErrorException(String message) {
        super(message);
    }

}
