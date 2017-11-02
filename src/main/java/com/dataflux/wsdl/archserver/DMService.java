/**
 * DMService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.dataflux.wsdl.archserver;

public interface DMService extends javax.xml.rpc.Service {

/**
 * Data Management Server
 */
    public String getDMServiceAddress();

    public com.dataflux.wsdl.archserver.DataManagementServicePortType getDMService() throws javax.xml.rpc.ServiceException;

    public com.dataflux.wsdl.archserver.DataManagementServicePortType getDMService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException;
}
