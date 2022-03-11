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
import { useState, useEffect } from "react"

import {
  Row,
  Col,
  Card,
  Button,
  List,
  Descriptions,
  Avatar,
  Radio,
  Switch,
  Upload,
  message,
  Spin,
  Table,
  Modal,
  Form,
  Input
} from "antd"

import {
  FacebookOutlined,
  TwitterOutlined,
  InstagramOutlined,
  VerticalAlignTopOutlined,
  EditOutlined,
  UploadOutlined,
} from "@ant-design/icons"

import BgProfile from "../assets/images/bg-profile.jpg"
import profilavatar from "../assets/images/face-1.jpg"
import convesionImg from "../assets/images/face-3.jpg"
import convesionImg2 from "../assets/images/face-4.jpg"
import convesionImg3 from "../assets/images/face-5.jpeg"
import convesionImg4 from "../assets/images/face-6.jpeg"
import convesionImg5 from "../assets/images/face-2.jpg"
import project1 from "../assets/images/home-decor-1.jpeg"
import project2 from "../assets/images/home-decor-2.jpeg"
import project3 from "../assets/images/home-decor-3.jpeg"
import jwtDecode from "jwt-decode"
import axios from "axios"

function Profile() {
  const [imageURL, setImageURL] = useState(false)
  const [, setLoading] = useState(false)
  const [user, setUser] = useState()
  const [loadingButton, setLoadingButton] = useState(false)
  const [visible, setVisible] = useState(false)
  const [refresh, setRefresh] = useState(false)
  // const [data, setData] = useState([])

  const [form] = Form.useForm()

  useEffect(() => {
    const token = localStorage.getItem('token')
    const decode = jwtDecode(token)
    axios.get(`https://pegoda.azurewebsites.net/api/v1.0/users?email=${decode.Email}`, {
      // 'Authorization': `Bearer ${token}`
    }).then((response) => {
      console.log(response.data)
      setUser(response.data)
    }).catch(error => console.log(error))
  }, [refresh])

  const onFinish = (values) => {
    console.log(values)
    setLoadingButton(true)
    if (!values.image) {
      axios.get(`https://pegoda.azurewebsites.net/api/v1.0/users?email=${values.email}`, {
        //'Authorization': `Bearer ${token}`
      }).then((response) => {
        console.log(response)
        axios.put(`https://pegoda.azurewebsites.net/api/v1.0/users/${response.data.id}`, {
          // headers: {
          //   'Authorization': `Bearer ${token}`
          // },
          // data: {
          id: response.data.id,
          name: values.name,
          email: values.email,
          address: values.address,
          image: response.data.image,
          roleId: response.data.roleId
          // }
        }).then(() => {
          setLoadingButton(false)
          setVisible(false)
          setRefresh(true)
        }).catch(error => console.log(error.response))
      }).catch(error => console.log(error.response))
    } else {
      const formData = new FormData()
      formData.append('file', values.image.file)
      let image = ''
      axios.post('https://pegoda.azurewebsites.net/api/v1.0/uploads', formData, {
        headers: {
          //'Authorization': `Bearer ${token}`
          'Content-Type': `multipart/form-data`
        }
      }).then((response) => {
        console.log(response.data)
        image = response.data.urlImage
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/users?email=${values.email}`, {
          //'Authorization': `Bearer ${token}`
        }).then((response) => {
          console.log(response)
          !values.image &&
            axios.put(`https://pegoda.azurewebsites.net/api/v1.0/users/${response.data.id}`, {
              // headers: {
              //   'Authorization': `Bearer ${token}`
              // },
              // data: {
              id: response.data.id,
              name: values.name,
              email: values.email,
              address: values.address,
              image,
              roleId: response.data.roleId
              // }
            }).then(() => {
              setLoadingButton(false)
              setVisible(false)
              setRefresh(!refresh)
            }).catch(error => console.log(error.response))
        }).catch(error => console.log(error.response))
      }).catch(error => console.log(error.response))
    }
  }


  return (
    <>
      {!user
        ? <Spin size='large' />
        :
        <>
          <div
            className="profile-nav-bg"
            style={{ backgroundImage: "url(" + BgProfile + ")" }}
          ></div>
          <Card
            className="card-profile-head"
            bodyStyle={{ display: "none" }}
            title={
              <Row justify="space-between" align="middle" gutter={[24, 0]}>
                <Col span={24} md={12} className="col-info">
                  <Avatar.Group>
                    <Avatar size={74} shape="square" src={user.image} />

                    <div className="avatar-info">
                      <h4 className="font-semibold m-0">{user.name}</h4>
                      {/* <p>CEO / Co-Founder</p> */}
                    </div>
                  </Avatar.Group>
                </Col>
                {/* <Col
                  span={24}
                  md={12}
                  style={{
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "flex-end",
                  }}
                >
                  <Radio.Group defaultValue="a">
                    <Radio.Button value="a">OVERVIEW</Radio.Button>
                    <Radio.Button value="b">TEAMS</Radio.Button>
                    <Radio.Button value="c">PROJECTS</Radio.Button>
                  </Radio.Group>
                </Col> */}
              </Row>
            }
          ></Card>
          <Card
            bordered={false}
            title={<h6 className="font-semibold m-0">Thông Tin Cá Nhân</h6>}
            className="header-solid"
            bodyStyle={{ paddingTop: 0, paddingBottom: 16 }}
          >
            <table className='table'>
              <thead>
                <tr>
                  <th scope="col">Họ Và Tên</th>
                  <th scope="col">Email</th>
                  <th scope="col">Địa Chỉ</th>
                  <th scope="col">Hình Ảnh</th>
                  <th scope="col">Hành Động</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>{user.name}</td>
                  <td>{user.email}</td>
                  <td>{user.address}</td>
                  <td>
                    <img src={user.image} alt='hinhanh' style={{ width: 100 }} />
                  </td>
                  <td>
                    <EditOutlined
                      style={{ cursor: 'pointer', fontSize: 30 }}
                      onClick={() => {
                        setVisible(true)
                        form.setFieldsValue({
                          name: user.name,
                          email: user.email,
                          address: user.address,
                        })
                      }}
                    />
                  </td>
                </tr>
              </tbody>
            </table>
          </Card>
          <Modal
            title='Thay đổi thông tin'
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
                name="email"
                rules={[{ required: true, message: 'Vui lòng nhập email' }]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label="Địa Chỉ"
                name="address"
                rules={[{ required: true, message: 'Vui lòng nhập địa chỉ' }]}
              >
                <Input />
              </Form.Item>
              <Form.Item
                label='Hình ảnh'
                name='image'
              // rules={[{ required: true, message: 'Vui lòng tải lên ảnh' }]}
              >
                <Upload
                  listType='picture'
                  maxCount={1}
                  beforeUpload={() => false}
                  onChange={(e) => {
                    console.log(e)
                    if (e.fileList.length > 0) {
                      document.getElementById('hinhanh').style.display = 'none'
                    } else {
                      document.getElementById('hinhanh').style.display = 'block'
                    }
                  }}
                >
                  <Row>
                    <Col span={12} id='hinhanh' >
                      <img src={user.image} alt='hinhanh' width={70} />
                    </Col>
                    <Col span={12}>
                      <Button
                        icon={<UploadOutlined />}>Tải hình ảnh</Button>
                    </Col>
                  </Row>
                </Upload>
              </Form.Item>

              <Form.Item>
                <Button type="primary" htmlType="submit" loading={loadingButton}>
                  Submit
            </Button>
              </Form.Item>
            </Form>
          </Modal>
        </>
      }
    </>
  )
}

export default Profile
