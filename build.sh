set -e

dnf install -y perl-Graph-Easy tcpdump iproute python2-scapy python3-scapy python3 python3-devel python3-setuptools python2-coverage python3-coverage sudo kmod gflags-devel libtool redhat-rpm-config which gcc gcc-c++ git python-pip libpcap-devel google-benchmark-devel google-benchmark numactl-devel glog glog-devel gtest gtest-devel grpc grpc-devel grpc-plugins libunwind-devel

pip install --user grpcio grpcio-tools
git clone https://github.com/google/googletest.git -b release-1.8.1 /usr/src/googletest
mv /usr/src/googletest/googletest /usr/src/gtest

export BESS_LINK_DYNAMIC=true
./build.py clean
./build.py dpdk
./build.py protobuf
pushd core
make clean
make tests
./all_test --gtest_shuffle
make bessd
popd

