import { TableContainer, Table, TableHead, TableRow, TableCell, TableBody, Paper, Box, CircularProgress, ButtonGroup, Button } from "@mui/material"
import { Delete, Edit, InfoOutlined } from '@mui/icons-material'
import { useEffect, useState } from "react"
import axios from "axios"

const TableOrder = () => {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)

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

    return (
        <>
            {loading
                ? <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                    <CircularProgress />
                </Box>
                : <TableContainer component={Paper}>
                    <Table sx={{ minWidth: 650 }} aria-label="simple table">
                        <TableHead>
                            <TableRow>
                                <TableCell>STT</TableCell>
                                <TableCell>Tên khách hàng</TableCell>
                                <TableCell align="right">Tên Pet</TableCell>
                                <TableCell align="right">Giới tính Pet</TableCell>
                                <TableCell align="right">Tên dịch vụ</TableCell>
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
                                    <TableCell>{row.customerName}</TableCell>
                                    <TableCell align="right">{row.petName}</TableCell>
                                    <TableCell align="right">{row.petGender}</TableCell>
                                    <TableCell align="right">{row.serviceName}</TableCell>
                                    <TableCell align="right">{row.bookingTime.slice(0, 19).replace('T', '  ')}</TableCell>
                                    <TableCell align="right">
                                        <ButtonGroup>
                                            <Button variant="contained" color="secondary">Xác Nhận</Button>
                                            <Button variant="outlined" color="error">Huỷ</Button>
                                        </ButtonGroup>
                                    </TableCell>
                                    <TableCell align='right'>
                                        <InfoOutlined color='primary' style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => console.log('info')} />
                                        {/* <Edit color="info" style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => { console.log('edit') }} />
                                        <Delete color="error" style={{ cursor: 'pointer' }} onClick={() => { console.log('delete') }} /> */}
                                    </TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </TableContainer>
            }
        </>
    )
}

export default TableOrder