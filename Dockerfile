FROM scratch
ADD main /
# RUN chmod +x /
ENTRYPOINT ["/main"]
