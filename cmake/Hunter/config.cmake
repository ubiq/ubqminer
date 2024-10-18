hunter_config(CURL VERSION ${HUNTER_CURL_VERSION} CMAKE_ARGS HTTP_ONLY=ON CMAKE_USE_OPENSSL=OFF CMAKE_USE_LIBSSH2=OFF CURL_CA_PATH=none)
hunter_config(Boost VERSION 1.83.0)
hunter_config(CLI11 VERSION 1.7.1)
hunter_config(ethash GIT_SUBMODULE "cmake/ethash")
