import serverConfiguration
import requests
import json
from mongoDB import MongoDBConnector

class DependencyExecutor:
    def __init__(self):
        # Simulation to draw
        self.fetchFromSource = self.getFetcher(
            serverConfiguration.fetchVulnerabilitiesFromNist)

    def getFetcher(self, fetchVulnerabilitiesFromNist):
        if (fetchVulnerabilitiesFromNist):
            return self.fetchVulnerabilitiesFromNist
        return self.fetchVulnerabilitiesFromMongoDB

    def fetchVulnerabilitiesFromNist(self, dependencies):
        try:
            vulnerabilities = []
            for dependency in dependencies["dependencies"]:
                response = requests.get(
                    f'https://services.nvd.nist.gov/rest/json/cves/2.0?keywordSearch={dependency}')
                if response.status_code == 200:
                    response_body = json.loads(response.text)
                    if (response_body['totalResults'] > 0):
                        vulnerability = {
                            "dependency_name": dependency,
                            "number_of_found_vulnerabilities": len(response_body['vulnerabilities'])
                        }
                        vulnerabilities.append(vulnerability)
                else:
                    print(
                        f'Get Request with parameter Failed with status code {response.status_code}')
            return vulnerabilities
        except Exception as error:
            raise Exception(
                f"Failed to fetch vulnerabilities from Nist. err: {error}")

    def fetchVulnerabilitiesFromMongoDB(self, dependencies):
        try:
            mongo = MongoDBConnector()
            vulnerabilities = []
            for dependency in dependencies["dependencies"]:
                # query = { "name": dependency }
                query = { "name": "requests" }
                db = mongo.client.codegard
                result = db.codegard_cache.find(query)
                if result.retrieved >> 0: 
                    vulnerability = {
                            "dependency_name": dependency,
                            "number_of_found_vulnerabilities": 1
                        }
                    vulnerabilities.append(vulnerability)
            return vulnerabilities
        except Exception as error:
            raise Exception(
                f"Failed to fetch vulnerabilities from mongoDB. err: {error}")
