import * as Yup from 'yup'
import { useState } from 'react'
import { Icon } from '@iconify/react'
import { useFormik, Form, FormikProvider } from 'formik'
import eyeFill from '@iconify/icons-eva/eye-fill'
import eyeOffFill from '@iconify/icons-eva/eye-off-fill'
import { useNavigate } from 'react-router-dom'
// material
import { Stack, TextField, IconButton, InputAdornment } from '@mui/material'
import { LoadingButton } from '@mui/lab'
import axios from 'axios'

// ----------------------------------------------------------------------

export default function RegisterForm({ setOpen, email }) {
  const navigate = useNavigate()
  const [showPassword, setShowPassword] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)

  const RegisterSchema = Yup.object().shape({
    // firstName: Yup.string()
    //   .min(2, 'Too Short!')
    //   .max(50, 'Too Long!')
    //   .required('First name required'),
    // lastName: Yup.string().min(2, 'Too Short!').max(50, 'Too Long!').required('Last name required'),
    // email: Yup.string().email('Email must be a valid email address').required('Email is required'),
    // password: Yup.string().required('Password is required'),
    fullName: Yup.string().min(2, 'Too Short!').max(30, 'Too Long!').required('Full Name is required'),
    address: Yup.string().min(5, 'Too Short!').max(40, 'Too Long!').required('Address is required')
  })

  const formik = useFormik({
    initialValues: {
      // firstName: '',
      // lastName: '',
      // email: '',
      // password: '',
      fullName: '',
      address: ''
    },
    validationSchema: RegisterSchema,
    onSubmit: (value) => {
      console.log(value)
      setIsSubmitting(true)
      axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
        'name': value.fullName,
        'email': email,
        'image': null,
        'address': value.address,
        'roleId': '4aed7714-efbe-421c-5f5a-08d9f62291f6'
      }).then(response => {
        console.log(response.data)
        setOpen(false)
        axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/login', {
          email
        }
        ).then(response => {
          console.log(response.data)
          localStorage.setItem('token', response.data.token)
          navigate('/dashboard')
        })
          .catch(error => {
            console.log(error.response)
          })

        // navigate('/dashboard')
      })
        .catch(error => console.log(error))
    }
  })

  // const { errors, touched, isSubmitting, getFieldProps, handleSubmit } = formik
  const { errors, touched, getFieldProps, handleSubmit } = formik


  return (
    <FormikProvider value={formik}>
      <Form autoComplete="off" noValidate onSubmit={handleSubmit}>
        <Stack spacing={3}>
          {/* <Stack direction={{ xs: 'column', sm: 'row' }} spacing={2}>
            <TextField
              fullWidth
              label="First name"
              {...getFieldProps('firstName')}
              error={Boolean(touched.firstName && errors.firstName)}
              helperText={touched.firstName && errors.firstName}
            />

            <TextField
              fullWidth
              label="Last name"
              {...getFieldProps('lastName')}
              error={Boolean(touched.lastName && errors.lastName)}
              helperText={touched.lastName && errors.lastName}
            />
          </Stack> */}

          <TextField
            fullWidth
            label="Tên"
            {...getFieldProps('fullName')}
            error={Boolean(touched.fullName && errors.fullName)}
            helperText={touched.fullName && errors.fullName}
          />

          {/* <TextField
            fullWidth
            autoComplete="username"
            type="email"
            label="Email address"
            {...getFieldProps('email')}
            error={Boolean(touched.email && errors.email)}
            helperText={touched.email && errors.email}
          /> */}

          <TextField
            fullWidth
            label="Địa Chỉ"
            {...getFieldProps('address')}
            error={Boolean(touched.address && errors.address)}
            helperText={touched.address && errors.address}
          />

          {/* <TextField
            fullWidth
            autoComplete="current-password"
            type={showPassword ? 'text' : 'password'}
            label="Password"
            {...getFieldProps('password')}
            InputProps={{
              endAdornment: (
                <InputAdornment position="end">
                  <IconButton edge="end" onClick={() => setShowPassword((prev) => !prev)}>
                    <Icon icon={showPassword ? eyeFill : eyeOffFill} />
                  </IconButton>
                </InputAdornment>
              )
            }}
            error={Boolean(touched.password && errors.password)}
            helperText={touched.password && errors.password}
          /> */}

          <LoadingButton
            fullWidth
            size="large"
            type="submit"
            variant="contained"
            loading={isSubmitting}
          >
            Register
          </LoadingButton>
        </Stack>
      </Form>
    </FormikProvider>
  )
}
