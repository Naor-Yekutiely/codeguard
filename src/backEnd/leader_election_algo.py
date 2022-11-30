import sys
import time
from kazoo.client import KazooClient, KazooState
from kazoo.protocol.states import EventType, WatchedEvent

ZNODE_PREFIX = '/a_'

class LeaderElection():
    def __init__(self, zooKeeperAddresses, nodeName, electionNamespace):
        self.zooKeeperAddresses = zooKeeperAddresses
        self.nodeName: str = nodeName
        self.electionNamespace = electionNamespace
        self.zk: KazooClient = None
        self._connect_zookeeper()
        self._leader = False

     
    
