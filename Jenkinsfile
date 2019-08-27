podTemplate(label: 'python-sci-base', containers: [
  containerTemplate(name: 'docker', image: 'docker', ttyEnabled: true, command: 'cat', envVars: [
    envVar(key: 'DOCKER_HOST', value: 'tcp://docker-host-docker-host:2375')
  ])
]) {
  node('python-sci-base') {
    stage('Build Image') {
      container('docker') {
        def scmVars = checkout scm
        sh "docker build -t santiment/python-sci-base:${env.BRANCH_NAME} ."

        if (env.BRANCH_NAME == "master") {
          withDockerRegistry([ credentialsId: "dockerHubCreds", url: "" ]) {
            sh "docker build -t santiment/python-sci-base:latest ."
            sh "docker push santiment/python-sci-base:latest"
          }
        }
      }
    }
  }
}
