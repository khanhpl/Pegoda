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
                                <TableCell>No</TableCell>
                                <TableCell>Date</TableCell>
                                <TableCell align="right">Total Price</TableCell>
                                <TableCell align="right">Status</TableCell>
                                <TableCell align="right">Scores</TableCell>
                                <TableCell align="right">Feedback</TableCell>
                                <TableCell align="right">Action</TableCell>
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
                                    <TableCell component="th" scope="row">
                                        {row.date.replace('T', ' ')}
                                    </TableCell>
                                    <TableCell align="right">{row.totalPrice}</TableCell>
                                    <TableCell align="right">{row.scores}</TableCell>
                                    <TableCell align="right">{row.feedback}</TableCell>
                                    {/* <TableCell align="right">{row.protein}</TableCell> */}
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