/**
 * Row__in.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.dataflux;

public class Row__in  implements java.io.Serializable {
    private String app_id;

    private String entity_type;

    private String data_type;

    private String data_value;

    private String data_source;

    public Row__in() {
    }

    public Row__in(
           String app_id,
           String entity_type,
           String data_type,
           String data_value,
           String data_source) {
           this.app_id = app_id;
           this.entity_type = entity_type;
           this.data_type = data_type;
           this.data_value = data_value;
           this.data_source = data_source;
    }


    /**
     * Gets the app_id value for this Row__in.
     * 
     * @return app_id
     */
    public String getApp_id() {
        return app_id;
    }


    /**
     * Sets the app_id value for this Row__in.
     * 
     * @param app_id
     */
    public void setApp_id(String app_id) {
        this.app_id = app_id;
    }


    /**
     * Gets the entity_type value for this Row__in.
     * 
     * @return entity_type
     */
    public String getEntity_type() {
        return entity_type;
    }


    /**
     * Sets the entity_type value for this Row__in.
     * 
     * @param entity_type
     */
    public void setEntity_type(String entity_type) {
        this.entity_type = entity_type;
    }


    /**
     * Gets the data_type value for this Row__in.
     * 
     * @return data_type
     */
    public String getData_type() {
        return data_type;
    }


    /**
     * Sets the data_type value for this Row__in.
     * 
     * @param data_type
     */
    public void setData_type(String data_type) {
        this.data_type = data_type;
    }


    /**
     * Gets the data_value value for this Row__in.
     * 
     * @return data_value
     */
    public String getData_value() {
        return data_value;
    }


    /**
     * Sets the data_value value for this Row__in.
     * 
     * @param data_value
     */
    public void setData_value(String data_value) {
        this.data_value = data_value;
    }


    /**
     * Gets the data_source value for this Row__in.
     * 
     * @return data_source
     */
    public String getData_source() {
        return data_source;
    }


    /**
     * Sets the data_source value for this Row__in.
     * 
     * @param data_source
     */
    public void setData_source(String data_source) {
        this.data_source = data_source;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
        if (!(obj instanceof Row__in)) return false;
        Row__in other = (Row__in) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.app_id==null && other.getApp_id()==null) || 
             (this.app_id!=null &&
              this.app_id.equals(other.getApp_id()))) &&
            ((this.entity_type==null && other.getEntity_type()==null) || 
             (this.entity_type!=null &&
              this.entity_type.equals(other.getEntity_type()))) &&
            ((this.data_type==null && other.getData_type()==null) || 
             (this.data_type!=null &&
              this.data_type.equals(other.getData_type()))) &&
            ((this.data_value==null && other.getData_value()==null) || 
             (this.data_value!=null &&
              this.data_value.equals(other.getData_value()))) &&
            ((this.data_source==null && other.getData_source()==null) || 
             (this.data_source!=null &&
              this.data_source.equals(other.getData_source())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getApp_id() != null) {
            _hashCode += getApp_id().hashCode();
        }
        if (getEntity_type() != null) {
            _hashCode += getEntity_type().hashCode();
        }
        if (getData_type() != null) {
            _hashCode += getData_type().hashCode();
        }
        if (getData_value() != null) {
            _hashCode += getData_value().hashCode();
        }
        if (getData_source() != null) {
            _hashCode += getData_source().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Row__in.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("archserver.xsd.dataflux.com", "row__in"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("app_id");
        elemField.setXmlName(new javax.xml.namespace.QName("", "app_id"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("entity_type");
        elemField.setXmlName(new javax.xml.namespace.QName("", "entity_type"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("data_type");
        elemField.setXmlName(new javax.xml.namespace.QName("", "data_type"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("data_value");
        elemField.setXmlName(new javax.xml.namespace.QName("", "data_value"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("data_source");
        elemField.setXmlName(new javax.xml.namespace.QName("", "data_source"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
