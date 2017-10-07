#!/bin/bash

keytool -genkey -keystore hawkular.keystore -alias hawkular -dname "CN=hawkular-services" -keyalg RSA -storepass hawkular -keypass hawkular -validity 36500 -ext san=ip:127.0.0.1,dns:hawkular-services,dns:mycustomdomain.io
keytool -importkeystore -srckeystore hawkular.keystore  -destkeystore hawkular.p12 -deststoretype PKCS12 -srcalias hawkular -deststorepass hawkular -destkeypass hawkular -srcstorepass hawkular
  openssl pkcs12 -in hawkular.p12 -password pass:hawkular -nokeys -out hawkular-services-public.pem
openssl pkcs12 -in hawkular.p12 -password pass:hawkular -nodes -nocerts -out hawkular-services-private.key
