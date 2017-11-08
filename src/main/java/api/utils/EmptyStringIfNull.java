package api.utils;

import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.TypeHandler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmptyStringIfNull implements TypeHandler<String> {

	public void setParameter(PreparedStatement preparedStatement, int i, String s, JdbcType jdbcType) throws SQLException {
		preparedStatement.setString(i, s);
	}

	public String getResult(ResultSet resultSet, String columnName) throws SQLException {
		return (resultSet.getString(columnName) == null) ? "" : resultSet.getString(columnName);
	}

	public String getResult(ResultSet resultSet, int columnIndex) throws SQLException {
		return (resultSet.getString(columnIndex) == null) ? "" : resultSet.getString(columnIndex);
	}

	public String getResult(CallableStatement cs, int columnIndex) throws SQLException {
		return (cs.getString(columnIndex) == null) ? "" : cs.getString(columnIndex);
	}
}
