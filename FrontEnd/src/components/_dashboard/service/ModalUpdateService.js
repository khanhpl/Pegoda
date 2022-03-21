/* eslint-disable guard-for-in */
/* eslint-disable no-useless-return */
/* eslint-disable no-unused-vars */
/* eslint-disable no-restricted-syntax */
/* eslint-disable react/prop-types */
/* eslint-disable jsx-a11y/label-has-associated-control */
import { Close, PhotoCamera, CleaningServicesOutlined } from "@mui/icons-material"
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, styled, TextField, FormControl, InputLabel, Select, MenuItem } from "@mui/material"
import { useState, useEffect } from "react"
import axios from "axios"
import { LoadingButton } from "@mui/lab"

const BootstrapDialog = styled(Dialog)(({ theme }) => ({
    '& .MuiDialogContent-root': {
        padding: theme.spacing(2),
    },
    '& .MuiDialogActions-root': {
        padding: theme.spacing(1),
    },
}))

const ModalUpdateService = ({ openDialog, handleCloseDialog, state }) => {
    console.log(state)
    const [data, setData] = useState({
        values: {
            name: state.name,
            description: state.description,
            price: state.price,
            urlImage: state.urlImage,
            animalId: state.animalId,
            serviceTypeId: state.serviceTypeId
        }
    })
    // const [name, setName] = useState(state.values.name)
    // const [description, setDescription] = useState(state.values.description)
    // const [price, setPrice] = useState(state.values.price)
    // const [urlImage, setUrlImage] = useState(state.values.urlImage)
    // const [animalId, setAnimalId] = useState(state.values.animalId)
    // const [serviceTypeId, setServiceTypeId] = useState(state.values.serviceTypeId)
    const [file, setFile] = useState()
    const [listAnimal, setListAnimal] = useState([])
    const [listServiceType, setListServiceType] = useState([])
    const [loadingButton, setLoadingButton] = useState(false)

    useEffect(() => {
        axios({
            url: 'https://pegoda.azurewebsites.net/api/v1.0/servicetypes',
            method: 'get',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        }).then((response) => {
            setListServiceType(response.data)
        }).catch(error => console.log(error))
    }, [])

    useEffect(() => {
        axios({
            url: 'https://pegoda.azurewebsites.net/api/v1.0/animals',
            method: 'get',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        }).then((response) => {
            setListAnimal(response.data)
        }).catch(error => console.log(error))
    }, [])

    const handleChangeInput = (e) => {
        // const { value, name } = e.target
        // const newValues = {
        //     ...state.values,
        //     [name]: value
        // }
        const { value, name } = e.target
        // if (name === 'name') {
        //     setName(value)
        // }
        // setData({ values: newValues })
    }

    const handleSubmit = async (e) => {
        e.preventDefault()

        let valid = true

        const { values } = state
        console.log(values)
        for (const key in values) {
            if (values[key] === "") {
                valid = false
            }
        }
        if (!valid) {
            alert("thông tin không hợp lệ")
            return
        }
        setLoadingButton(true)
        if (file) {
            const formData = new FormData()
            formData.append('file', file)
            axios({
                url: 'https://pegoda.azurewebsites.net/api/v1.0/uploads',
                method: 'post',
                headers: {
                    // 'Authorization': `Bearer ${token}`
                },
                data: formData
            }).then(response => {
                const { urlImage } = response.data
                axios({
                    url: 'https://pegoda.azurewebsites.net/api/v1.0/services',
                    method: 'post',
                    headers: {
                        // 'Authorization': `Bearer ${token}`
                    },
                    data: {
                        name: values.name,
                        price: values.price,
                        description: values.description,
                        image: urlImage,
                        centerId: localStorage.getItem('centerId'),
                        animalId: state.values.animalId,
                        serviceTypeId: state.values.serviceTypeId,
                    }
                }).then(() => {
                    setLoadingButton(false)
                    resetForm()
                }).catch(error => console.log(error.response))
            })
                .catch(error => console.log(error))
        } else {
            axios({
                url: 'https://pegoda.azurewebsites.net/api/v1.0/services',
                method: 'post',
                headers: {
                    // 'Authorization': `Bearer ${token}`
                },
                data: {
                    name: values.name,
                    price: values.price,
                    description: values.description,
                    image: null,
                    centerId: localStorage.getItem('centerId'),
                    animalId: state.values.animalId,
                    serviceTypeId: state.values.serviceTypeId,
                }
            }).then(() => {
                setLoadingButton(false)
                resetForm()
            }).catch(error => console.log(error.response))
        }
    }

    const Input = styled('input')({
        display: 'none',
    })

    const resetForm = () => {
        // setData({
        //     ...state.values,
        //     name: '',
        //     description: '',
        //     price: '',
        //     urlImage: '',
        //     animalId: '',
        //     serviceTypeId: ''
        // })
        // setName('')
        // setDescription('')
        // setPrice('')
        // setUrlImage('')
        // setAnimalId('')
        // setServiceTypeId('')
        handleCloseDialog()
    }

    const handleChangeAnimal = (event) => {
        // setData({
        //     ...state.values,
        //     animalId: event.target.value
        // })
        // setAnimalId(event.target.value)
    }
    const handleChangeServiceType = (event) => {
        // setData({
        //     ...state.values,
        //     serviceTypeId: event.target.value
        // })
        // setServiceTypeId(event.target.value)
    }


    return (
        <>
            <BootstrapDialog
                aria-labelledby="customized-dialog-title"
                open={openDialog}
            >
                <DialogTitle sx={{ m: 0, p: 2 }}>
                    Chỉnh sửa dịch vụ
                    <IconButton
                        aria-label="close"
                        onClick={resetForm}
                        sx={{
                            position: 'absolute',
                            right: 8,
                            top: 8,
                            color: (theme) => theme.palette.grey[500],
                        }}
                    >
                        <Close />
                    </IconButton>
                </DialogTitle>
                <form onSubmit={handleSubmit}>
                    <DialogContent dividers>
                        <Box
                            component='form'
                            sx={{
                                '& .MuiTextField-root': { m: 1 },
                                '& .MuiFormControl-root': { m: 1 },
                            }}
                        >
                            <TextField
                                name='name'
                                value={data.values.name}
                                onChange={handleChangeInput}
                                label="Tên dịch vụ"
                                variant='outlined'
                                fullWidth
                            />
                            <TextField
                                value={data.values.description}
                                onChange={handleChangeInput}
                                name='description'
                                label="Mô tả"
                                variant='outlined'
                                fullWidth />
                            <TextField
                                value={data.values.price}
                                onChange={handleChangeInput}
                                name='price'
                                label="Giá"
                                variant='outlined'
                                fullWidth />
                            <FormControl fullWidth>
                                <InputLabel id="demo-simple-select-label">Con vật</InputLabel>
                                <Select
                                    labelId="demo-simple-select-label"
                                    id="demo-simple-select"
                                    value={data.values.animalId}
                                    label="Con vật"
                                    onChange={handleChangeAnimal}
                                >
                                    {listAnimal.map((row, index) => (
                                        <MenuItem key={index} value={row.id}>{row.type}</MenuItem>
                                    ))}
                                </Select>
                            </FormControl>
                            <FormControl fullWidth>
                                <InputLabel id="demo-simple-select-label">Loại dịch vụ</InputLabel>
                                <Select
                                    labelId="demo-simple-select-label"
                                    id="demo-simple-select"
                                    value={data.values.serviceTypeId}
                                    label="Loại dịch vụ"
                                    onChange={handleChangeServiceType}
                                >
                                    {listServiceType.map((row, index) => (
                                        <MenuItem key={index} value={row.id}>{row.name}</MenuItem>
                                    ))}
                                </Select>
                            </FormControl>
                            <label htmlFor="icon-button-file" style={{ display: 'flex' }}>
                                <Input accept="image/*" id="icon-button-file" type="file" onChange={(e) => {
                                    // setData({
                                    //     ...state.values,
                                    //     urlImage: URL.createObjectURL(e.target.files[0])
                                    // })
                                    // setUrlImage(URL.createObjectURL(e.target.files[0]))
                                    setFile(e.target.files[0])
                                }} />
                                <IconButton color="primary" aria-label="upload picture" component="span" >
                                    <PhotoCamera />
                                </IconButton>
                                {data.values.urlImage && <img alt='hinhanh' src={data.values.urlImage} width={100} />}
                            </label>
                        </Box>
                    </DialogContent>
                    <DialogActions>
                        <LoadingButton type='submit' loading={loadingButton}>
                            Lưu thay đổi
                        </LoadingButton>
                    </DialogActions>
                </form>
            </BootstrapDialog>
        </>
    )
}

export default ModalUpdateService