// see https://github.com/coresolutions-ltd/jenkins-terraform-pipeline/blob/master/Jenkinsfile
def FAILED_STAGE = 'None'
properties([
    parameters([
      choice(choices:['create', 'update', 'delete'],
                description:'Deployment actions',
                name:'action'),
      string(defaultValue: '', description: 'DeploymentId for given deployment. Deployment id will be always same for complete lifecycle of deploy', name: 'deploymentId', trim: true),
      string(defaultValue: '', description: 'Deployment Json with all details of json ', name: 'deploymentParameters'),
      string(defaultValue: '', description: 'run ID is unique id to identify specific run of deployment', name: 'runId'),
    ])
])

pipeline {
    options
    {
        skipStagesAfterUnstable()
    }
    
    agent any
    
    environment {
        apiserver = "${env.PIPOD_API_ENDPOINT}"
        pipodProvider = "${env.PIPOD_ACCOUNT_PROVIDER}"
        pipodtoken = "${env.PIPOD_TOKEN}"
        pipodBucket = "${env.PIPOD_BUCKET}"
        pipodRegion = "${env.PIPOD_REGION}"
    }
    
    stages {
        stage('Checkout') {
            steps {
                script {
                    try {
                        doCheckout()
                    } catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        throw exc
                    }
                }
            }
        }

        stage('Validate') {
            steps {
                script {
                    try {
                        doValidate()
                        doLog("${deploymentId}", "${runId}", 'info', 'Validation completed')
                    } catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        doLog("${deploymentId}", "${runId}", 'error', 'Validation failed')
                        throw exc
                    }
                }
            }
        }

        stage('Init') {
            steps {
                script {
                    try {
                        doInit()
                        doLog("${deploymentId}", "${runId}", 'info', 'Initialization completed')
                    }
                    catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        doLog("${deploymentId}", "${runId}", 'error', 'Initialization failed')
                        throw exc
                    }
                }
            }
        }

        stage('Deploy') {
            when { expression { params.action  == 'create' || params.action  == 'update' } }
            steps {
                script {
                    try {
                        doDeploy()
                        updatePipelineStatus('complete')
                    }
                    catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        throw exc
                    }
                }
            }
        }

        // execute seed stage only for create operation         
        stage('Seed') {
          when { expression { params.action  == 'create' } }
          steps {
            script {
              try {
                echo ""
                doLog("${deploymentId}", "${runId}", 'info', 'Executing seed stage for the catalog')
                doSeed()
                doLog("${deploymentId}", "${runId}", 'info', 'Execution of seed stage completed')
              }
              catch (exc) {
                echo "Error occurred at ${env.STAGE_NAME}"

                updatePipelineStatus('failed')
                doLog("${deploymentId}", "${runId}", 'error', 'Execution of seed stage failed')
                throw exc
              }
            }
          }
        }

        stage('Test') {
            when { expression { params.action  == 'create' || params.action  == 'update' } }
            steps {
                script {
                    try {
                        doLog("${deploymentId}", "${runId}", 'info', 'Testing connectivity to deployment')
                        doTest()
                        updatePipelineStatus('active')
                        doLog("${deploymentId}", "${runId}", 'info', 'Connectivity test completed')
                    }
                    catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        doLog("${deploymentId}", "${runId}", 'error', 'Connectivity test failed')
                        throw exc
                    }
                }
            }
        }

        stage('Destroy') {
            when { expression { params.action  == 'delete' } }
            steps {
                script {
                    try {
                        doDestroy()
                        updatePipelineStatus('complete')
                    }
                    catch (exc) {
                        echo "Error occurred at ${env.STAGE_NAME}"
                        updatePipelineStatus('failed')
                        throw exc
                    }
                }
            }
        }
    }

    post {
        cleanup {
            echo '=== performing cleanup'
            deleteDir()
        }
    }
}

def doLog(deploymentId, runId, info, message) {
    script {
        // import log.sh file and call a 'writeLog' method with parameters
        sh("""#!/bin/bash
            cd engine/scripts;
            . ./log.sh;
            writeLog -d ${deploymentId} -r ${runId} -i ${info} -m "${message}";
        """)
    }
}

def doCheckout() {
    script {
        sh "echo 'Checking out given branch…'"
        FAILED_STAGE = env.STAGE_NAME

        createEnv()
        
        sh("""#!/bin/bash
            cd $deploymentId
            cat common.auto.tfvars
            cat deployment.auto.tfvars
        """)
        
        checkout scm
    }
}

def doInit() {
    script {
        echo "=== start doInit ==="
        echo "=== api server = $apiserver"
        
        FAILED_STAGE = env.STAGE_NAME
        
        sh ". ${deploymentId}/provider.env 2>/dev/null;"
        
        if (pipodProvider.equals('azure')) {
            withCredentials([string(credentialsId: 'PIPOD_ACCOUNT_AZURE', variable: 'SECRET')]) {
                sh "./engine/002-init.sh -s ${SECRET};"
            }
        } else if (pipodProvider.equals('aws')){
            sh "./engine/002-init.sh;"
        }
        
        sh('''#!/bin/bash
              #To give permission to log.sh file
              chmod +x engine/scripts/log.sh;
              chmod +x engine/scripts/create-tags.sh;
        ''')
        
        echo "=== end doInit ==="
    }
}

def doValidate() {
    script {
        echo "=== start doValidate ==="
        
        FAILED_STAGE = env.STAGE_NAME
        sh('''#!/bin/bash
            . ${deploymentId}/provider.env 2>/dev/null;
            ./engine/001-validate.sh;
        ''')

        echo "=== end doValidate ==="
    }
}

def doDeploy() {
    script {
        echo "=== start doDeploy ==="

        FAILED_STAGE = env.STAGE_NAME
        sh('''
            . ${deploymentId}/provider.env 2>/dev/null;
            ./engine/003-deploy.sh;
        ''')

        echo "=== end doDeploy ==="
    }
}

def doSeed() {
  script {
    FAILED_STAGE = env.STAGE_NAME
    
    sh('''
      . ${deploymentId}/provider.env 2>/dev/null;
      ./engine/004-seed.sh;
    ''')
  }
}

def doTest() {
    script {
        FAILED_STAGE = env.STAGE_NAME
        sh('''
             chmod +x engine/007-test.sh;
             ./engine/007-test.sh;
         ''')
    }
}

def doDestroy() {
    script {
        FAILED_STAGE = env.STAGE_NAME
        sh('''
          . ${deploymentId}/provider.env 2>/dev/null;
          ./engine/005-destroy.sh
        ''')
    }
}

def createEnv() {
    createDeploymentDir()
    
    sh("""
        echo "=== removing tfvars file if any"
        rm -f common.auto.tfvars deployment.auto.tfvars provider.env
        
        echo "=== print folder contents"
        ls -al

        echo "=== creating common.auto.tfvars file"
        cd ${params.deploymentId}
        cat > common.auto.tfvars << EOL
PIPOD_BUILD_ID=${BUILD_ID}
PIPOD_JOB_NAME=${JOB_NAME}
PIPOD_DEPLOYMENT_ID="${params.deploymentId}"
PIPOD_RUN_ID="${params.runId}"
PIPOD_OPERATION="${params.action}"
    """)

    echo "=== creating deployment.auto.tfvars file"
    sh 'chmod +x engine/scripts/create-tfvars.sh;'
    def json = readJSON text: "${params.deploymentParameters}"
    json.each { key, value ->
        sh("""#!/bin/bash
            . ./engine/scripts/create-tfvars.sh;
            writeToTfvarFile -k ${key} -v ${value} -d ${params.deploymentId}/deployment.auto.tfvars;
        """)
    }
    
    // check the provider and load credentials accordingly
    def provider = json['provider']
    def accountid = json['account']
    loadBackendAccountDetails(pipodProvider)
    loadProviderAccountDetails(provider, accountid)
}

def createDeploymentDir() {
    script {
        FAILED_STAGE = env.STAGE_NAME
        sh('''
            mkdir -p ${deploymentId}/.aws;
            touch ${deploymentId}/provider.env
        ''')
    }
}

def updatePipelineStatus(state) {
    def fstate
    if (state.equals('complete') || state.equals('active')) {
        fstate = 'None'
    } else {
        fstate = 'somestate'
    }
    
    sh("""
         chmod +x engine/scripts/update-run-details.sh
         ./engine/scripts/update-run-details.sh -f ${fstate} -d ${params.deploymentId} -r ${params.runId} -a ${apiserver} -s ${state}
    """)
}

def loadBackendAccountDetails(pipodProvider) {
  echo "pipodProvider = $pipodProvider"
  if (pipodProvider.equals('aws')) {
    withCredentials([[
      $class: 'AmazonWebServicesCredentialsBinding',
      credentialsId: 'PIPOD_ACCOUNT_AWS',
      accessKeyVariable: 'AWSAccessKeyId',
      secretKeyVariable: 'AWSSecretKey'
      ]]) {
        sh( """
          ls
          echo "[piPodBackend]" >> ${deploymentId}/.aws/credentials
          echo "aws_access_key_id = $AWSAccessKeyId" >> ${deploymentId}/.aws/credentials
          echo "aws_secret_access_key = $AWSSecretKey" >> ${deploymentId}/.aws/credentials
        """
        )
      }
  }
}

def loadProviderAccountDetails(provider, accountid) {
    echo "provider =  $provider"
    echo "accountid =  $accountid"

    if (provider.equals('azure')) {
        withCredentials([azureServicePrincipal("$accountid")])
        {
            sh( """
                ls
                cd ${params.deploymentId}
                echo "set +x" >> provider.env
                echo "export ARM_CLIENT_ID=$AZURE_CLIENT_ID" >> provider.env
                echo "export ARM_CLIENT_SECRET=$AZURE_CLIENT_SECRET" >> provider.env
                echo "export ARM_TENANT_ID=$AZURE_TENANT_ID" >> provider.env
                echo "export ARM_SUBSCRIPTION_ID=$AZURE_SUBSCRIPTION_ID" >> provider.env
                echo "set -x" >> provider.env
            """
            )
        }
    } else if (provider.equals('aws')) {
        echo 'adding aws creds '
        withCredentials([[
            $class: 'AmazonWebServicesCredentialsBinding',
            credentialsId: "$accountid",
            accessKeyVariable: 'AWSAccessKeyId',
            secretKeyVariable: 'AWSSecretKey'
            ]]) {
                sh( """
                    ls
                    echo "[default]" >> ${deploymentId}/.aws/credentials
                    echo "aws_access_key_id = $AWSAccessKeyId" >> ${deploymentId}/.aws/credentials
                    echo "aws_secret_access_key = $AWSSecretKey" >> ${deploymentId}/.aws/credentials
                """
                )
            }
    }
}
