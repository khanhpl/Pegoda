import { TableContainer, Table, TableHead, TableRow, TableCell, TableBody, Paper, Box, CircularProgress } from "@mui/material"
import { Delete, Edit, InfoOutlined } from '@mui/icons-material'
import { useEffect, useState } from "react"
import axios from "axios"
import { DataGrid } from '@mui/x-data-grid'

function createData(name, calories, fat, carbs, protein) {
    return { name, calories, fat, carbs, protein }
}

// const rows = [
//     createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
//     createData('Ice cream sandwich', 237, 9.0, 37, 4.3),
//     createData('Eclair', 262, 16.0, 24, 6.0),
//     createData('Cupcake', 305, 3.7, 67, 4.3),
//     createData('Gingerbread', 356, 16.0, 49, 3.9),
// ]

const columns = [
    { field: 'id', headerName: 'No', width: 70 },
    { field: 'date', headerName: 'First name', width: 130 },
    { field: 'totalPrice', headerName: 'Last name', width: 90, type: 'number' },
    // {
    //     field: 'fullName',
    //     headerName: 'Full name',
    //     description: 'This column has a value getter and is not sortable.',
    //     sortable: false,
    //     width: 160,
    //     valueGetter: (params) =>
    //         `${params.row.firstName || ''} ${params.row.lastName || ''}`,
    // },
    { field: 'status', headerName: 'Status', width: 130 },
    { field: 'feedback', headerName: 'Feedback', width: 130 },
]

const rows = [
    { id: 1, lastName: 'Snow', firstName: 'Jon', age: 35 },
    { id: 2, lastName: 'Lannister', firstName: 'Cersei', age: 42 },
    { id: 3, lastName: 'Lannister', firstName: 'Jaime', age: 45 },
    { id: 4, lastName: 'Stark', firstName: 'Arya', age: 16 },
    { id: 5, lastName: 'Targaryen', firstName: 'Daenerys', age: null },
    { id: 6, lastName: 'Melisandre', firstName: null, age: 150 },
    { id: 7, lastName: 'Clifford', firstName: 'Ferrara', age: 44 },
    { id: 8, lastName: 'Frances', firstName: 'Rossini', age: 36 },
    { id: 9, lastName: 'Roxie', firstName: 'Harvey', age: 65 },
]

const TableComponent = () => {
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
                ? <Box sx={{ display: 'flex' }}>
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

export default TableComponent