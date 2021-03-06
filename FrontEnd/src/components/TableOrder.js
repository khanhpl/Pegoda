/* eslint-disable no-unused-expressions */
/* eslint-disable array-callback-return */
import { Close, InfoOutlined } from '@mui/icons-material'
import { Box, Button, ButtonGroup, CircularProgress, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Paper, styled, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, Card, CardContent, Chip, Stack, Pagination, Snackbar, Alert, setRef } from "@mui/material"
import axios from "axios"
import { useEffect, useState } from "react"
import { HubConnectionBuilder } from '@microsoft/signalr'
import { connect } from 'formik'

const TableOrder = () => {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)
    const [openDialog, setOpenDialog] = useState(false)
    const [dataOrderDetail, setDataOrderDetail] = useState([])
    const [refreshData, setRefreshData] = useState(false)
    const [length, setLength] = useState()
    const [page, setPage] = useState(1)
    const [connection, setConnection] = useState()
    const [openSnackbar, setOpenSnackbar] = useState()

    const token = localStorage.getItem('token')
    const centerId = localStorage.getItem('centerId')
    const apiUrl = `https://pegoda.azurewebsites.net/api/v1.0/orders?pageNumber=${page}&pageSize=10&centerId=${centerId}`
    // console.log('0 ', refreshData)
    useEffect(() => {
        axios.get(apiUrl, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log('reload')
            setData(response.data)
            setLoading(false)
            console.log(response.data)
        })
            .catch(error => console.log(error))
    }, [token, centerId, apiUrl, refreshData])

    useEffect(() => {
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/orders?centerId=${centerId}`,
            method: 'get'
        }).then((response) => {
            console.log(response.data)
            setLength(Math.ceil(response.data.length / 10))
        }).catch(error => console.log(error.response))
    }, [centerId])

    useEffect(() => {
        const newConnection = new HubConnectionBuilder().withUrl('https://pegoda.azurewebsites.net/chatHub').withAutomaticReconnect().build()

        setConnection(newConnection)
    }, [])

    useEffect(() => {
        if (connection) {
            connection.start().then(() => {
                console.log('Connected!')

                connection.on('Receive', message => {
                    console.log('message: ', message)
                    // console.log('1 ', refreshData)
                    setRefreshData(!refreshData)
                    // console.log('2 ', refreshData)
                    setOpenSnackbar(true)
                })
            }).catch(error => console.log('Connection failed: ', error))
        }
    }, [connection])

    const handleCloseDialog = () => {
        setOpenDialog(false)
    }

    const BootstrapDialog = styled(Dialog)(({ theme }) => ({
        '& .MuiDialogContent-root': {
            padding: theme.spacing(2),
        },
        '& .MuiDialogActions-root': {
            padding: theme.spacing(1),
        },
    }))

    const updateStatus = async (id, status) => {
        const order = await axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/orders/${id}`,
            method: 'get',
            headers: {
                // 'Authorization': `Bearer ${token}`
            }
        })
        order.data.status = status
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/orders/${id}`,
            method: 'put',
            headers: {
                // 'Authorization': `Bearer ${token}`
            },
            data: order.data
        }).then(() => {
            setRefreshData(!refreshData)
        }).catch(error => console.log(error.response))
    }

    const handleCloseSnackbar = () => {
        setOpenSnackbar(false)
    }

    const pushNotifyApproved = async (deviceId) => {
        axios({
            url: 'https://pegoda.azurewebsites.net/api/v1.0/notifications',
            method: 'post',
            data: {
                "deviceId": deviceId,
                "title": "PEGODA",
                "body": "L???ch kh??m b???nh cho Pet c???a b???n ???? ???????c ph?? duy???t",
            }
        }).then((response) => {
            console.log(response.data)
        }).catch(error => console.log(error))
    }

    const pushNotifyCanceled = async (deviceId) => {
        axios({
            url: 'https://pegoda.azurewebsites.net/api/v1.0/notifications',
            method: 'post',
            data: {
                "deviceId": deviceId,
                "title": "PEGODA",
                "body": "L???ch kh??m b???nh cho Pet c???a b???n ???? b??? hu???",
            }
        }).then((response) => {
            console.log(response.data)
        }).catch(error => console.log(error))
    }

    return (
        <>
            {loading
                ? <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                    <CircularProgress />
                </Box>
                :
                <>
                    <TableContainer component={Paper}>
                        <Table sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell>STT</TableCell>
                                    <TableCell align="right">T??n kh??ch h??ng</TableCell>
                                    <TableCell align="right">T??n Pet</TableCell>
                                    <TableCell align="right">Gi???i t??nh Pet</TableCell>
                                    <TableCell align="right">Th???i gian ?????t</TableCell>
                                    <TableCell align="right">Tr???ng th??i</TableCell>
                                    <TableCell align="right">H??nh ?????ng</TableCell>
                                </TableRow>
                            </TableHead>
                            <TableBody>
                                {data.map((row, index) => (
                                    <TableRow
                                        key={index}
                                        sx={{ '&:last-child td, &:last-child th': { border: 0 } }}
                                    >
                                        <TableCell component="th" scope="row">
                                            {index + 1}
                                        </TableCell>
                                        <TableCell align="right">{row.customerName}</TableCell>
                                        <TableCell align="right">{row.petName}</TableCell>
                                        <TableCell align="right">{row.gender}</TableCell>
                                        <TableCell align="right">{row.date.slice(0, 19).replace('T', '  ')}</TableCell>
                                        <TableCell align="right">
                                            {row.status === 'pending' && (
                                                <ButtonGroup>
                                                    <Button variant="contained" color="secondary" onClick={async () => {
                                                        updateStatus(row.orderId, 'approved')
                                                        await pushNotifyApproved(row.deviceId)
                                                    }}>X??c Nh???n</Button>
                                                    <Button variant="outlined" color="error" onClick={async () => {
                                                        updateStatus(row.orderId, 'canceled')
                                                        await pushNotifyCanceled(row.deviceId)
                                                    }}>Hu???</Button>
                                                </ButtonGroup>
                                            ) || row.status === 'canceled' && (
                                                <Chip label="Hu???" color='error' variant='outlined' />
                                            ) || row.status === 'approved' && (
                                                <Chip label="Ph?? Duy???t" color="primary" variant="outlined" />
                                            )}
                                        </TableCell>
                                        <TableCell align='right'>
                                            <Button variant='outlined' color='info' onClick={async () => {
                                                // console.log(row.orderId)
                                                // axios({
                                                //     url: `https://pegoda.azurewebsites.net/api/v1.0/orderitems?orderId=${row.orderId}`,
                                                //     method: 'get',
                                                //     headers: {
                                                //         // 'Authorization': `Bearer ${token}`
                                                //     }
                                                // }).then((response) => {
                                                //     console.log(response.data)
                                                //     setDataOrderDetail(response.data)
                                                //     setOpenDialog(true)
                                                // }).catch(error => console.log(error))

                                                await connection.invoke("Request").catch((error) => console.log(error))
                                            }}>Chi Ti???t</Button>
                                            {/* <Edit color="info" style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => { console.log('edit') }} />
                                        <Delete color="error" style={{ cursor: 'pointer' }} onClick={() => { console.log('delete') }} /> */}
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
                    <Stack spacing={2}>
                        {/* <Pagination count={length} style={{ display: 'flex', justifyContent: 'center' }} getItemAriaLabel={(_, page, selected) => {
                        selected && setPage(page)
                    }} /> */}
                        <Pagination count={length} style={{ display: 'flex', justifyContent: 'center', paddingBottom: 10, paddingTop: 10 }} getItemAriaLabel={(_, page, selected) => {
                            selected && setPage(page)
                        }} />
                    </Stack>
                    <BootstrapDialog
                        aria-labelledby="customized-dialog-title"
                        open={openDialog}
                    >
                        <DialogTitle sx={{ m: 0, p: 2 }}>
                            Chi ti???t ????n h??ng
                            <IconButton
                                aria-label="close"
                                onClick={handleCloseDialog}
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
                        <DialogContent dividers>
                            {dataOrderDetail.map((row, index) => (
                                <Card key={index} style={{ marginBottom: 10 }}>
                                    <Typography variant="h5" component="div" style={{ paddingLeft: 5 }}>
                                        D???ch v??? {index + 1}
                                    </Typography>
                                    <CardContent>
                                        <Typography>
                                            T??n d???ch v???: {row.service.name}
                                        </Typography>
                                        <Typography variant="body2" color="text.secondary">
                                            Gi??: {row.price}
                                        </Typography>
                                    </CardContent>
                                </Card>
                            ))}
                        </DialogContent>
                        {/* <DialogActions>
                            <Button autoFocus onClick={handleCloseDialog}>
                                L??u thay ?????i
                            </Button>
                        </DialogActions> */}
                    </BootstrapDialog>
                    <Snackbar open={openSnackbar} autoHideDuration={5000} onClose={handleCloseSnackbar}>
                        <Alert onClose={handleCloseSnackbar} severity="info" sx={{ width: '100%' }} variant="filled">
                            B???n c?? ????n h??ng m???i k??a!!
                        </Alert>
                    </Snackbar>
                </>
            }
        </>
    )
}

export default TableOrder