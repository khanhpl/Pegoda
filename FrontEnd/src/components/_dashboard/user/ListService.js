/* eslint-disable no-unused-expressions */
import { Delete, Edit } from '@mui/icons-material'
import { Box, CircularProgress, Pagination, Paper, Stack, Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from "@mui/material"
import axios from 'axios'
import { useEffect, useState } from 'react'
import ModalUpdateService from '../service/ModalUpdateService'

export default function ListService() {
    const [data, setData] = useState([])
    const [loading, setLoading] = useState(true)
    const [length, setLength] = useState()
    const [page, setPage] = useState(1)
    const [openDialog, setOpenDialog] = useState(false)
    const [state, setState] = useState({
        values: {
            name: '',
            description: '',
            price: '',
            urlImage: '',
            animalId: '',
            serviceTypeId: '',
        }
    })
    const [loadData, setLoadData] = useState(false)

    const handleCloseDialog = () => {
        setOpenDialog(false)
    }

    const token = localStorage.getItem('token')
    const centerId = localStorage.getItem('centerId')
    useEffect(() => {
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/services?pageNumber=${page}&pageSize=10&centerId=${centerId}`, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            setData(response.data)
            setLoading(false)
            console.log(response.data)
        })
            .catch(error => console.log(error))
    }, [token, page, centerId, loadData])

    useEffect(() => {
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/services?centerId=${centerId}`, {
            'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log(response.data)
            setLength(Math.ceil(response.data.length / 10))
        })
            .catch(error => console.log(error))
    }, [token, centerId])

    return (<>
        {loading
            ? <Box sx={{ display: 'flex', justifyContent: 'center' }}>
                <CircularProgress />
            </Box>
            : <>
                <TableContainer component={Paper}>
                    <Table sx={{ minWidth: 650 }} aria-label="simple table">
                        <TableHead>
                            <TableRow>
                                <TableCell>STT</TableCell>
                                <TableCell align='right'>Tên</TableCell>
                                <TableCell align="right">Hình Ảnh</TableCell>
                                <TableCell align="right">Mô Tả</TableCell>
                                <TableCell align="right">Giá</TableCell>
                                {/* <TableCell align="right">Feedback</TableCell> */}
                                <TableCell align="right">Hành Động</TableCell>
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
                                    <TableCell align='right'>{row.name}</TableCell>
                                    <TableCell style={{ display: 'flex', justifyContent: 'right' }}>
                                        {row.image && <img src={row.image} alt='hinhanh' width={70} />}
                                    </TableCell>
                                    <TableCell align="right">{row.description}</TableCell>
                                    <TableCell align="right">{row.price}</TableCell>
                                    {/* <TableCell align="right">{row.protein}</TableCell> */}
                                    <TableCell align='right'>
                                        {/* <InfoOutlined color='primary' style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => console.log('info')} /> */}
                                        <Edit color="info" style={{ marginRight: 10, cursor: 'pointer' }} onClick={() => {
                                            axios({
                                                url: `https://pegoda.azurewebsites.net/api/v1.0/services/${row.id}`,
                                                method: 'get',
                                                headers: {
                                                    // 'Authorization': `Bearer ${token}`
                                                }
                                            }).then((response) => {
                                                console.log(response.data)
                                                setState({
                                                    ...state.values,
                                                    name: response.data.name,
                                                    description: response.data.description,
                                                    price: response.data.price,
                                                    urlImage: response.data.image,
                                                    animalId: response.data.animalId,
                                                    serviceTypeId: response.data.serviceTypeId,
                                                })
                                                setOpenDialog(true)
                                            }).catch(error => console.log(error))
                                        }} />
                                        <Delete color="error" style={{ cursor: 'pointer' }} onClick={() => {
                                            axios({
                                                url: `https://pegoda.azurewebsites.net/api/v1.0/services/${row.id}`,
                                                method: 'delete',
                                                headers: {
                                                    // 'Authorization': `Bearer ${token}`
                                                }
                                            }).then(() => {
                                                setLoadData(!loadData)
                                            }).catch(error => console.log(error))
                                        }} />
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
                <ModalUpdateService openDialog={openDialog} handleCloseDialog={handleCloseDialog} state={state} />
            </>
        }
    </>
    )
}