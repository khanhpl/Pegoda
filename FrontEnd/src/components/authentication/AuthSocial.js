import facebookFill from '@iconify/icons-eva/facebook-fill'
import googleFill from '@iconify/icons-eva/google-fill'
import { Icon } from '@iconify/react'
// material
import { Box, Button, Container, Link, Modal, Stack, Typography } from '@mui/material'
import axios from 'axios'
import { GoogleAuthProvider, signInWithPopup } from 'firebase/auth'
import { useState } from 'react'
import { auth } from '../../config/firebaseConfig'
import { RegisterForm } from './register'


// ----------------------------------------------------------------------

const style = {
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: 500,
  bgcolor: 'background.paper',
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
}


export default function AuthSocial() {
  const [open, setOpen] = useState(false)
  const googleProvider = new GoogleAuthProvider()

  return (
    <>
      <Stack direction="row" spacing={2}>
        <Button fullWidth size="large" color="inherit" variant="outlined"
          onClick={() => {
            signInWithPopup(auth, googleProvider)
              .then(async (result) => {
                console.log(result)
                // axios.post('https://pegoda.azurewebsites.net/api/v1.0/user/login', {
                //   email: result.user.email
                // }
                // ).then(result => console.log(result.data))
                //   .catch(error => console.error(error))
              })
              .catch(error => console.error(error))
            // setOpen(true)
          }}>
          <Icon icon={googleFill} color="#DF3E30" height={24} />
        </Button>

        <Button fullWidth size="large" color="inherit" variant="outlined">
          <Icon icon={facebookFill} color="#1877F2" height={24} />
        </Button>

        {/* <Button fullWidth size="large" color="inherit" variant="outlined">
          <Icon icon={twitterFill} color="#1C9CEA" height={24} />
        </Button> */}
      </Stack>

      {/* <Divider sx={{ my: 3 }}>
        <Typography variant="body2" sx={{ color: 'text.secondary' }}>
          OR
        </Typography>
      </Divider> */}
      <Modal open={open} onClose={() => setOpen(false)}>
        <Box sx={style}>
          <Container>
            {/* <ContentStyle> */}
            <Box sx={{ mb: 5 }}>
              <Typography variant="h4" gutterBottom>
                Get started absolutely free.
            </Typography>
              {/* <Typography sx={{ color: 'text.secondary' }}>
              Free forever. No credit card needed.
            </Typography> */}
            </Box>

            {/* <AuthSocial /> */}

            <RegisterForm />

            <Typography variant="body2" align="center" sx={{ color: 'text.secondary', mt: 3 }}>
              By registering, I agree to Minimal&nbsp;
            <Link underline="always" sx={{ color: 'text.primary' }}>
                Terms of Service
            </Link>
            &nbsp;and&nbsp;
            <Link underline="always" sx={{ color: 'text.primary' }}>
                Privacy Policy
            </Link>
            .
          </Typography>

            {/* <MHidden width="smUp">
              <Typography variant="subtitle2" sx={{ mt: 3, textAlign: 'center' }}>
                Already have an account?&nbsp;
              <Link to="/login" component={RouterLink}>
                  Login
              </Link>
              </Typography>
            </MHidden> */}
            {/* </ContentStyle> */}
          </Container>
        </Box>
      </Modal>
    </>
  )
}
