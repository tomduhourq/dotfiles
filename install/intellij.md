# custom IntelliJ IDEA VM options
# link: http://tomaszdziurko.pl/2015/11/1-and-the-only-one-to-customize-intellij-idea-memory-settings/

#-- Default --##
#-Xms128m
#-Xmx750m
#-XX:MaxPermSize=350m
#-XX:ReservedCodeCacheSize=240m
#-XX:+UseCompressedOops

#-- Balanced --#
#-Xms2g
#-Xmx2g
#-XX:ReservedCodeCacheSize=1024m
#-XX:+UseCompressedOops

#-- Big --#
-Xms1024m
-Xmx4096m
-XX:MaxPermSize=1024m
-XX:ReservedCodeCacheSize=1024m
-XX:+UseCompressedOops

#-- Sophisticated --#
#-server
#-Xms2g
#-Xmx2g
#-XX:NewRatio=3
#-Xss16m
#-XX:+UseConcMarkSweepGC
#-XX:+CMSParallelRemarkEnabled
#-XX:ConcGCThreads=4
#-XX:ReservedCodeCacheSize=240m
#-XX:+AlwaysPreTouch
#-XX:+TieredCompilation
#-XX:+UseCompressedOops
#-XX:SoftRefLRUPolicyMSPerMB=50
#-Dsun.io.useCanonCaches=false
#-Djava.net.preferIPv4Stack=true
#-Djsse.enableSNIExtension=false
#-ea