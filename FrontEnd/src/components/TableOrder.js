import { TableContainer, Table, TableHead, TableRow, TableCell, TableBody, Paper, Box, CircularProgress } from "@mui/material"
import { Delete, Edit, InfoOutlined } from '@mui/icons-material'
import { useEffect, useState } from "react"
import axios from "axios"

const TableOrder = () => {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)

    const apiUrl = 'https://pegoda.azurewebsites.net/api/v1.0/orders?pageNumber=1&pageSize=10'
    const token = localStorage.getItem('token')
    useEffect(() => {
        axios.get(apiUrl, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            setData(response.data)
            setLoading(false)
            console.log(response.data)
        })
            .catch(error => console.log(error))
    }, [token])

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
                                    <TableCell>{row.totalPrice}</TableCell>
                                    <TableCell align="right">{row.totalPrice}</TableCell>
                                    <TableCell align="right">{row.scores}</TableCell>
                                    <TableCell align="right">{row.feedback}</TableCell>
                                    <TableCell align="right">{row.date.replace('T', ' ')}</TableCell>
                                    <TableCell align='right'>
                                        <InfoOutlined color='primary' style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => console.log('info')} />
                                        <Edit color="info" style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => { console.log('edit') }} />
                                        <Delete color="error" style={{ cursor: 'pointer' }} onClick={() => { console.log('delete') }} />
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