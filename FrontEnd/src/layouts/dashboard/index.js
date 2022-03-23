import { useState, useEffect } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
// material
import { styled } from '@mui/material/styles'
//
import jwtDecode from 'jwt-decode'
import axios from 'axios'
import DashboardNavbar from './DashboardNavbar'
import DashboardSidebar from './DashboardSidebar'

// ----------------------------------------------------------------------

const APP_BAR_MOBILE = 64
const APP_BAR_DESKTOP = 92

const RootStyle = styled('div')({
  display: 'flex',
  minHeight: '100%',
  overflow: 'hidden'
})

const MainStyle = styled('div')(({ theme }) => ({
  flexGrow: 1,
  overflow: 'auto',
  minHeight: '100%',
  paddingTop: APP_BAR_MOBILE + 24,
  paddingBottom: theme.spacing(10),
  [theme.breakpoints.up('lg')]: {
    paddingTop: APP_BAR_DESKTOP + 24,
    paddingLeft: theme.spacing(2),
    paddingRight: theme.spacing(2)
  }
}))

// ----------------------------------------------------------------------

export default function DashboardLayout() {
  const [open, setOpen] = useState(false)
  const [name, setName] = useState('')
  const [image, setImage] = useState('')
  const [email, setEmail] = useState('')

  const navigate = useNavigate()

  useEffect(() => {
    const token = localStorage.getItem('token')
    if (token == null) {
      navigate('/login')
    } else {
      const decode = jwtDecode(token)
      setEmail(decode.Email)
      axios.get(`https://pegoda.azurewebsites.net/api/v1.0/users?email=${decode.Email}`)
        .then(response => {
          console.log(response.data)
          setName(response.data.name)
          setImage(response.data.image)
          localStorage.setItem('centerId', decode.centerId)
        })
        .catch(error => console.log(error))
    }
  }, [navigate])

  return (
    <RootStyle>
      <DashboardNavbar onOpenSidebar={() => setOpen(true)} name={name} image={image} email={email} />
      <DashboardSidebar isOpenSidebar={open} onCloseSidebar={() => setOpen(false)} name={name} image={image} />
      <MainStyle>
        <Outlet />
      </MainStyle>
    </RootStyle>
  )
}
