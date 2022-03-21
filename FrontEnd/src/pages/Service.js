/* eslint-disable import/no-useless-path-segments */
/* eslint-disable jsx-a11y/label-has-associated-control */
import plusFill from '@iconify/icons-eva/plus-fill'
import { Icon } from '@iconify/react'
import { Close, PhotoCamera, CleaningServicesOutlined } from '@mui/icons-material'
import { Box, Button, Card, Container, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Stack, styled, TextField, Typography } from "@mui/material"
import { useState, useEffect } from 'react'
import { Link as RouterLink } from 'react-router-dom'
import ModalService from '../../src/components/_dashboard/service/ModalService'
// components
import Page from '../components/Page'
import { ListService } from '../components/_dashboard/user'

export default function Service() {
  const [openDialog, setOpenDialog] = useState(false)

  const handleCloseDialog = () => {
    setOpenDialog(false)
  }

  return (
    <Page title="User | Minimal-UI">
      <Container>
        <Stack direction="row" alignItems="center" justifyContent="space-between" mb={5}>
          <Typography variant="h4" gutterBottom>
            Dịch Vụ
          </Typography>
          <Button
            variant="contained"
            component={RouterLink}
            to="#"
            startIcon={<Icon icon={plusFill} />}
            onClick={() => {
              setOpenDialog(true)
            }}
          >
            Tạo dịch vụ
          </Button>
        </Stack>

        <Card>
          <ListService />
        </Card>
      </Container>

      <ModalService openDialog={openDialog} handleCloseDialog={handleCloseDialog} />
    </Page >
  )
}
