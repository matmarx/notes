- go to ~/Library/Containers/com.utmapp.UTM/Data/Documents/<VM Name>.utm/Data
- run: 
`qemu-img snapshot F89035CE-DEF9-49D7-97F8-7EC0C2F3F9D9.qcow2 -c snapshot1`
- list snapshots:
`qemu-img snapshot F89035CE-DEF9-49D7-97F8-7EC0C2F3F9D9.qcow2 -l`
- reverte snapshot:
`qemu-img snapshot F89035CE-DEF9-49D7-97F8-7EC0C2F3F9D9.qcow2 -a snapshot1`
