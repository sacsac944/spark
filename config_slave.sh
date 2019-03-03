java -version
if [[ $? -ne 0 ]]
then
   yum install -y java-1.8.0-openjdk-devel
   echo 'Java Installed'
else
   echo 'Java already installed'
fi
scala -version
if [[ $? -ne 0 ]] 
then 
   wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.rpm
   yum install -y scala-2.11.8.rpm
   echo 'Scala Installed'
else 
   echo 'The scala is already installed'
fi


tar -xvf /root/spark-2.4.0-bin-hadoop2.7.tgz -C /usr/local/


echo export PATH=$PATH:/usr/local/spark/bin >> /etc/profile
source /etc/profile
