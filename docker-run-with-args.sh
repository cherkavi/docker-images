full_path=`realpath $1`
file_name="$(basename -- $full_path)"
file_name_without_ext=${file_name%.*}
file_name_output=$file_name_without_ext".output"
file_dir="$(dirname -- $full_path)"

TAG_NAME="image from docker images"

docker run --volume $file_dir:/external -t $TAG_NAME /bin/bash /root/some-script.sh $file_name $file_name_output
