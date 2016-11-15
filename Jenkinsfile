node { stage('SCM') {

		git 'https://github.com/dsxzhomework/RiskManagementProject.git'  

	}  

	stage('QA') {

		sh 'sonar-scanner'  

	}  

	stage('build') { 

       		def mvnHome = tool 'MAVEN_HOME'

		sh "${mvnHome}/bin/mvn -B clean package"

	}  

	stage('deploy') {

    		sh "docker stop my || true"

    		sh "docker rm my || true"

    		sh "docker run --name my -p 11111:8080 -d tomcat"

		sh "docker cp target/RiskManagementProject-0.0.1-SNAPSHOT.war my:/usr/local/tomcat/webapps"

	}  

	stage('results') { 

       		archiveArtifacts artifacts: '**/target/*.war', fingerprint: true  

	} 

     }