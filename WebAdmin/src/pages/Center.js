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
import { Button, Card, Col, Form, Input, InputNumber, Modal, Row, Table, Space, Popconfirm, message } from "antd"
import { DeleteOutlined, EditOutlined } from '@ant-design/icons'
import axios from "axios"
import { useEffect, useState } from "react"

function Center() {
  const [visible, setVisible] = useState(false)
  const [loadingButton, setLoadingButton] = useState(false)
  const [data, setData] = useState([])
  const [loading, setLoading] = useState(true)
  const [length, setLength] = useState()
  const [pageSize, setPageSize] = useState(10)
  const [currentPage, setCurrentPage] = useState(1)
  const [textButton, setTextButton] = useState({
    key: 0,
    value: 'Đăng kí'
  })
  const [title, setTitle] = useState('Tạo tài khoản cửa hàng')

  const [form] = Form.useForm()

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/centers', {
      //'Authorization': `Bearer ${token}`
    }).then((response) => {
      console.log(response.data)
      setLength(response.data.length)
    })
      .catch(error => console.log(error.response))
  }, [])

  useEffect(() => {
    axios.get(`https://pegoda.azurewebsites.net/api/v1.0/centers?pageNumber=${currentPage}&pageSize=${pageSize}`)
      .then((response) => {
        console.log(response.data)
        setData(response.data)
        setLoading(false)
      })
  }, [currentPage, pageSize, loadingButton])

  const onFinish = (values) => {
    console.log(values)
    setLoadingButton(true)
    if (textButton.key === 0) {
      axios.post('https://pegoda.azurewebsites.net/api/v1.0/centers/register', {
        name: values.name,
        email: values.email,
        description: values.description,
        address: values.address,
        longitude: 0,
        latitude: 0,
        status: 'active'
      }).then(response => {
        console.log(response.data)
        setLoadingButton(false)
        setVisible(false)
      }).catch(error => {
        if (error.response.status === 400) {
          message.error('Email đã tồn tại')
        }
        setLoadingButton(false)
        console.log(error)
      })
    } else if (textButton.key === 1) {
      axios({
        url: `https://pegoda.azurewebsites.net/api/v1.0/centers/${values.id}`,
        method: 'put',
        headers: {
          // Authorization: `Bearer ${token}`
        },
        data: {
          id: values.id,
          name: values.name,
          email: values.email,
          description: values.description,
          address: values.address,
          longitude: 0,
          latitude: 0,
          status: 'active'
        }
      }).then(response => {
        console.log(response.data)
        setLoadingButton(false)
        setVisible(false)
      }).catch(error => console.log(error))
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
      title: "Email",
      dataIndex: "email",
      key: "email",
    },
    {
      title: "Địa Chỉ",
      key: "address",
      dataIndex: "address",
      ellipsis: true,
    },
    // {
    //   title: "Kinh Độ",
    //   key: "longitude",
    //   dataIndex: "longitude",
    // },
    // {
    //   title: "Vĩ Độ",
    //   key: "latitude",
    //   dataIndex: "latitude",
    // },
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
      url: `https://pegoda.azurewebsites.net/api/v1.0/centers/${id}`,
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
      url: `https://pegoda.azurewebsites.net/api/v1.0/centers/${id}`,
      method: 'get',
      headers: {
        // Authorization: `Bearer ${token}`
      }
    }).then((response) => {
      console.log(response.data)
      form.setFieldsValue({
        id: response.data.id,
        name: response.data.name,
        email: response.data.email,
        description: response.data.description,
        address: response.data.address,
        // longitude: response.data.longitude,
        // latitude: response.data.latitude,
      })
      setTitle('Chỉnh sửa thông tin cửa hàng')
      setTextButton({
        key: 1,
        value: 'Thay đổi'
      })
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
              bordered={false}
              style={{ paddingRight: 10, paddingLeft: 10 }}
              className="criclebox tablespace mb-24"
              title="Quản lý cửa hàng"
              extra={
                <Button type='primary' onClick={() => {
                  setTextButton({
                    key: 0,
                    value: 'Đăng kí'
                  })
                  setTitle('Tạo tài khoản cửa hàng')
                  setVisible(true)
                }}>Tạo Cửa Hàng</Button>
              }
            >
              <div className="table-responsive">
                <Table
                  columns={columns}
                  dataSource={data}
                  pagination={{
                    current: currentPage,
                    pageSize: pageSize,
                    total: length,
                    onChange: (page, pageSize) => {
                      setCurrentPage(page)
                      setPageSize(pageSize)
                    }
                  }}
                  loading={loading}
                  className="ant-border-space"
                />
              </div>
            </Card>
          </Col>
        </Row>
      </div>
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
            label="Tên Cửa Hàng"
            name="name"
            rules={[{ required: true, message: 'Vui lòng nhập tên cửa hàng' }]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            label="Email"
            name="email"
            rules={[{ required: true, message: 'Vui lòng nhập email', type: "email" }]}
          >
            <Input />
          </Form.Item>
          <Form.Item
            label="Mô Tả"
            name="description"
            rules={[{ required: true, message: 'Vui lòng nhập mô tả' }]}
          >
            <Input.TextArea />
          </Form.Item>
          <Form.Item
            label="Địa Chỉ"
            name="address"
            rules={[{ required: true, message: 'Vui lòng nhập địa chỉ' }]}
          >
            <Input />
          </Form.Item>
          {/* <Form.Item
            label="Kinh Độ"
            name="longitude"
            rules={[{ required: true, message: 'Vui lòng nhập kinh độ' }]}
          >
            <InputNumber />
          </Form.Item>
          <Form.Item
            label="Vĩ Độ"
            name="latitude"
            rules={[{ required: true, message: 'Vui lòng nhập vĩ độ' }]}
          >
            <InputNumber />
          </Form.Item> */}

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

export default Center
