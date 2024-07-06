function titaness-shell -d "Open a shell on an ECS node"
    argparse 'p/profile=' 's/service=' 'c/cluster=' -- $argv

    if test -n "$_flag_profile"
        set -f profile $_flag_profile
    else
        set -f profile "production"
    end

    if test -n "$_flag_cluster"
        set -f cluster $_flag_cluster
    else
        set -f cluster "prod-cluster"
    end

    if test -n "$_flag_service"
        set -f service $_flag_service
    else
        set -f service "titaness-worker"
    end

    echo "Connecting to $cluster/$service ($profile)"

    set -f cluster_arn $(aws ecs list-clusters --profile $profile --query "clusterArns[?contains(@, '$cluster')] | [0]" --output text)
    set -f service_arn $(aws ecs list-services --profile $profile --cluster "$cluster_arn" --query "serviceArns[?contains(@, '$service')] | [0]" --output text)
    set -f task_arn $(aws ecs list-tasks --profile $profile --service-name "$service_arn" --cluster "$cluster_arn" --query 'taskArns[0]' --output text)
    aws ecs execute-command --profile "$profile" --cluster "$cluster" --task "$task_arn" --container $service --command "/bin/bash" --interactive
end
