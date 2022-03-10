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
import { Card, Col, Row, Table, Button, Modal, Form, Input, Select, Upload } from "antd"
import { UploadOutlined } from '@ant-design/icons'
import axios from "axios"
import { useEffect, useState } from "react"

const { Option } = Select

// table code start
const columns = [
  {
    title: "STT",
    dataIndex: "stt",
    key: "stt",
    // width: "32%",
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
]


function Staff() {
  const [data, setData] = useState([])
  const [currentPage, setCurrentPage] = useState(1)
  const [pageSize, setPageSize] = useState(10)
  const [length, setLength] = useState()
  const [loading, setLoading] = useState(true)
  const [visible, setVisible] = useState(false)
  const [loadingButton, setLoadingButton] = useState(false)

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
  }, [currentPage, pageSize])

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/staffs', {
      //'Authorization': `Bearer ${token}`
    }).then(response => setLength(response.data.length))
      .catch(error => console.log(error.response))
  }, [])

  const onFinish = (values) => {
    console.log(values)
    setLoadingButton(true)
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
      const centerId = localStorage.getItem('centerId')
      image = response.data.urlImage
      console.log({
        name: values.name,
        gender: values.gender,
        email: values.email,
        image,
        centerId
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
        centerId
        // }
      }).then(response => {
        console.log(response.data)
        setLoadingButton(false)
        setVisible(false)
      })
        .catch(error => console.log(error.response))
    }).catch(error => console.log(error.response))
  }

  return (
    <>
      <div className="tabled">
        <Row gutter={[24, 0]}>
          <Col xs="24" xl={24}>
            <Card
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Quản lý nhân viên"
              extra={
                <Button type='primary' onClick={() => {
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
        title='Tạo tài khoản nhân viên'
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
          >
            <Select defaultValue="Giới tính" onChange={(value) => console.log(value)}>
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
            rules={[{ required: true, message: 'Vui lòng tải lên ảnh' }]}
          >
            <Upload
              listType='picture'
              maxCount={1}
              beforeUpload={() => false}
            >
              <Button icon={<UploadOutlined />}>Tải hình ảnh</Button>
            </Upload>
          </Form.Item>

          <Form.Item>
            <Button type="primary" htmlType="submit" loading={loadingButton}>
              Đăng kí
            </Button>
          </Form.Item>
        </Form>
      </Modal>
    </>
  )
}

export default Staff
