# Adding new profiles

Copy across one of the profile files
Fixup the class IDs so something gets loaded for the class/spec in question
Make sure the APL name matches the one in Generated-Actions.lua
Run WoW, login as character of that class/spec
Run `/tj _esd` to export the initial actions/talents listing
Paste into the profile
Reload UI
Run `/tj _dcp` to export full state information -- WoW will lock up for a few seconds while it generates the entire text output
Copypaste the output to a text file
Check the top for the error'ing items that need implementation, search for `errors = {`