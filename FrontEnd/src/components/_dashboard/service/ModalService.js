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

const BootstrapDialog = styled(Dialog)(({ theme }) => ({
    '& .MuiDialogContent-root': {
        padding: theme.spacing(2),
    },
    '& .MuiDialogActions-root': {
        padding: theme.spacing(1),
    },
}))

const ModalService = ({ openDialog, handleCloseDialog }) => {
    const [state, setState] = useState({
        values: {
            name: '',
            description: '',
            price: '',
            urlImage: ''
        }
    })
    const [file, setFile] = useState()
    const [animalId, setAnimalId] = useState()
    const [serviceTypeId, setServiceTypeId] = useState()
    const [listAnimal, setListAnimal] = useState()
    const [listServiceType, setListServiceType] = useState()

    const handleChangeInput = (e) => {
        const { value, name } = e.target
        const newValues = {
            ...state.values,
            [name]: value
        }
        setState({ values: newValues })
    }

    const handleSubmit = async (e) => {
        console.log(e)
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
                }
            })
        })
            .catch(error => console.log(error))
    }

    const Input = styled('input')({
        display: 'none',
    })

    const resetForm = () => {
        state.values.name = ''
        state.values.description = ''
        state.values.price = ''
        handleCloseDialog()
    }

    const handleChange = (event) => {
        setAnimalId(event.target.value)
    }


    return (
        <>
            <BootstrapDialog
                aria-labelledby="customized-dialog-title"
                open={openDialog}
            >
                <DialogTitle sx={{ m: 0, p: 2 }}>
                    Tạo dịch vụ
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
                                value={state.values.name}
                                onChange={handleChangeInput}
                                label="Tên dịch vụ"
                                variant='outlined'
                                fullWidth
                            />
                            <TextField
                                value={state.values.description}
                                onChange={handleChangeInput}
                                name='description'
                                label="Mô tả"
                                variant='outlined'
                                fullWidth />
                            <TextField
                                value={state.values.price}
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
                                    value={animalId}
                                    label="Con vật"
                                    onChange={handleChange}
                                >
                                    <MenuItem value={10}>Ten</MenuItem>
                                    <MenuItem value={20}>Twenty</MenuItem>
                                    <MenuItem value={30}>Thirty</MenuItem>
                                </Select>
                            </FormControl>
                            <FormControl fullWidth>
                                <InputLabel id="demo-simple-select-label">Loại dịch vụ</InputLabel>
                                <Select
                                    labelId="demo-simple-select-label"
                                    id="demo-simple-select"
                                    value={animalId}
                                    label="Loại dịch vụ"
                                    onChange={handleChange}
                                >
                                    <MenuItem value={10}>Ten</MenuItem>
                                    <MenuItem value={20}>Twenty</MenuItem>
                                    <MenuItem value={30}>Thirty</MenuItem>
                                </Select>
                            </FormControl>
                            <label htmlFor="icon-button-file" >
                                <Input accept="image/*" id="icon-button-file" type="file" onChange={(e) => setFile(e.target.files[0])} />
                                <IconButton color="primary" aria-label="upload picture" component="span" >
                                    <PhotoCamera />
                                </IconButton>
                            </label>
                        </Box>
                    </DialogContent>
                    <DialogActions>
                        <Button type='submit'>
                            Lưu thay đổi
                        </Button>
                    </DialogActions>
                </form>
            </BootstrapDialog>

        </>
    )
}

export default ModalService