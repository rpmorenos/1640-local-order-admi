pipeline {
    agent any
    environment {
        scannerHome = tool name: 'sonar-scanner'
        SONAR_TOKEN = credentials('jenkins-sonar')
    }
    stages {
        stage('Obtener el proyecto') {
            steps {
                git branch: 'example-rafa', poll: false, url: 'https://github.com/RafaelRamos93/1640-LOCAL-ORDER-ADMI.git'
            }
        }
        stage('Scanner cobol') {
            steps {
                withSonarQubeEnv('sc1') {
                    dir ('Codigo/Cobol') {
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.login=${SONAR_TOKEN} \
                        -X
                    """
                    }
                    
                }
            }
        }
        
        stage('Regresar ala carpeta principal') {
            steps {
                script {
                    dir('Codigo/C++') {
                        sh 'pwd'
                        sh 'chmod +x ./compile.sh'
                        sh 'ls -a'
                        sh '$SONARQUBE_WRAPPER/build-wrapper-linux-x86-64 --out-dir bw-output ./compile.sh'
                        sh """
                        ${scannerHome}/bin/sonar-scanner \
                        -Dsonar.login=${SONAR_TOKEN} \
                        -X
                    """
                    }
                }
            }
        }

        
    }
}
