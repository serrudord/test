https://linuxhit.com/how-to-create-docker-images-with-github-actions/


https://github.com/webmagicinformatica/gitops-demo


https://stackoverflow.com/questions/51489359/docker-using-password-via-the-cli-is-insecure-use-password-stdin


run: |
        echo "${{ secrets.DOCKER_USER }}" | docker login -u "${{ secrets.DOCKER_USER }}" --password-stdin
        docker build . --file Dockerfile --tag my-image-name:$(date +%s)
        docker push ${{ secrets.DOCKER_USER }}/prueba:latest



run: |
        echo "${{ secrets.DOCKER_PASS }}" | docker login -u "${{ secrets.DOCKER_USER }}" --password-stdin
        docker build . --file Dockerfile --tag rserrudo/prueba:$(date +%s)
        docker push rserrudo/prueba:$(date +%s)



https://dev.to/cloudx/multi-arch-docker-images-the-easy-way-with-github-actions-4k54

https://github.com/pabloromeo/docker-dogecoin/blob/master/.github/workflows/main.yml