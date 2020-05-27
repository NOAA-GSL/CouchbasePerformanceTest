#!	/usr/bin/env bash
Usage="usage: $0 -s server [-p(prints prologue)]"
server=""
read -d '' prologue << PEOF
This is a test of a query captured from a basic die-off plot from the metviewer at
http://137.75.129.120:8080/metviewer-mysql/servlet  - historical plot named 20200515_162720.
PEOF
while getopts 'hps:' OPTION; do
  case "$OPTION" in
    h)
      echo "$Usage"
      ;;

    p)
      echo $prologue
      exit 1
      ;;
    s)
      server="$OPTARG"
      ;;
    *?)
      echo "$Usage" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"
if [ "X${server}" = "X" ]; then
	echo "No server specified: $Usage"
	exit 1
else
	echo "Using server $server"
fi
/opt/couchbase/bin/cbq -o "output/$0.json" -q -e couchbase://${server}/mdata -u met_admin -p met_adm_pwd <<-'EOF' 
SELECT raw data
FROM (
    SELECT *
    FROM mdata
    WHERE model == "GFS"
        AND dataType == "VSDB_V01_SAL1L2"
        AND subset == "mv_gfs_grid2obs_vsdb"
        AND geoLocation_id IN ["G2/NHX","G2/SHX"]
        AND fcst_var == "HGT"
        AND fcst_lev in ['P10', 'P20', 'P30', 'P50', 'P70', 'P100', 'P150', 'P200', 'P250', 'P300', 'P400', 'P500', 'P700', 'P850', 'P925', 'P1000']
        AND fcst_valid_beg IN 
	[
	'2019-01-01T00:00:00Z',
	'2019-01-01T06:00:00Z',
	'2019-01-01T12:00:00Z',
	'2019-01-01T18:00:00Z',
	'2019-01-02T00:00:00Z',
	'2019-01-02T06:00:00Z',
	'2019-01-02T12:00:00Z',
	'2019-01-02T18:00:00Z',
	'2019-01-03T00:00:00Z',
	'2019-01-03T06:00:00Z',
	'2019-01-03T12:00:00Z',
	'2019-01-03T18:00:00Z',
	'2019-01-04T00:00:00Z',
	'2019-01-04T06:00:00Z',
	'2019-01-04T12:00:00Z',
	'2019-01-04T18:00:00Z',
	'2019-01-05T00:00:00Z',
	'2019-01-05T06:00:00Z',
	'2019-01-05T12:00:00Z',
	'2019-01-05T18:00:00Z',
	'2019-01-06T00:00:00Z',
	'2019-01-06T06:00:00Z',
	'2019-01-06T12:00:00Z',
	'2019-01-06T18:00:00Z',
	'2019-01-07T00:00:00Z',
	'2019-01-07T06:00:00Z',
	'2019-01-07T12:00:00Z',
	'2019-01-07T18:00:00Z',
	'2019-01-08T00:00:00Z',
	'2019-01-08T06:00:00Z',
	'2019-01-08T12:00:00Z',
	'2019-01-08T18:00:00Z',
	'2019-01-09T00:00:00Z',
	'2019-01-09T06:00:00Z',
	'2019-01-09T12:00:00Z',
	'2019-01-09T18:00:00Z',
	'2019-01-10T00:00:00Z',
	'2019-01-10T06:00:00Z',
	'2019-01-10T12:00:00Z',
	'2019-01-10T18:00:00Z',
	'2019-01-11T00:00:00Z',
	'2019-01-11T06:00:00Z',
	'2019-01-11T12:00:00Z',
	'2019-01-11T18:00:00Z',
	'2019-01-12T00:00:00Z',
	'2019-01-12T06:00:00Z',
	'2019-01-12T12:00:00Z',
	'2019-01-12T18:00:00Z',
	'2019-01-13T00:00:00Z',
	'2019-01-13T06:00:00Z',
	'2019-01-13T12:00:00Z',
	'2019-01-13T18:00:00Z',
	'2019-01-14T00:00:00Z',
	'2019-01-14T06:00:00Z',
	'2019-01-14T12:00:00Z',
	'2019-01-14T18:00:00Z',
	'2019-01-15T00:00:00Z',
	'2019-01-15T06:00:00Z',
	'2019-01-15T12:00:00Z',
	'2019-01-15T18:00:00Z',
	'2019-01-16T00:00:00Z',
	'2019-01-16T06:00:00Z',
	'2019-01-16T12:00:00Z',
	'2019-01-16T18:00:00Z',
	'2019-01-17T00:00:00Z',
	'2019-01-17T06:00:00Z',
	'2019-01-17T12:00:00Z',
	'2019-01-17T18:00:00Z',
	'2019-01-18T00:00:00Z',
	'2019-01-18T06:00:00Z',
	'2019-01-18T12:00:00Z',
	'2019-01-18T18:00:00Z',
	'2019-01-19T00:00:00Z',
	'2019-01-19T06:00:00Z',
	'2019-01-19T12:00:00Z',
	'2019-01-19T18:00:00Z',
	'2019-01-20T00:00:00Z',
	'2019-01-20T06:00:00Z',
	'2019-01-20T12:00:00Z',
	'2019-01-20T18:00:00Z',
	'2019-01-21T00:00:00Z',
	'2019-01-21T06:00:00Z',
	'2019-01-21T12:00:00Z',
	'2019-01-21T18:00:00Z',
	'2019-01-22T00:00:00Z',
	'2019-01-22T06:00:00Z',
	'2019-01-22T12:00:00Z',
	'2019-01-22T18:00:00Z',
	'2019-01-23T00:00:00Z',
	'2019-01-23T06:00:00Z',
	'2019-01-24T00:00:00Z',
	'2019-01-24T06:00:00Z',
	'2019-01-24T12:00:00Z',
	'2019-01-24T18:00:00Z',
	'2019-01-25T00:00:00Z',
	'2019-01-25T06:00:00Z',
	'2019-01-25T12:00:00Z',
	'2019-01-25T18:00:00Z',
	'2019-01-26T00:00:00Z',
	'2019-01-26T06:00:00Z',
	'2019-01-26T12:00:00Z',
	'2019-01-26T18:00:00Z',
	'2019-01-27T00:00:00Z',
	'2019-01-27T06:00:00Z',
	'2019-01-27T12:00:00Z',
	'2019-01-27T18:00:00Z',
	'2019-01-28T00:00:00Z',
	'2019-01-28T06:00:00Z',
	'2019-01-28T12:00:00Z',
	'2019-01-28T18:00:00Z',
	'2019-01-29T00:00:00Z',
	'2019-01-29T06:00:00Z',
	'2019-01-29T12:00:00Z',
	'2019-01-29T18:00:00Z',
	'2019-01-30T00:00:00Z',
	'2019-01-30T06:00:00Z',
	'2019-01-30T12:00:00Z',
	'2019-01-30T18:00:00Z',
	'2019-01-31T00:00:00Z',
	'2019-01-31T06:00:00Z',
	'2019-01-31T12:00:00Z',
	'2019-01-31T18:00:00Z',
	'2019-02-01T00:00:00Z',
	'2019-02-01T06:00:00Z',
	'2019-02-01T12:00:00Z',
	'2019-02-01T18:00:00Z',
	'2019-02-02T00:00:00Z',
	'2019-02-02T06:00:00Z',
	'2019-02-02T12:00:00Z',
	'2019-02-02T18:00:00Z',
	'2019-02-03T00:00:00Z',
	'2019-02-03T06:00:00Z',
	'2019-02-03T12:00:00Z',
	'2019-02-03T18:00:00Z',
	'2019-02-04T00:00:00Z',
	'2019-02-04T06:00:00Z',
	'2019-02-04T12:00:00Z',
	'2019-02-04T18:00:00Z',
	'2019-02-05T00:00:00Z',
	'2019-02-05T06:00:00Z',
	'2019-02-05T12:00:00Z',
	'2019-02-05T18:00:00Z',
	'2019-02-06T00:00:00Z',
	'2019-02-06T06:00:00Z',
	'2019-02-06T12:00:00Z',
	'2019-02-06T18:00:00Z',
	'2019-02-07T00:00:00Z',
	'2019-02-07T06:00:00Z',
	'2019-02-07T12:00:00Z',
	'2019-02-07T18:00:00Z',
	'2019-02-08T00:00:00Z',
	'2019-02-08T06:00:00Z',
	'2019-02-08T12:00:00Z',
	'2019-02-08T18:00:00Z',
	'2019-02-09T00:00:00Z',
	'2019-02-09T06:00:00Z',
	'2019-02-09T12:00:00Z',
	'2019-02-09T18:00:00Z',
	'2019-02-10T00:00:00Z',
	'2019-02-10T06:00:00Z',
	'2019-02-10T12:00:00Z',
	'2019-02-10T18:00:00Z',
	'2019-02-11T00:00:00Z',
	'2019-02-11T06:00:00Z',
	'2019-02-11T12:00:00Z',
	'2019-02-11T18:00:00Z',
	'2019-02-12T00:00:00Z',
	'2019-02-12T06:00:00Z',
	'2019-02-12T12:00:00Z',
	'2019-02-12T18:00:00Z',
	'2019-02-13T00:00:00Z',
	'2019-02-13T06:00:00Z',
	'2019-02-13T12:00:00Z',
	'2019-02-13T18:00:00Z',
	'2019-02-14T00:00:00Z',
	'2019-02-14T06:00:00Z',
	'2019-02-14T12:00:00Z',
	'2019-02-14T18:00:00Z',
	'2019-02-15T00:00:00Z',
	'2019-02-15T06:00:00Z',
	'2019-02-15T12:00:00Z',
	'2019-02-15T18:00:00Z',
	'2019-02-16T00:00:00Z',
	'2019-02-16T06:00:00Z',
	'2019-02-16T12:00:00Z',
	'2019-02-16T18:00:00Z',
	'2019-02-17T00:00:00Z',
	'2019-02-17T06:00:00Z',
	'2019-02-17T12:00:00Z',
	'2019-02-17T18:00:00Z',
	'2019-02-18T00:00:00Z',
	'2019-02-18T06:00:00Z',
	'2019-02-18T12:00:00Z',
	'2019-02-18T18:00:00Z',
	'2019-02-19T00:00:00Z',
	'2019-02-19T06:00:00Z',
	'2019-02-19T12:00:00Z',
	'2019-02-19T18:00:00Z',
	'2019-02-20T00:00:00Z',
	'2019-02-20T06:00:00Z',
	'2019-02-20T12:00:00Z',
	'2019-02-20T18:00:00Z',
	'2019-02-21T00:00:00Z',
	'2019-02-21T06:00:00Z',
	'2019-02-21T12:00:00Z',
	'2019-02-21T18:00:00Z',
	'2019-02-22T00:00:00Z',
	'2019-02-22T06:00:00Z',
	'2019-02-22T12:00:00Z',
	'2019-02-22T18:00:00Z',
	'2019-02-23T00:00:00Z',
	'2019-02-23T06:00:00Z',
	'2019-02-23T12:00:00Z',
	'2019-02-23T18:00:00Z',
	'2019-02-24T00:00:00Z',
	'2019-02-24T06:00:00Z',
	'2019-02-24T12:00:00Z',
	'2019-02-24T18:00:00Z',
	'2019-02-25T00:00:00Z',
	'2019-02-25T06:00:00Z',
	'2019-02-25T12:00:00Z',
	'2019-02-25T18:00:00Z',
	'2019-02-26T00:00:00Z',
	'2019-02-26T06:00:00Z',
	'2019-02-26T12:00:00Z',
	'2019-02-26T18:00:00Z',
	'2019-02-27T00:00:00Z',
	'2019-02-27T06:00:00Z',
	'2019-02-27T12:00:00Z',
	'2019-02-27T18:00:00Z',
	'2019-02-28T00:00:00Z',
	'2019-02-28T06:00:00Z',
	'2019-02-28T12:00:00Z',
	'2019-02-28T18:00:00Z',
	'2019-03-01T00:00:00Z',
	'2019-03-01T06:00:00Z',
	'2019-03-01T12:00:00Z',
	'2019-03-01T18:00:00Z',
	'2019-03-02T00:00:00Z',
	'2019-03-02T06:00:00Z',
	'2019-03-02T12:00:00Z',
	'2019-03-02T18:00:00Z',
	'2019-03-03T00:00:00Z',
	'2019-03-03T06:00:00Z',
	'2019-03-03T12:00:00Z',
	'2019-03-03T18:00:00Z',
	'2019-03-04T00:00:00Z',
	'2019-03-04T06:00:00Z',
	'2019-03-04T12:00:00Z',
	'2019-03-04T18:00:00Z',
	'2019-03-05T00:00:00Z',
	'2019-03-05T06:00:00Z',
	'2019-03-05T12:00:00Z',
	'2019-03-05T18:00:00Z',
	'2019-03-06T00:00:00Z',
	'2019-03-06T06:00:00Z',
	'2019-03-06T12:00:00Z',
	'2019-03-06T18:00:00Z',
	'2019-03-07T00:00:00Z',
	'2019-03-07T06:00:00Z',
	'2019-03-07T12:00:00Z',
	'2019-03-07T18:00:00Z',
	'2019-03-08T00:00:00Z',
	'2019-03-08T06:00:00Z',
	'2019-03-08T12:00:00Z',
	'2019-03-08T18:00:00Z',
	'2019-03-09T00:00:00Z',
	'2019-03-09T06:00:00Z',
	'2019-03-09T12:00:00Z',
	'2019-03-09T18:00:00Z',
	'2019-03-10T00:00:00Z'
	]) AS r
UNNEST r.mdata.data AS data
WHERE data.fcst_lead IN ['144']
ORDER BY data.fcst_valid_beg, data.fcst_init_beg, r.mdata.fcst_lev, r.mdata.geoLocation_id, data.fcst_lead;
EOF
cat "output/$0.json" | grep -vi select | jq -r '.results | (map(keys) | add | unique) as $cols | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[] | @tsv' | column -t > "output/$0.out"
awk '{printf "%f\n", $1}' "output/$0.out" > "output/$0.fabar.out" 
