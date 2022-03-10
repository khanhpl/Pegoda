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
import {
  Row,
  Col,
  Card,
  Radio,
  Table,
  Upload,
  message,
  Progress,
  Button,
  Avatar,
  Typography,
  Pagination,
  Form,
  Input,
  Select,
  Modal,
  InputNumber
} from "antd"

import { ToTopOutlined } from "@ant-design/icons"
import { Link } from "react-router-dom"

// Images
import ava1 from "../assets/images/logo-shopify.svg"
import ava2 from "../assets/images/logo-atlassian.svg"
import ava3 from "../assets/images/logo-slack.svg"
import ava5 from "../assets/images/logo-jira.svg"
import ava6 from "../assets/images/logo-invision.svg"
import face from "../assets/images/face-1.jpg"
import face2 from "../assets/images/face-2.jpg"
import face3 from "../assets/images/face-3.jpg"
import face4 from "../assets/images/face-4.jpg"
import face5 from "../assets/images/face-5.jpeg"
import face6 from "../assets/images/face-6.jpeg"
import pencil from "../assets/images/pencil.svg"
import { useState, useEffect } from "react"
import axios from "axios"
import { useForm } from "antd/lib/form/Form"

const { Title } = Typography
const { Option } = Select

const formProps = {
  name: "file",
  action: "https://www.mocky.io/v2/5cc8019d300000980a055e76",
  headers: {
    authorization: "authorization-text",
  },
  onChange(info) {
    if (info.file.status !== "uploading") {
      console.log(info.file, info.fileList)
    }
    if (info.file.status === "done") {
      message.success(`${info.file.name} file uploaded successfully`)
    } else if (info.file.status === "error") {
      message.error(`${info.file.name} file upload failed.`)
    }
  },
}
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
    title: "Địa Chỉ",
    key: "address",
    dataIndex: "address",
  },
  {
    title: "Kinh Độ",
    key: "longitude",
    dataIndex: "longitude",
  },
  {
    title: "Vĩ Độ",
    key: "latitude",
    dataIndex: "latitude",
  },
]


function Center() {
  const [visible, setVisible] = useState(false)
  const [loadingButton, setLoadingButton] = useState(false)

  const [form] = Form.useForm()

  const [data, setData] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/centers', {
      //'Authorization': `Bearer ${token}`
    }).then((response) => {
      console.log(response.data)
      setData(response.data)
      setLoading(false)
    })
      .catch(error => console.log(error.response))
  }, [])

  const onFinish = (values) => {
    console.log(values)
    setLoadingButton(true)
    axios.post('https://pegoda.azurewebsites.net/api/v1.0/centers/register', {
      name: values.name,
      description: values.description,
      address: values.address,
      longitude: values.longitude,
      latitude: values.latitude
    }).then(response => {
      console.log(response.data)
      setLoadingButton(false)
      setVisible(false)
    }).catch(error => console.log(error))
  }

  return (
    <>
      <div className="tabled">
        <Row gutter={[24, 0]}>
          <Col xs="24" xl={24}>
            <Card
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Quản lý cửa hàng"
              extra={
                <Button type='primary' onClick={() => {
                  setVisible(true)
                }}>Tạo Cửa Hàng</Button>
              }
            >
              <div className="table-responsive">
                <Table
                  columns={columns}
                  dataSource={data}
                  pagination={true}
                  loading={loading}
                  className="ant-border-space"
                />
              </div>
            </Card>
          </Col>
        </Row>
      </div>
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
            label="Tên Cửa Hàng"
            name="name"
            rules={[{ required: true, message: 'Vui lòng nhập tên cửa hàng' }]}
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
          <Form.Item
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

export default Center
