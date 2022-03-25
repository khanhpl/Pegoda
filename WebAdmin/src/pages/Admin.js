import { UploadOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'
import { Button, Card, Col, Form, Input, Modal, Row, Table, Upload, Space, Popconfirm, message } from 'antd'
import axios from 'axios'
import { useEffect, useState } from 'react'

const Admin = () => {
    const [visible, setVisible] = useState(false)
    const [loadingButton, setLoadingButton] = useState(false)
    const [loading, setLoading] = useState(true)
    const [data, setData] = useState([])
    const [length, setLength] = useState()
    const [pageSize, setPageSize] = useState(10)
    const [currentPage, setCurrentPage] = useState(1)
    const [textButton, setTextButton] = useState({
        key: 0,
        value: 'Đăng kí'
    })
    const [urlImage, setUrlImage] = useState('')
    const [title, setTitle] = useState('Tạo tài khoản admin')

    const [form] = Form.useForm()

    const columns = [
        {
            title: "STT",
            dataIndex: "stt",
            key: "stt",
            width: '5%',
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
            title: "Email",
            key: "email",
            dataIndex: "email",
        },
        {
            title: "Hành Động",
            key: "action",
            dataIndex: "action",
            render: (_, record) => (
                <Space size='large'>
                    <EditOutlined style={{ fontSize: 18 }} onClick={() => {
                        onEdit(record.email)
                        setTextButton({
                            key: 1,
                            value: 'Thay đổi'
                        })
                        setTitle('Thay đổi thông tin admin')
                        setVisible(true)
                    }} />
                    <Popconfirm
                        title="Bạn có chắc chắn xoá tài khoản này không?"
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

    const onFinish = (values) => {
        console.log(values)
        setLoadingButton(true)
        if (textButton.key === 0) {
            if (!values.image) {
                axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
                    // headers: {
                    //   'Authorization': `Bearer ${token}`
                    // },
                    // data: {
                    name: values.name,
                    email: values.email,
                    image: null,
                    address: values.address,
                    status: 'active',
                    // }
                }).then(response => {
                    console.log(response.data)
                    setLoadingButton(false)
                    setVisible(false)
                })
                    .catch(error => {
                        console.log(error.response)
                        if (error.response.status === 400) {
                            message.error('Email đã tồn tại')
                        }
                        setLoadingButton(false)
                    })
            } else {
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
                    axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
                        // headers: {
                        //   'Authorization': `Bearer ${token}`
                        // },
                        // data: {
                        name: values.name,
                        email: values.email,
                        image,
                        address: values.address,
                        status: 'active'
                        // }
                    }).then(response => {
                        console.log(response.data)
                        setLoadingButton(false)
                        setVisible(false)
                    })
                        .catch(error => console.log(error.response))
                }).catch(error => console.log(error.response))
            }
        } else {
            if (urlImage || !values.image) {
                axios({
                    url: `https://pegoda.azurewebsites.net/api/v1.0/users/${values.id}`,
                    method: 'put',
                    headers: {
                        // Authorization: `Bearer ${token}`
                    },
                    data: {
                        id: values.id,
                        name: values.name,
                        email: values.email,
                        image: urlImage,
                        address: values.address,
                        status: 'active',
                        roleId: values.roleId
                    }
                }).then(() => {
                    setLoadingButton(false)
                    setVisible(false)
                }).catch(error => console.log(error))
            } else {
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
                    axios({
                        url: `https://pegoda.azurewebsites.net/api/v1.0/users/${values.id}`,
                        method: 'put',
                        headers: {
                            // Authorization: `Bearer ${token}`
                        },
                        data: {
                            id: values.id,
                            name: values.name,
                            email: values.email,
                            image,
                            address: values.address,
                            status: 'active',
                            roleId: values.roleId
                        }
                    }).then(() => {
                        setLoadingButton(false)
                        setVisible(false)
                    }).catch(error => console.log(error))
                }).catch(error => console.log(error.response))
            }
        }
    }

    useEffect(() => {
        axios.get('https://pegoda.azurewebsites.net/api/v1.0/users?roleId=9E675F86-B425-4047-A36F-08D9FB37C635', {
            //'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log(response.data)
            setLength(response.data.length)
        }).catch(error => console.log(error))
    }, [])

    useEffect(() => {
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/users?roleId=9E675F86-B425-4047-A36F-08D9FB37C635&pageNumber=${currentPage}&pageSize=${pageSize}`)
            .then((response) => {
                console.log(response.data)
                setData(response.data)
                setLoading(false)
            })
            .catch(error => console.log(error))
    }, [currentPage, pageSize, loadingButton])

    const onEdit = (email) => {
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/users?email=${email}`,
            method: 'get',
            headers: {
                // Authorization: `Bearer ${token}`
            }
        }).then((response) => {
            form.setFieldsValue({
                id: response.data.id,
                name: response.data.name,
                email: response.data.email,
                address: response.data.address,
                roleId: response.data.roleId
            })
            setUrlImage(response.data.image)
        }).catch(error => console.log(error))
    }

    const confirmDelete = (id) => {
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/users/${id}`,
            method: 'delete',
            headers: {
                // Authorization: `Bearer ${token}`
            }
        }).then(() => {
            setLoadingButton(true)
            setLoadingButton(false)
        })
            .catch(error => console.log(error))
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
                            title="Quản lý tài khoản admin"
                            extra={
                                <Button type='primary' onClick={() => {
                                    setTextButton({
                                        key: 0,
                                        value: 'Đăng kí'
                                    })
                                    setUrlImage('')
                                    setVisible(true)
                                }}>Tạo tài khoản</Button>
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
                    setUrlImage('')
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
                        label="roleId"
                        name="roleId"
                        style={{ display: 'none' }}
                    >
                        <Input />
                    </Form.Item>
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
                        name="email"
                        rules={[{ required: true, message: 'Vui lòng nhập email', type: 'email' }]}
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
                    >
                        <Upload
                            listType='picture'
                            maxCount={1}
                            beforeUpload={() => false}
                        >
                            <Button icon={<UploadOutlined />}>Tải hình ảnh</Button>
                        </Upload>
                    </Form.Item>
                    {urlImage && <img src={urlImage} alt='hinhanh' width={70} style={{ paddingBottom: 11 }} />}

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

export default Admin