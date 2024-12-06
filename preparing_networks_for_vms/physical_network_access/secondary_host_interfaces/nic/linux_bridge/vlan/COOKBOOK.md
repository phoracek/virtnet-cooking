# Cookbook

*Connecting VMs to an underlay VLAN or native network accessible through a secondary (i.e. not the default) host interface.*

Picture.

```mermaid
flowchart TD
    S((Switch))
    S ==> |Trunk 100+200| A1
    S ==> |Trunk 100+200| A2
    subgraph Worker 1
        A1[eth1]  ==> B1((br1))
        B1 --- |VLAN=100| C1[eth0 #40;192.168.100.10#41;]
        B1 --- |VLAN=200| C2[eth0 #40;192.168.200.10#41;]
        subgraph VM1
            C1
        end
        subgraph VM2
            C2
        end
    end
    subgraph Worker 2
        A2[eth1]  ==> B2((br1))
        B2 --> |VLAN=100| C3[eth0 #40;192.168.100.20#41;]
        B2 --> |VLAN=200| C4[eth0 #40;192.168.200.20#41;]
        subgraph VM3
            C3
        end
        subgraph VM4
            C4
        end
    end
```

Identify the NIC you want to use for the network. Remember the name.

Configure NNCP for all workers. Remember the bridge name.

Configure NAD in each namespace, remember the NAD name.

Finally, use it from a VM. Here's an example, find more under ...

