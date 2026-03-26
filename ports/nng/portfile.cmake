vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO CogentEmbedded/nng
    REF 91d0c3a18406a9dca0c40abcae72d905bf8b5f94
    SHA512 e56d19b4bb7d913c20cd7569c5e2edc9152b5437e20286ccf153106a1cd25d6f77595672dcf566b45070a1e400fbaf9f67f2d0770cd3e30c916d5121482a397a
    HEAD_REF ce-release
)

vcpkg_check_features(
    OUT_FEATURE_OPTIONS FEATURE_OPTIONS
    FEATURES
        mbedtls NNG_ENABLE_TLS
        tools NNG_ENABLE_NNGCAT
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DNNG_TESTS=OFF
        ${FEATURE_OPTIONS}
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/nng)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_replace_string(
    "${CURRENT_PACKAGES_DIR}/include/nng/nng.h"
    "defined(NNG_SHARED_LIB)"
    "0 /* defined(NNG_SHARED_LIB) */"
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    vcpkg_replace_string(
        "${CURRENT_PACKAGES_DIR}/include/nng/nng.h"
        "!defined(NNG_STATIC_LIB)"
        "1 /* !defined(NNG_STATIC_LIB) */"
    )
else()
    vcpkg_replace_string(
        "${CURRENT_PACKAGES_DIR}/include/nng/nng.h"
        "!defined(NNG_STATIC_LIB)"
        "0 /* !defined(NNG_STATIC_LIB) */"
    )
endif()

if ("tools" IN_LIST FEATURES)
    vcpkg_copy_tools(TOOL_NAMES nngcat AUTO_CLEAN)
endif()

file(INSTALL "${SOURCE_PATH}/LICENSE.txt" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)

vcpkg_copy_pdbs()
