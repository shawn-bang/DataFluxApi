package api.exception;

/**
 * 业务异常处理: 调用dataflux没有获取到分词数据
 * @author shawn
 * 2017-12-10 16:00:00
 */
public class DataFluxServiceErrorException extends ApiInternalErrorException {

    public DataFluxServiceErrorException(String message) {
        super(message);
    }

}
