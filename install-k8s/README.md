## Cài đặt kubernetes
### Ubuntu server
https://phoenixnap.com/kb/install-kubernetes-on-ubuntu
### Centos server
https://phoenixnap.com/kb/how-to-install-kubernetes-on-centos

## Một số lỗi thường gặp
1. Node had taints that the pod didn't tolerate error when deploying to Kubernetes cluster  
=> You can run below command to remove the taint from master node and then you should be able to deploy your pod on that node:  
    ```shell script
    kubectl taint nodes <ten_node> node-role.kubernetes.io/master-
    ```
2. Lỗi cài đặt k8s, `coredns-...` running rồi nhưng trạng thái READY vẫn là 0/1:  
=> Cái này liên quan đến iptables (network), thử restart lại xem:  
    ```shell script
    systemctl stop kubelet
    systemctl stop docker
    iptables --flush
    iptables -tnat --flush
    systemctl start kubelet
    systemctl start docker
    ```