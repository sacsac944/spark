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

echo 'Downloading spark tar'
cd /root
sudo wget http://www-us.apache.org/dist/spark/spark-2.4.0/spark-2.4.0-\
bin-hadoop2.7.tgz
echo 'Spark tar Downloaded'

scp /root/spark-2.4.0-bin-hadoop2.7.tgz 15.213.95.214:/root/
tar -xvf /root/spark-2.4.0-bin-hadoop2.7.tgz -C /usr/local/
echo 'export PATH=$PATH:/usr/local/spark-2.4.0-bin-hadoop2.7/bin' >> /etc/profile
source /etc/profile

touch /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh
chmod -R 777 /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh
touch /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
chmod -R 777 /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
cp /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh.template /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh
echo ' - SPARK_MASTER_PORT=9091' >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh
echo "export SPARK_MASTER_HOST='15.213.95.209'" >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/spark-env.sh

cp /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves.template /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
echo '' >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
echo 'doc2.local' >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
echo 'master.local' >> /usr/local/spark-2.4.0-bin-hadoop2.7/conf/slaves
