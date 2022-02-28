/* eslint-disable no-unused-expressions */
import PropTypes from 'prop-types'
// material
import { Grid, Box, CircularProgress, TableContainer, Table, TableHead, TableCell, TableBody, TableRow, Paper, Stack, Pagination } from '@mui/material'
import { Delete, Edit, InfoOutlined, CleaningServicesOutlined } from '@mui/icons-material'
import { useState, useEffect } from 'react'
import axios from 'axios'

// ----------------------------------------------------------------------

ListStaff.propTypes = {
    // products: PropTypes.array.isRequired
}

export default function ListStaff() {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)
    const [page, setPage] = useState(1)

    const token = localStorage.getItem('token')

    useEffect(() => {
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/staffs?pageNumber=${page}&pageSize=10`, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log(response.data)
            setData(response.data)
            setLoading(false)
        }).catch(error => console.log(error))
    }, [token, page])


    return (
        <>
            {loading
                ? <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                    <CircularProgress />
                </Box>
                : <>
                    <TableContainer component={Paper}>
                        <Table sx={{ minWidth: 650 }} aria-label="simple table">
                            <TableHead>
                                <TableRow>
                                    <TableCell>No</TableCell>
                                    <TableCell>Name</TableCell>
                                    <TableCell align="right">Email</TableCell>
                                    <TableCell align="right">Gender</TableCell>
                                    <TableCell align="right">Image</TableCell>
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
                                        <TableCell align="right">{row.email}</TableCell>
                                        <TableCell align="right">{row.gender}</TableCell>
                                        <TableCell align="right">{row.image}</TableCell>
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
                    <Stack spacing={2}>
                        <Pagination count={10} style={{ display: 'flex', justifyContent: 'center' }} getItemAriaLabel={(_, page, selected) => {
                            selected && setPage(page)
                        }} />
                    </Stack>
                </>
            }
        </>
    )
}
