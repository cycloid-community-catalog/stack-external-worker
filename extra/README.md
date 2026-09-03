# Cycloid notes

# Update exteral workers stack templates

```bash
export AWS_ACCESS_KEY_ID=$(vault read -field=access_key secret/$CUSTOMER/aws)
export AWS_SECRET_ACCESS_KEY=$(vault read -field=secret_key secret/$CUSTOMER/aws)

# AWS
aws s3 cp aws/external-worker-aws-cf-template.yaml s3://cycloid-cloudformation/

# Flexible engine
cd flexible-engine && zip -r /tmp/flexible-engine.zip Resources/ main.yaml && cd -
aws s3 cp /tmp/flexible-engine.zip s3://cycloid-cloudformation/
```

# Publish the stack archive used as S3 fallback by startup.sh

`extra/startup.sh` first tries to `git clone` the stack from GitHub, then
falls back to a tarball hosted on the public `cycloid-cloudformation` S3
bucket. This is needed because GitHub throttles unauthenticated clones, which
breaks worker boot when a whole ASG pool clones at once.

Publish (or refresh) the archive after any change on the stack. The command
below is independent of your current directory (it `cd`s to the repository
root first), so it can be run from anywhere inside the repo:

```bash
export AWS_ACCESS_KEY_ID=$(vault read -field=access_key secret/$CUSTOMER/aws)
export AWS_SECRET_ACCESS_KEY=$(vault read -field=secret_key secret/$CUSTOMER/aws)

cd "$(git rev-parse --show-toplevel)"
git archive --format=tar.gz --prefix=stack-external-worker/ -o /tmp/stack-external-worker-master.tar.gz master
aws s3 cp /tmp/stack-external-worker-master.tar.gz s3://cycloid-cloudformation/
```

> Note: the archive is served from
> `https://s3-eu-west-1.amazonaws.com/cycloid-cloudformation/stack-external-worker-master.tar.gz`,
> matching the `STACK_S3_URL` default in `extra/startup.sh`.


