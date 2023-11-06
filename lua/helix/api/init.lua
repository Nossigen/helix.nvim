helix.api = {}

-- Buffer related stuff
helix.api.buf = {}
helix.api.buf.del_current_char = require('helix.api.buf.del_current_char')
helix.api.buf.del_current_line = require('helix.api.buf.del_current_line')
helix.api.user_input = require('helix.api.user_input')

require('helix.api.char')
require('helix.api.normal_selection')