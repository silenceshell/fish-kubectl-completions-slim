set __kubectl_resources          \
  all                            \
  clusterrolebindings            \
  clusterroles                   \
  clusters                       \
  configmaps cm        \
  cronjobs                       \
  daemonsets ds                  \
  deployments  \
  endpoints ep                   \
  events ev                      \
  horizontalpodautoscalers hpa   \
  ingresses ing          \
  jobs                           \
  limitranges limits             \
  namespaces ns        \
  networkpolicies netpol         \
  nodes no                  \
  persistentvolumeclaims pvc     \
  persistentvolumes pv           \
  pods                     \
  replicasets rs                 \
  replicationcontrollers rc      \
  resourcequotas quota           \
  rolebindings                   \
  roles                          \
  secrets                  \
  serviceaccounts sa             \
  services svc           \
  statefulsets               \
  storageclass storageclasses sc

function __fish_print_resource -d 'Print a list of resources' -a resource
  kubectl get "$resource" -o name \
    | string replace -r '(.*)/' ''
end

set __fish_kubectl_subresource_commands get describe delete edit

for subcmd in $__fish_kubectl_subresource_commands
  for r in $__kubectl_resources
      complete -f -c kubectl -n "__fish_seen_subcommand_from $subcmd; and __fish_seen_subcommand_from $r" -a "(__fish_print_resource $r)" -d 'Resource'
  end

  complete -c kubectl -f -n "__fish_seen_subcommand_from $subcmd; and not __fish_seen_subcommand_from (__fish_print_resource_types)" -a '(__fish_print_resource_types)' -d 'Resource'
end

complete -c kubectl -A -f -n '__fish_seen_subcommand_from exec' -a '(__fish_print_resource pods)' -d "Exec Pod"
complete -c kubectl -A -f -n '__fish_seen_subcommand_from logs' -a '(__fish_print_resource pods)' -d "Log Pod"

function __fish_print_resource_types
  for r in $__kubectl_resources
    echo $r
  end
end
