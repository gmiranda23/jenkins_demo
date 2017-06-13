name 'jenkins_demo'
maintainer 'George Miranda'
maintainer_email 'gmiranda@chef.io'
license 'all_rights'
description 'Sets up a Jenkins Server to build Habitat plans'
long_description 'Sets up a Jenkins Server to build Habitat plans'
version '0.1.3'

depends 'jenkins'
depends 'habitat'
depends 'sudo'

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Issues` link
# issues_url 'https://github.com/<insert_org_here>/jenkins_demo/issues' if respond_to?(:issues_url)

# If you upload to Supermarket you should set this so your cookbook
# gets a `View Source` link
# source_url 'https://github.com/<insert_org_here>/jenkins_demo' if respond_to?(:source_url)
