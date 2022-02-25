import { TableContainer, Table, TableHead, TableRow, TableCell, TableBody, Paper } from "@mui/material"
import { Delete, Edit, InfoOutlined } from '@mui/icons-material'

function createData(name, calories, fat, carbs, protein) {
    return { name, calories, fat, carbs, protein }
}

const rows = [
    createData('Frozen yoghurt', 159, 6.0, 24, 4.0),
    createData('Ice cream sandwich', 237, 9.0, 37, 4.3),
    createData('Eclair', 262, 16.0, 24, 6.0),
    createData('Cupcake', 305, 3.7, 67, 4.3),
    createData('Gingerbread', 356, 16.0, 49, 3.9),
]

const TableComponent = () => (
    <TableContainer component={Paper}>
        <Table sx={{ minWidth: 650 }} aria-label="simple table">
            <TableHead>
                <TableRow>
                    <TableCell>No</TableCell>
                    <TableCell>Dessert (100g serving)</TableCell>
                    <TableCell align="right">Calories</TableCell>
                    <TableCell align="right">Fat&nbsp;(g)</TableCell>
                    <TableCell align="right">Carbs&nbsp;(g)</TableCell>
                    <TableCell align="right">Protein&nbsp;(g)</TableCell>
                    <TableCell align="right">Action</TableCell>
                </TableRow>
            </TableHead>
            <TableBody>
                {rows.map((row, index) => (
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
                        <TableCell align="right">{row.calories}</TableCell>
                        <TableCell align="right">{row.fat}</TableCell>
                        <TableCell align="right">{row.carbs}</TableCell>
                        <TableCell align="right">{row.protein}</TableCell>
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
)

export default TableComponent