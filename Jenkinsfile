pipeline {
    agent any

    environment {
        REPO_URL = 'https://github.com/tu_usuario/tu_proyecto.git'
        DOCKER_IMAGE = 'TodoList:latest'
        DOCKER_CONTAINER = 'TodoList'
        ENV_FILE = '/home/oracle/todolits/.env'
        
        // Define tus variables de entorno aquí o usa Credenciales de Jenkins
        SECRET_KEY = 'B!1w8*NAt1T^%kvhUI*S^_'
        PORT = '5001'
        HOST = '0.0.0.0'
        
        MYSQL_HOST = '11.11.11.97'
        MYSQL_USER = 'root'
        MYSQL_PASSWORD = 'Meliodas1506'
        
        MAIL_USERNAME = 'marcelosanchez166@gmail.com'
        MAIL_PASSWORD = 'rlhb rqnk ofer dyqf'
        MAIL_SERVER = 'smtp.googlemail.com '
        MAIL_PORT = '587'
        MAIL_USE_TLS = 'True'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git init
                git url: "${REPO_URL}"
            }
        }

        stage('Create .env File') {
            steps {
                script {
                    // Crea el archivo .env con las variables necesarias
                    sh """
                    cat <<EOF > ${ENV_FILE}
SECRET_KEY=${SECRET_KEY}
PORT=${PORT}
HOST=${HOST}

MYSQL_HOST=${MYSQL_HOST}
MYSQL_USER=${MYSQL_USER}
MYSQL_PASSWORD=${MYSQL_PASSWORD}

MAIL_USERNAME=${MAIL_USERNAME}
MAIL_PASSWORD=${MAIL_PASSWORD}
MAIL_SERVER=${MAIL_SERVER}
MAIL_PORT=${MAIL_PORT}
MAIL_USE_TLS=${MAIL_USE_TLS}
EOF
                    """
                }
            }
        }

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
                    docker run --name ${DOCKER_CONTAINER} --env-file ${ENV_FILE} -p 5000:5000 -d ${DOCKER_IMAGE}
                    """
                }
            }
        }
    }
}
