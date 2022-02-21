import PropTypes from 'prop-types'
// material
import { Box } from '@mui/material'

// ----------------------------------------------------------------------

Logo.propTypes = {
  sx: PropTypes.object
}

export default function Logo({ sx }) {
  return <Box component="img" src="https://firebasestorage.googleapis.com/v0/b/pegoda-6de8a.appspot.com/o/Pegoda.png?alt=media" sx={{ width: 100, height: 100, ...sx }} />
}
