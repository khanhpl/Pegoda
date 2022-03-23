/* eslint-disable no-unused-expressions */
/* eslint-disable array-callback-return */
import { Close, InfoOutlined } from '@mui/icons-material'
import { Box, Button, ButtonGroup, CircularProgress, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Paper, styled, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, Card, CardContent, Chip, Stack, Pagination } from "@mui/material"
import axios from "axios"
import { useEffect, useState } from "react"

const TableOrder = () => {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)
    const [openDialog, setOpenDialog] = useState(false)
    const [dataOrderDetail, setDataOrderDetail] = useState([])
    const [refreshData, setRefreshData] = useState(false)
    const [loadingButton, setLoadingButton] = useState(false)
    const [length, setLength] = useState()
    const [page, setPage] = useState(1)

    const token = localStorage.getItem('token')
    const centerId = localStorage.getItem('centerId')
    const apiUrl = `https://pegoda.azurewebsites.net/api/v1.0/orders?pageNumber=${page}&pageSize=10&centerId=${centerId}`
    useEffect(() => {
        axios.get(apiUrl, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
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
                                    <TableCell align="right">Tên khách hàng</TableCell>
                                    <TableCell align="right">Tên Pet</TableCell>
                                    <TableCell align="right">Giới tính Pet</TableCell>
                                    <TableCell align="right">Thời gian đặt</TableCell>
                                    <TableCell align="right">Trạng thái</TableCell>
                                    <TableCell align="right">Hành động</TableCell>
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
                                                    <Button variant="contained" color="secondary" onClick={() => {
                                                        updateStatus(row.orderId, 'approved')
                                                    }}>Xác Nhận</Button>
                                                    <Button variant="outlined" color="error" onClick={() => {
                                                        updateStatus(row.orderId, 'canceled')
                                                    }}>Huỷ</Button>
                                                </ButtonGroup>
                                            ) || row.status === 'canceled' && (
                                                <Chip label="Huỷ" color='error' variant='outlined' />
                                            ) || row.status === 'approved' && (
                                                <Chip label="Phê Duyệt" color="primary" variant="outlined" />
                                            )}
                                        </TableCell>
                                        <TableCell align='right'>
                                            <Button variant='outlined' color='info' onClick={() => {
                                                console.log(row.orderId)
                                                axios({
                                                    url: `https://pegoda.azurewebsites.net/api/v1.0/orderitems?orderId=${row.orderId}`,
                                                    method: 'get',
                                                    headers: {
                                                        // 'Authorization': `Bearer ${token}`
                                                    }
                                                }).then((response) => {
                                                    console.log(response.data)
                                                    setDataOrderDetail(response.data)
                                                    setOpenDialog(true)
                                                }).catch(error => console.log(error))
                                            }}>Chi Tiết</Button>
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
                            Chi tiết đơn hàng
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
                                        Dịch vụ {index + 1}
                                    </Typography>
                                    <CardContent>
                                        <Typography>
                                            Tên dịch vụ: {row.service.name}
                                        </Typography>
                                        <Typography variant="body2" color="text.secondary">
                                            Giá: {row.price}
                                        </Typography>
                                    </CardContent>
                                </Card>
                            ))}
                        </DialogContent>
                        {/* <DialogActions>
                            <Button autoFocus onClick={handleCloseDialog}>
                                Lưu thay đổi
                            </Button>
                        </DialogActions> */}
                    </BootstrapDialog>
                </>
            }
        </>
    )
}

export default TableOrder