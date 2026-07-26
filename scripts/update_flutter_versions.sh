#!/bin/bash
set -e

# This script fetches the latest stable flutter version
# and edits the flutter-versions.yml file with it

releases_json=$(curl -s https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json)

# This function edits the flutter-versions.yml file with the given flutter version for the given docker tag
edit_versions_file_for_tag() {
    versions_file="flutter-versions.yml"
    docker_tag=$1
    version=$2

    # env for yq
    docker_tag=$docker_tag version=$version \
        yq -i '.[env(docker_tag)] = env(version)' $versions_file
}

# This function fetches the latest version of a particular channel (stable, beta) for Flutter
get_latest_version_in_channel() {
    channel=$1
    # This contains the hash of the latest version in the channel
    channel_hash=$(echo "$releases_json" | jq -r '.current_release.'"$channel")
    # Look for the version corresponding to the hash in the list of releases
    version=$(echo "$releases_json" | jq -r --arg HASH "$channel_hash" \
        '.releases[] | select(.hash == $HASH).version')

    # check not empty
    if [ -z "$version" ]; then
        echo "Error fetching latest version in channel $channel"
        exit 1
    fi

    echo "$version"
}

stable_version=$(get_latest_version_in_channel "stable")

echo "Latest stable version: $stable_version"

edit_versions_file_for_tag "latest" "$stable_version"

exit 0
