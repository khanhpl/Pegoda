/* eslint-disable array-callback-return */
/* eslint-disable no-unused-expressions */
/*!
=========================================================
* Muse Ant Design Dashboard - v1.0.0
=========================================================
* Product Page: https://www.creative-tim.com/product/muse-ant-design-dashboard
* Copyright 2021 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://github.com/creativetimofficial/muse-ant-design-dashboard/blob/main/LICENSE.md)
* Coded by Creative Tim
=========================================================
* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
*/
import { UploadOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'
import { Button, Card, Col, Form, Input, Modal, Row, Select, Table, Upload, Space, Popconfirm, message } from "antd"
import axios from "axios"
import { useEffect, useState } from "react"

const { Option } = Select


function Staff() {
  const [data, setData] = useState([])
  const [currentPage, setCurrentPage] = useState(1)
  const [pageSize, setPageSize] = useState(10)
  const [length, setLength] = useState()
  const [loading, setLoading] = useState(true)
  const [visible, setVisible] = useState(false)
  const [loadingButton, setLoadingButton] = useState(false)
  const [dataSelect, setDataSelect] = useState([])
  const [textButton, setTextButton] = useState({
    key: 0,
    value: 'Đăng kí'
  })
  const [centerId, setCenterId] = useState('')
  const [title, setTitle] = useState('Tạo tài khoản nhân viên')
  const [urlImage, setUrlImage] = useState('')

  const [form] = Form.useForm()

  useEffect(() => {
    axios.get(`https://pegoda.azurewebsites.net/api/v1.0/staffs?pageNumber=${currentPage}&pageSize=${pageSize}`, {
      //'Authorization': `Bearer ${token}`
    }).then((response) => {
      console.log(response.data)
      setData(response.data)
      setLoading(false)
    })
      .catch(error => console.log(error.response))
  }, [currentPage, pageSize, loadingButton])

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/staffs', {
      //'Authorization': `Bearer ${token}`
    }).then(response => setLength(response.data.length))
      .catch(error => console.log(error.response))
  }, [])

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/centers', {
      //'Authorization': `Bearer ${token}`
    }).then(response => setDataSelect(response.data))
      .catch(error => console.log(error))
  }, [])

  const onFinish = (values) => {
    console.log(values)
    setLoadingButton(true)
    if (textButton.key === 0) {
      if (values.image) {
        const formData = new FormData()
        formData.append('file', values.image.file)
        let image = ''
        axios.post('https://pegoda.azurewebsites.net/api/v1.0/uploads', formData, {
          headers: {
            //'Authorization': `Bearer ${token}`
            'Content-Type': `multipart/form-data; boundary=${data._boundary}`
          }
        }).then((response) => {
          console.log(response.data)
          image = response.data.urlImage
          console.log({
            name: values.name,
            gender: values.gender,
            email: values.email,
            image,
            centerId: values.centerId
          })
          axios.post('https://pegoda.azurewebsites.net/api/v1.0/staffs/register', {
            // headers: {
            //   'Authorization': `Bearer ${token}`
            // },
            // data: {
            name: values.name,
            gender: values.gender,
            email: values.email,
            image,
            centerId: values.centerId
            // }
          }).then(response => {
            console.log(response.data)
            setLoadingButton(false)
            setVisible(false)
          })
            .catch(error => console.log(error.response))
        }).catch(error => {
          console.log(error.response)
        })
      } else {
        axios.post('https://pegoda.azurewebsites.net/api/v1.0/staffs/register', {
          // headers: {
          //   'Authorization': `Bearer ${token}`
          // },
          // data: {
          name: values.name,
          gender: values.gender,
          email: values.email,
          image: null,
          centerId: values.centerId
          // }
        }).then(response => {
          console.log(response.data)
          setLoadingButton(false)
          setVisible(false)
        })
          .catch(error => {
            if (error.response.status === 400) {
              message.error('Email đã tồn tại')
            }
            setLoadingButton(false)
            console.log(error.response)
          })
      }
    } else if (textButton.key === 1) {
      if (urlImage) {
        axios({
          url: `https://pegoda.azurewebsites.net/api/v1.0/staffs/${values.id}`,
          method: 'put',
          headers: {
            // Authorization: `Bearer ${token}`
          },
          data: {
            id: values.id,
            name: values.name,
            email: values.email,
            gender: values.gender,
            image: urlImage,
            centerId: values.centerId
          }
        }).then(() => {
          setLoading(false)
          setVisible(false)
        }).catch(error => console.log(error))
      } else {
        if (values.image) {
          const formData = new FormData()
          formData.append('file', values.image.file)
          let image = ''
          axios.post('https://pegoda.azurewebsites.net/api/v1.0/uploads', formData, {
            headers: {
              //'Authorization': `Bearer ${token}`
              'Content-Type': `multipart/form-data; boundary=${data._boundary}`
            }
          }).then((response) => {
            console.log(response.data)
            image = response.data.urlImage
            axios.put(`https://pegoda.azurewebsites.net/api/v1.0/staffs/${values.id}`, {
              // headers: {
              //   'Authorization': `Bearer ${token}`
              // },
              // data: {
              id: values.id,
              name: values.name,
              gender: values.gender,
              email: values.email,
              image,
              centerId: values.centerId
              // }
            }).then(response => {
              console.log(response.data)
              setLoadingButton(false)
              setVisible(false)
            })
              .catch(error => console.log(error.response))
          }).catch(error => console.log(error.response))
        } else {
          console.log(values)
          axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/staffs/${values.id}`,
            method: 'put',
            // headers: {
            //   Authorization: `Bearer ${token}`
            // },
            data: {
              id: values.id,
              name: values.name,
              gender: values.gender,
              email: values.email,
              image: null,
              centerId: centerId ? centerId : values.centerId
            }
          }).then(response => {
            console.log(response.data)
            setLoadingButton(false)
            setVisible(false)
          })
            .catch(error => console.log(error.response))
        }
      }
    }
  }

  const columns = [
    {
      title: "STT",
      dataIndex: "stt",
      key: "stt",
      width: "5%",
      render: (item, record, index) => (<>{index + 1}</>)
    },
    {
      title: "Tên",
      dataIndex: "name",
      key: "name",
    },
    {
      title: "Hình Ảnh",
      dataIndex: "image",
      key: "image",
      render: (item, record, index) =>
        item && (<img src={item} alt='item' width={50} />)
    },
    {
      title: "Giới Tính",
      dataIndex: "gender",
      key: "gender",
    },
    {
      title: "Email",
      key: "email",
      dataIndex: "email",
    },
    {
      title: "Tên Trung Tâm",
      key: "center",
      dataIndex: ['center', 'name'],
      render: (text, record, index) => `${text}`
    },
    {
      title: "Hành Động",
      key: "action",
      dataIndex: "action",
      render: (_, record) => (
        <Space size='large'>
          <EditOutlined style={{ fontSize: 18 }} onClick={() => {
            onEdit(record.id)
          }} />
          <Popconfirm
            title="Bạn có chắc chắn xoá cửa hàng này không?"
            onConfirm={() => confirmDelete(record.id)}
            okText="Chắc chắn"
            cancelText="Huỷ"
            placement='topRight'
          >
            <DeleteOutlined style={{ fontSize: 18 }} />
          </Popconfirm>
        </Space>
      )
    },
  ]

  const confirmDelete = (id) => {
    axios({
      url: `https://pegoda.azurewebsites.net/api/v1.0/staffs/${id}`,
      method: 'delete',
      headers: {
        // Authorization: `Bearer ${token}`
      }
    }).then((response) => {
      setLoadingButton(true)
      setLoadingButton(false)
    }).catch(error => console.log(error))
  }

  const onEdit = (id) => {
    axios({
      url: `https://pegoda.azurewebsites.net/api/v1.0/staffs/${id}`,
      method: 'get',
      headers: {
        // Authorization: `Bearer ${token}`
      }
    }).then(async (response) => {
      console.log(response.data)
      const center = await axios.get(`https://pegoda.azurewebsites.net/api/v1.0/centers/${response.data.centerId}`, {
        //'Authorization': `Bearer ${token}`
      })
      form.setFieldsValue({
        id: response.data.id,
        name: response.data.name,
        email: response.data.email,
        gender: response.data.gender,
        centerId: center.data.name
      })
      setCenterId(response.data.centerId)
      setTextButton({
        key: 1,
        value: 'Thay đổi'
      })
      setTitle('Chỉnh sửa thông tin cửa hàng')
      setUrlImage(response.data.image)
      setVisible(true)
    })
      .catch((error) => console.log(error))
  }

  return (
    <>
      <div className="tabled">
        <Row gutter={[24, 0]}>
          <Col xs="24" xl={24}>
            <Card
              style={{ paddingRight: 10, paddingLeft: 10 }}
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Quản lý nhân viên"
              extra={
                <Button type='primary' onClick={() => {
                  setTextButton({
                    key: 0,
                    value: 'Đăng kí'
                  })
                  setTitle('Tạo tài khoản nhân viên')
                  setUrlImage('')
                  setVisible(true)
                }}>Tạo Nhân Viên</Button>
              }
            >
              <div className="table-responsive">
                <Table
                  columns={columns}
                  dataSource={data}
                  loading={loading}
                  pagination={{
                    current: currentPage,
                    pageSize: pageSize,
                    total: length,
                    onChange: (page, pageSize) => {
                      setCurrentPage(page)
                      setPageSize(pageSize)
                    }
                  }}
                  className="ant-border-space"
                />
              </div>
            </Card>
          </Col>
        </Row>
      </div >
      <Modal
        title={title}
        visible={visible}
        onCancel={() => {
          setVisible(false)
          form.resetFields()
        }}
        maskClosable={false}
        footer={false}
      >
        <Form
          form={form}
          name="basic"
          layout='vertical'
          onFinish={onFinish}
          autoComplete="off"
        >
          <Form.Item
            label="Id"
            name="id"
            style={{ display: 'none' }}
          >
            <Input />
          </Form.Item>

          <Form.Item
            label="Họ Và Tên"
            name="name"
            rules={[{ required: true, message: 'Vui lòng nhập họ và tên' }]}
          >
            <Input />
          </Form.Item>

          <Form.Item
            label="Email"
            name='email'
            rules={[{ required: true, type: 'email', message: 'Vui lòng nhập email' }]}
          >
            <Input />
          </Form.Item>

          <Form.Item
            label='Giới tính'
            name='gender'
            rules={[{ required: true, message: 'Vui lòng chọn giới tính' }]}
            initialValue='Giới Tính'
          >
            <Select onChange={(value) => console.log(value)}>
              <Option value='Nam'>
                Nam
              </Option>
              <Option value='Nữ'>
                Nữ
              </Option>
            </Select>
          </Form.Item>

          <Form.Item
            label='Hình ảnh'
            name='image'
          >
            <Upload
              listType='picture'
              maxCount={1}
              beforeUpload={() => false}
              onChange={(e) => console.log(e)}
            >
              <Button icon={<UploadOutlined />}>Tải hình ảnh</Button>
            </Upload>
          </Form.Item>
          {urlImage && <img src={urlImage} alt='hinhanh' width={70} style={{ paddingBottom: 11 }} />}

          <Form.Item
            label='Tên Trung Tâm'
            name='centerId'
            rules={[{ required: true, message: 'Vui lòng chọn tên trung tâm' }]}
            initialValue='Tên Trung Tâm'
          >
            <Select onChange={(value) => {
              console.log(value)
              setCenterId('')
            }}>
              {dataSelect.map((element) => (
                <Option Option key={element.id} value={element.id} >
                  {element.name}
                </Option>
              ))}
            </Select>
          </Form.Item>

          <Form.Item>
            <Button type="primary" htmlType="submit" loading={loadingButton}>
              {textButton.value}
            </Button>
          </Form.Item>
        </Form>
      </Modal>
    </>
  )
}

export default Staff
