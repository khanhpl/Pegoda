/* eslint-disable arrow-body-style */
/* eslint-disable no-unused-expressions */
/* eslint-disable jsx-a11y/label-has-associated-control */
import * as Yup from 'yup'
import { useState, useEffect } from 'react'
import { Icon } from '@iconify/react'
import { useFormik, Form, FormikProvider } from 'formik'
import eyeFill from '@iconify/icons-eva/eye-fill'
import eyeOffFill from '@iconify/icons-eva/eye-off-fill'
import { useNavigate } from 'react-router-dom'
import { styled } from '@mui/material/styles'
import PropTypes from 'prop-types'

// material
import { Stack, TextField, IconButton, Button, Typography } from '@mui/material'
import { LoadingButton } from '@mui/lab'
import axios from 'axios'
import { PhotoCamera } from '@mui/icons-material'

// ----------------------------------------------------------------------
import { ref, storage, uploadBytesResumable, getDownloadURL } from '../../../config/firebaseConfig'

const Input = styled('input')({
  display: 'none',
})


RegisterForm.propTypes = {
  setOpenModal: PropTypes.func,
  email: PropTypes.string
}

export default function RegisterForm({ setOpenModal, email }) {
  const navigate = useNavigate()
  const [showPassword, setShowPassword] = useState(false)
  const [isSubmitting, setIsSubmitting] = useState(false)
  const [urlImage, setUrlImage] = useState('')
  const [errorImage, setErrorImage] = useState(false)
  const [file, setFile] = useState()
  const [urlUploadImage, setUrlUploadImage] = useState('')

  useEffect(() => {
    return () => {
      setErrorImage(false)
      urlImage && URL.revokeObjectURL(urlImage.preview)
    }
  }, [urlImage])

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
      if (!urlImage) {
        setErrorImage(true)
      } else {
        setIsSubmitting(true)
        const date = new Date()
        const fileName = `${date.getTime()}.jpg`
        const storageRef = ref(storage, fileName)
        const uploadTask = uploadBytesResumable(storageRef, file)
        uploadTask.on('state_changed',
          (snapshot) => {
            console.log('upload done')
            console.log(snapshot)
          },
          (error) => {
            console.log(error)
          },
          () => {
            getDownloadURL(uploadTask.snapshot.ref).then(downloadUrl => {
              axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
                'name': value.fullName,
                'email': email,
                'image': downloadUrl,
                'address': value.address,
                'roleId': '4aed7714-efbe-421c-5f5a-08d9f62291f6'
              }).then(response => {
                console.log(response.data)
                setOpenModal(false)
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
              })
                .catch(error => console.log(error))
            }).catch(error => console.log(error))
          })

      }

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

          <Stack direction="row" alignItems="center" spacing={2}>
            <label htmlFor="icon-button-file">
              <Input accept="image/*" id="icon-button-file" type="file" onChange={(e) => {
                console.log(e.target.files[0])
                const file = e.target.files[0]
                setFile(file)
                file.preview = URL.createObjectURL(file)
                setUrlImage(file)
              }} />
              <IconButton color="primary" aria-label="upload picture" component="span">
                <PhotoCamera />
              </IconButton>
            </label>
            {urlImage.preview && <img src={urlImage.preview} alt='avatar' width={100} />}
          </Stack>
          {errorImage && <Typography color='#FF4842' fontSize={12}>Image is required</Typography>}


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
