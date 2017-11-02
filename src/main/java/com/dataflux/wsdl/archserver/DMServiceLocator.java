/**
 * DMServiceLocator.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.dataflux.wsdl.archserver;
import api.utils.PropUtil;

public class DMServiceLocator extends org.apache.axis.client.Service implements DMService {

/**
 * Data Management Server
 */

    public DMServiceLocator() {
    }


    public DMServiceLocator(org.apache.axis.EngineConfiguration config) {
        super(config);
    }

    public DMServiceLocator(String wsdlLoc, javax.xml.namespace.QName sName) throws javax.xml.rpc.ServiceException {
        super(wsdlLoc, sName);
    }

    // Use to get a proxy class for DMService
//    private java.lang.String DMService_address = "http://fanqizha:21036";
    
    private static String DMService_address = null;
    
    static {
    	try {
			DMService_address=PropUtil.getPropValue("runningControl", "DFSERVICEADD");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    public String getDMServiceAddress() {
        return DMService_address;
    }

    // The WSDD service name defaults to the port name.
    private String DMServiceWSDDServiceName = "DMService";

    public String getDMServiceWSDDServiceName() {
        return DMServiceWSDDServiceName;
    }

    public void setDMServiceWSDDServiceName(String name) {
        DMServiceWSDDServiceName = name;
    }

    public com.dataflux.wsdl.archserver.DataManagementServicePortType getDMService() throws javax.xml.rpc.ServiceException {
       java.net.URL endpoint;
        try {
            endpoint = new java.net.URL(DMService_address);
        }
        catch (java.net.MalformedURLException e) {
            throw new javax.xml.rpc.ServiceException(e);
        }
        return getDMService(endpoint);
    }

    public com.dataflux.wsdl.archserver.DataManagementServicePortType getDMService(java.net.URL portAddress) throws javax.xml.rpc.ServiceException {
        try {
            com.dataflux.wsdl.archserver.DataManagementServiceStub _stub = new com.dataflux.wsdl.archserver.DataManagementServiceStub(portAddress, this);
            _stub.setPortName(getDMServiceWSDDServiceName());
            return _stub;
        }
        catch (org.apache.axis.AxisFault e) {
            return null;
        }
    }

    public void setDMServiceEndpointAddress(String address) {
        DMService_address = address;
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        try {
            if (com.dataflux.wsdl.archserver.DataManagementServicePortType.class.isAssignableFrom(serviceEndpointInterface)) {
                com.dataflux.wsdl.archserver.DataManagementServiceStub _stub = new com.dataflux.wsdl.archserver.DataManagementServiceStub(new java.net.URL(DMService_address), this);
                _stub.setPortName(getDMServiceWSDDServiceName());
                return _stub;
            }
        }
        catch (Throwable t) {
            throw new javax.xml.rpc.ServiceException(t);
        }
        throw new javax.xml.rpc.ServiceException("There is no stub implementation for the interface:  " + (serviceEndpointInterface == null ? "null" : serviceEndpointInterface.getName()));
    }

    /**
     * For the given interface, get the stub implementation.
     * If this service has no port for the given interface,
     * then ServiceException is thrown.
     */
    public java.rmi.Remote getPort(javax.xml.namespace.QName portName, Class serviceEndpointInterface) throws javax.xml.rpc.ServiceException {
        if (portName == null) {
            return getPort(serviceEndpointInterface);
        }
        String inputPortName = portName.getLocalPart();
        if ("DMService".equals(inputPortName)) {
            return getDMService();
        }
        else  {
            java.rmi.Remote _stub = getPort(serviceEndpointInterface);
            ((org.apache.axis.client.Stub) _stub).setPortName(portName);
            return _stub;
        }
    }

    public javax.xml.namespace.QName getServiceName() {
        return new javax.xml.namespace.QName("http://archserver.wsdl.dataflux.com", "DMService");
    }

    private java.util.HashSet ports = null;

    public java.util.Iterator getPorts() {
        if (ports == null) {
            ports = new java.util.HashSet();
            ports.add(new javax.xml.namespace.QName("http://archserver.wsdl.dataflux.com", "DMService"));
        }
        return ports.iterator();
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(String portName, String address) throws javax.xml.rpc.ServiceException {
        
if ("DMService".equals(portName)) {
            setDMServiceEndpointAddress(address);
        }
        else 
{ // Unknown Port Name
            throw new javax.xml.rpc.ServiceException(" Cannot set Endpoint Address for Unknown Port" + portName);
        }
    }

    /**
    * Set the endpoint address for the specified port name.
    */
    public void setEndpointAddress(javax.xml.namespace.QName portName, String address) throws javax.xml.rpc.ServiceException {
        setEndpointAddress(portName.getLocalPart(), address);
    }

}
