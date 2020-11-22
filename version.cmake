set(copyq_version "v3.13.0")

set(copyq_github_sha "$ENV{GITHUB_SHA}")
if (copyq_github_sha)
    get_filename_component(copyq_github_ref "$ENV{GITHUB_REF}" NAME)
    string(SUBSTRING "${copyq_github_sha}" 0 8 copyq_github_sha)
    set(copyq_version "${copyq_version}-g${copyq_github_sha}-${copyq_github_ref}")
else()
    find_package(Git)
    if(GIT_FOUND)
        execute_process(COMMAND
            "${GIT_EXECUTABLE}" describe --tags
            RESULT_VARIABLE copyq_git_describe_result
            OUTPUT_VARIABLE copyq_git_describe_output
            ERROR_QUIET
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        if(copyq_git_describe_result EQUAL 0)
            set(copyq_version "${copyq_git_describe_output}")
        endif()
    endif()
endif()

message(STATUS "Building CopyQ version ${copyq_version}.")

configure_file("${INPUT_FILE}" "${OUTPUT_FILE}")
