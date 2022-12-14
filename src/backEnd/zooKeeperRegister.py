import signal
import serverConfiguration
from leaderElection import LeaderElection


class ZooKeeperRegisterClient:
    def __init__(self, application):
        self.register(application)

    def register(self, application):
        if (serverConfiguration.enableZooKeeper):
            application.secret_key = "super secret key"
            le = LeaderElection('localhost:2181', 'codeguard', '/election')
            le.register()
            signal.signal(signal.SIGINT, self.handler(le))

    def handler(signum, frame, le):
        le.zk.stop()
        le.zk.close()
        exit(1)
