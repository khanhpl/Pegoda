import PropTypes from 'prop-types'
// material
import { Box } from '@mui/material'

// ----------------------------------------------------------------------

Logo.propTypes = {
  sx: PropTypes.object,
  width: PropTypes.number,
  height: PropTypes.number
}

export default function Logo({ sx, width, height }) {
  return <Box component="img" src="https://firebasestorage.googleapis.com/v0/b/pegoda-6de8a.appspot.com/o/Pegoda.png?alt=media" sx={{ ...sx }} width={width} height={height} />
}
