FROM redis:3.2-alpine

COPY conf /conf

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD [ "redis-server" ]
