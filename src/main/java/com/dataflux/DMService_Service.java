/**
 * DMService_Service.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.dataflux;

public interface DMService_Service extends javax.xml.rpc.Service {

/**
 * Data Management Server
 */
    public String getDMServiceAddress();

    public DataManagementServicePortType getDMService() throws javax.xml.rpc.ServiceException;

    public DataManagementServicePortType getDMService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
