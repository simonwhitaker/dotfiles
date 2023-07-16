function s2a-login --description "Log in to AWS for this session only"

    set -x SAML2AWS_CREDENTIALS_FILE (mktemp)
    if saml2aws login --force --skip-prompt --cache-saml $argv
        set _aws_role (grep x_principal_arn $SAML2AWS_CREDENTIALS_FILE 2>/dev/null | cut -d/ -f2)
        saml2aws script | source
        set -gx S2A_AWS_ROLE "$_aws_role"
    end
    rm -rf $SAML2AWS_CREDENTIALS_FILE
end