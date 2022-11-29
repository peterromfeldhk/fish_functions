function json-to-table
  nix-shell -p jq csvkit --run "
    jq -r 'map([leaf_paths as $path | {\"key\": $path | join(\".\"), \"value\": getpath($path)}] | from_entries)
      | (map(keys) | add | unique) as $cols
      | map(. as $row | $cols | map($row[.])) as $rows | $cols, $rows[]
      | @csv' | csvlook
    "
end
