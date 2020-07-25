FROM gcr.io/cloud-builders/git

ENV CUSTOM_REPO_USER ""
ENV CUSTOM_REPO_PASSWORD ""
ENV CUSTOM_REPO_URL ""
ENV CUSTOM_REPO_COMMIT ""

COPY updateRepoToCommit.sh /builder/updateRepoToCommit.sh
RUN chmod +700 /builder/updateRepoToCommit.sh
ENTRYPOINT ["/builder/updateRepoToCommit.sh"]
