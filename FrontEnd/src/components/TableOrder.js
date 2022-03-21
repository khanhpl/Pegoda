/* eslint-disable array-callback-return */
import { Close, InfoOutlined } from '@mui/icons-material'
import { Box, Button, ButtonGroup, CircularProgress, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Paper, styled, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, Card, CardContent } from "@mui/material"
import axios from "axios"
import { useEffect, useState } from "react"

const TableOrder = () => {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)
    const [openDialog, setOpenDialog] = useState(false)
    const [dataOrderDetail, setDataOrderDetail] = useState([])

    const token = localStorage.getItem('token')
    const centerId = localStorage.getItem('centerId')
    const apiUrl = `https://pegoda.azurewebsites.net/api/v1.0/orders?pageNumber=1&pageSize=10&centerId=${centerId}`
    useEffect(() => {
        axios.get(apiUrl, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            setData(response.data)
            setLoading(false)
            console.log(response.data)
        })
            .catch(error => console.log(error))
    }, [token, centerId, apiUrl])

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
                                                    <Button variant="contained" color="secondary">Xác Nhận</Button>
                                                    <Button variant="outlined" color="error">Huỷ</Button>
                                                </ButtonGroup>
                                            ) || row.status === 'canceled' && (
                                                <Button variant="contained" disabled>Huỷ</Button>
                                            ) || row.status === 'approved' && (
                                                <Button variant="contained" disabled>Phê Duyệt</Button>
                                            )}
                                        </TableCell>
                                        <TableCell align='right'>
                                            <InfoOutlined color='primary' style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => {
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
                                            }} />
                                            {/* <Edit color="info" style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => { console.log('edit') }} />
                                        <Delete color="error" style={{ cursor: 'pointer' }} onClick={() => { console.log('delete') }} /> */}
                                        </TableCell>
                                    </TableRow>
                                ))}
                            </TableBody>
                        </Table>
                    </TableContainer>
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