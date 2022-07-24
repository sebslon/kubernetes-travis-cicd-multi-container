# BUILD IMAGES, TAG EACH ONE, PUSH EACH TO DOCKER REGISTRY
# APPLY ALL CONFIGS IN ./k8s FOLDER
# IMPERATIVELY SET LATEST IMAGES ON EACH DEPLOYMENT

# https://www.juandebravo.com/2019/03/01/travis-google-kubernetes-engine-deployment/

docker build -t sebastiansloniec/multi-client:latest -t sebastiansloniec/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sebastiansloniec/multi-server:latest -t sebastiansloniec/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sebastiansloniec/multi-worker:latest -t sebastiansloniec/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sebastiansloniec/multi-client:latest
docker push sebastiansloniec/multi-server:latest
docker push sebastiansloniec/multi-worker:latest

docker push sebastiansloniec/multi-client:$SHA
docker push sebastiansloniec/multi-server:$SHA
docker push sebastiansloniec/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=sebastiansloniec/multi-client:$SHA
kubectl set image deployments/server-deployment server=sebastiansloniec/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=sebastiansloniec/multi-worker:$SHA