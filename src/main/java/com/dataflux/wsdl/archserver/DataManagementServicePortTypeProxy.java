package com.dataflux.wsdl.archserver;

public class DataManagementServicePortTypeProxy implements DataManagementServicePortType {
  private String _endpoint = null;
  private DataManagementServicePortType dataManagementServicePortType = null;
  
  public DataManagementServicePortTypeProxy() {
    _initDataManagementServicePortTypeProxy();
  }
  
  public DataManagementServicePortTypeProxy(String endpoint) {
    _endpoint = endpoint;
    _initDataManagementServicePortTypeProxy();
  }
  
  private void _initDataManagementServicePortTypeProxy() {
    try {
      dataManagementServicePortType = (new DMServiceLocator()).getDMService();
      if (dataManagementServicePortType != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)dataManagementServicePortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)dataManagementServicePortType)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (dataManagementServicePortType != null)
      ((javax.xml.rpc.Stub)dataManagementServicePortType)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public DataManagementServicePortType getDataManagementServicePortType() {
    if (dataManagementServicePortType == null)
      _initDataManagementServicePortTypeProxy();
    return dataManagementServicePortType;
  }
  
  public com.dataflux.xsd.archserver.Row__out[] datasvc_ccapp__rt__matchDdf_in(com.dataflux.xsd.archserver.Row__in[] table_) throws java.rmi.RemoteException{
    if (dataManagementServicePortType == null)
      _initDataManagementServicePortTypeProxy();
    return dataManagementServicePortType.datasvc_ccapp__rt__matchDdf_in(table_);
  }
  
  
}