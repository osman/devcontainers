czg-helper() {
  ## Try to auto-detect a JIRA ID
  branch_name=$(git rev-parse --abbrev-ref HEAD)
  jira_id=$(echo -n "${branch_name}" | sed -r 's!^(feature|hotfix|bugfix|initiative)/([A-Z]+-[0-9]+)(-.*)?$!\2!g')
  detected_scope=$([ -n "${jira_id}" ] && [ "${jira_id}" != "${branch_name}" ] && echo "${jira_id}" || true)

  case "$(echo -n "${branch_name}" | egrep -o '^(feature|hotfix|bugfix|initiative)(/.+)?$' | cut -d'/' -f1)" in
  feature | initiative)
    detected_type=feat
    ;;
  bugfix | hotfix)
    detected_type=fix
    ;;
  *)
    detected_type=
    ;;
  esac

  DEFAULT_TYPE="${detected_type}" DEFAULT_SCOPE="${detected_scope}" czg
}
