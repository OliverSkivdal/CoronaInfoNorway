#/bin/bash
curl -v -s --retry 5 -H "Accept: application/json" https://services1.arcgis.com/0MSEUqKaxRlEPj5g/arcgis/rest/services/ncov_cases/FeatureServer/2/query\?where\=1%3D1\&objectIds\=\&time\=\&geometry\=\&geometryType\=esriGeometryEnvelope\&inSR\=\&spatialRel\=esriSpatialRelIntersects\&resultType\=none\&distance\=0.0\&units\=esriSRUnit_Meter\&returnGeodetic\=false\&outFields\=\*\&returnGeometry\=false\&featureEncoding\=esriDefault\&multipatchOption\=xyFootprint\&maxAllowableOffset\=\&geometryPrecision\=\&outSR\=\&datumTransformation\=\&applyVCSProjection\=false\&returnIdsOnly\=false\&returnUniqueIdsOnly\=false\&returnCountOnly\=false\&returnExtentOnly\=false\&returnQueryGeometry\=false\&returnDistinctValues\=false\&cacheHint\=false\&orderByFields\=\&groupByFieldsForStatistics\=\&outStatistics\=\&having\=\&resultOffset\=\&resultRecordCount\=\&returnZ\=false\&returnM\=false\&returnExceededLimitFeatures\=true\&quantizationParameters\=\&sqlFormat\=none\&f\=pjson\&token\= > .reply.json
sleep 3
sed -e '1,1783d' .reply.json > .result.json
sleep 1
sed '1,8!d' .result.json > .norway.json
sed -e '2,4d' .norway.json > .filter1.json
sed 's/,//g'  .filter1.json  > .filter2.json
sed 's/"//g'  .filter2.json  > .filter3.json
cat .filter3.json | sed -r 's/^.{8}//g' > .filter4.json
clear
sed 's/ : /: /g' .filter4.json > .filter5.json
sed 's/Country_Region/Country/g' .filter5.json > .filter6.json
cat .filter6.json
echo 
