import { useState, useEffect } from 'react'
import { TableContainer, Table, TableHead, TableRow, TableCell, TableBody, Paper, Box, CircularProgress, Container, Stack, Typography, Button, Card } from "@mui/material"
import { Delete, Edit, InfoOutlined } from '@mui/icons-material'
import axios from 'axios'

export default function ListService() {

    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)

    const apiUrl = 'https://pegoda.azurewebsites.net/api/v1.0/services/search?pageNumber=1&pageSize=10'
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

    return (<>
        {loading
            ? <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                <CircularProgress />
            </Box>
            : <TableContainer component={Paper}>
                <Table sx={{ minWidth: 650 }} aria-label="simple table">
                    <TableHead>
                        <TableRow>
                            <TableCell>No</TableCell>
                            <TableCell>Name</TableCell>
                            <TableCell align="right">Price</TableCell>
                            <TableCell align="right">Description</TableCell>
                            <TableCell align="right">Image</TableCell>
                            {/* <TableCell align="right">Feedback</TableCell> */}
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
                                    {row.name}
                                </TableCell>
                                <TableCell align="right">{row.price}</TableCell>
                                <TableCell align="right">{row.description}</TableCell>
                                <TableCell align="right">{row.image}</TableCell>
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