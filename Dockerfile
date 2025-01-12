FROM konstin2/maturin:latest

WORKDIR /usr/src/nushell
COPY nushell .

RUN yum update && yum groupinstall -y 'Development Tools'
RUN yum install -y openssl-static zlib-devel

ENV OPENSSL_STATIC=true

RUN cargo install --path . --root . --features=extra

CMD ["/bin/bash"]
