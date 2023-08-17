https://linuxhit.com/how-to-create-docker-images-with-github-actions/


https://github.com/webmagicinformatica/gitops-demo


https://stackoverflow.com/questions/51489359/docker-using-password-via-the-cli-is-insecure-use-password-stdin


run: |
        echo "${{ secrets.DOCKER_USER }}" | docker login -u "${{ secrets.DOCKER_USER }}" --password-stdin
        docker build . --file Dockerfile --tag my-image-name:$(date +%s)
        docker push ${{ secrets.DOCKER_USER }}/prueba:latest
