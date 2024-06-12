pipeline {
    agent { label 'slave1' }

    environment {
        REPO_URL = 'https://github.com/marcelosanchez166/Proyecto-To-Do-List.git'
        DOCKER_IMAGE = 'todolist:latest'
        DOCKER_CONTAINER = 'todoList'
        DOCKER_NETWORK = 'microsrv'
	MYSQL_PORT = '5002'
        //ENV_FILE = '/home/oracle/todolits/.env'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${REPO_URL}", branch: 'master', credentialsId: 'github-credentials'
            }
        }

        //stage('Create .env File') {
          //  steps {
            //    script {
              //      // Crea el archivo .env con las variables necesarias
                //    sh """
                  //  cat <<EOF > ${ENV_FILE}
					//SECRET_KEY=${SECRET_KEY}
					//PORT=${PORT}
					//HOST=${HOST}

					//MYSQL_HOST=${MYSQL_HOST}
					//MYSQL_USER=${MYSQL_USER}
					//MYSQL_PASSWORD=${MYSQL_PASSWORD}

					//MAIL_USERNAME=${MAIL_USERNAME}
					//MAIL_PASSWORD=${MAIL_PASSWORD}
				//	MAIL_SERVER=${MAIL_SERVER}
					//MAIL_PORT=${MAIL_PORT}
					//MAIL_USE_TLS=${MAIL_USE_TLS}
					//EOF
                   // """
               // }
            //}
       // }

        stage('Build Docker Image') {
            steps {
                script {
                    // Construye la imagen Docker
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Elimina cualquier contenedor existente con el mismo nombre
                    sh """
                    if [ \$(docker ps -aq -f name=${DOCKER_CONTAINER}) ]; then
                        docker rm -f ${DOCKER_CONTAINER}
                    fi
                    """

                    // Ejecuta el contenedor Docker con el archivo .env
                    sh """
		    docker run --name ${DOCKER_CONTAINER} \
		    --network ${DOCKER_NETWORK} \
		    -p ${MYSQL_PORT}:${MYSQL_PORT} \
		    -d ${DOCKER_IMAGE}
                    """
		    //sh """
                    //docker run --name ${DOCKER_CONTAINER} --env-file ${ENV_FILE} -p 5002:5002 -d ${DOCKER_IMAGE}
                    //"""
                }
            }
        }
    }
}
