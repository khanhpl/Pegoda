import { UploadOutlined, EditOutlined, DeleteOutlined } from '@ant-design/icons'
import { Button, Card, Col, Form, Input, Modal, Row, Table, Upload, Space, Popconfirm } from 'antd'
import axios from 'axios'
import { useEffect, useState } from 'react'

const ServiceType = () => {
    const [visible, setVisible] = useState(false)
    const [loadingButton, setLoadingButton] = useState(false)
    const [loading, setLoading] = useState(true)
    const [data, setData] = useState([])
    const [length, setLength] = useState()
    const [pageSize, setPageSize] = useState(10)
    const [currentPage, setCurrentPage] = useState(1)
    const [textButton, setTextButton] = useState({
        key: 0,
        value: 'Tạo '
    })
    const [urlImage, setUrlImage] = useState('')
    const [title, setTitle] = useState('Tạo loại dịch vụ')

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
            title: "Hành Động",
            key: "action",
            dataIndex: "action",
            render: (_, record) => (
                <Space size='large'>
                    <EditOutlined style={{ fontSize: 18 }} onClick={() => {
                        onEdit(record.id)
                        setTextButton({
                            key: 1,
                            value: 'Chỉnh sửa'
                        })
                        setTitle('Chỉnh sửa loại dịch vụ')
                        setVisible(true)
                    }} />
                    <Popconfirm
                        title="Bạn có chắc chắn xoá loại dịch vụ này không?"
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
            axios({
                url: 'https://pegoda.azurewebsites.net/api/v1.0/servicetypes',
                method: 'post',
                headers: {
                    // Authorization: `Bearer ${token}`
                },
                data: {
                    name: values.name,
                }
            }).then(() => {
                setLoadingButton(false)
                setVisible(false)
            }).catch(error => console.log(error))
        } else if (textButton.key === 1) {
            axios({
                url: `https://pegoda.azurewebsites.net/api/v1.0/servicetypes/${values.id}`,
                method: 'put',
                headers: {
                    // Authorization: `Bearer ${token}`
                },
                data: {
                    id: values.id,
                    name: values.name,
                    status: 'active',
                }
            }).then(() => {
                setLoadingButton(false)
                setVisible(false)
            }).catch(error => console.log(error))
        }

        // if (textButton.key === 0) {
        //     if (!values.image) {
        //         axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
        //             // headers: {
        //             //   'Authorization': `Bearer ${token}`
        //             // },
        //             // data: {
        //             name: values.name,
        //             email: values.email,
        //             image: null,
        //             address: values.address
        //             // }
        //         }).then(response => {
        //             console.log(response.data)
        //             setLoadingButton(false)
        //             setVisible(false)
        //         })
        //             .catch(error => console.log(error.response))
        //     } else {
        //         const formData = new FormData()
        //         formData.append('file', values.image.file)
        //         let image = ''
        //         axios.post('https://pegoda.azurewebsites.net/api/v1.0/uploads', formData, {
        //             headers: {
        //                 //'Authorization': `Bearer ${token}`
        //                 'Content-Type': `multipart/form-data; boundary=${data._boundary}`
        //             }
        //         }).then((response) => {
        //             console.log(response.data)
        //             image = response.data.urlImage
        //             axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
        //                 // headers: {
        //                 //   'Authorization': `Bearer ${token}`
        //                 // },
        //                 // data: {
        //                 name: values.name,
        //                 email: values.email,
        //                 image,
        //                 address: values.address
        //                 // }
        //             }).then(response => {
        //                 console.log(response.data)
        //                 setLoadingButton(false)
        //                 setVisible(false)
        //             })
        //                 .catch(error => console.log(error.response))
        //         }).catch(error => console.log(error.response))
        //     }
        // } else {
        //     if (urlImage || !values.image) {
        //         axios({
        //             url: `https://pegoda.azurewebsites.net/api/v1.0/users/${values.id}`,
        //             method: 'put',
        //             headers: {
        //                 // Authorization: `Bearer ${token}`
        //             },
        //             data: {
        //                 id: values.id,
        //                 name: values.name,
        //                 email: values.email,
        //                 image: urlImage,
        //                 address: values.address,
        //                 roleId: values.roleId
        //             }
        //         }).then(() => {
        //             setLoadingButton(false)
        //             setVisible(false)
        //         }).catch(error => console.log(error))
        //     } else {
        //         const formData = new FormData()
        //         formData.append('file', values.image.file)
        //         let image = ''
        //         axios.post('https://pegoda.azurewebsites.net/api/v1.0/uploads', formData, {
        //             headers: {
        //                 //'Authorization': `Bearer ${token}`
        //                 'Content-Type': `multipart/form-data; boundary=${data._boundary}`
        //             }
        //         }).then((response) => {
        //             console.log(response.data)
        //             image = response.data.urlImage
        //             axios({
        //                 url: `https://pegoda.azurewebsites.net/api/v1.0/users/${values.id}`,
        //                 method: 'put',
        //                 headers: {
        //                     // Authorization: `Bearer ${token}`
        //                 },
        //                 data: {
        //                     id: values.id,
        //                     name: values.name,
        //                     email: values.email,
        //                     image,
        //                     address: values.address,
        //                     roleId: values.roleId
        //                 }
        //             }).then(() => {
        //                 setLoadingButton(false)
        //                 setVisible(false)
        //             }).catch(error => console.log(error))
        //         }).catch(error => console.log(error.response))
        // }
        // }
    }

    useEffect(() => {
        axios.get('https://pegoda.azurewebsites.net/api/v1.0/servicetypes', {
            //'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log(response.data)
            setLength(response.data.length)
        }).catch(error => console.log(error))
    }, [])

    useEffect(() => {
        axios.get(`https://pegoda.azurewebsites.net/api/v1.0/servicetypes?pageNumber=${currentPage}&pageSize=${pageSize}`)
            .then((response) => {
                console.log(response.data)
                setData(response.data)
                setLoading(false)
            })
            .catch(error => console.log(error))
    }, [currentPage, pageSize, loadingButton])

    const onEdit = (id) => {
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/servicetypes/${id}`,
            method: 'get',
            headers: {
                // Authorization: `Bearer ${token}`
            },
        }).then((response) => {
            form.setFieldsValue({
                id: response.data.id,
                name: response.data.name,
            }).catch(error => console.log(error))
        })
        // axios({
        //     url: `https://pegoda.azurewebsites.net/api/v1.0/users?email=${email}`,
        //     method: 'get',
        //     headers: {
        //         // Authorization: `Bearer ${token}`
        //     }
        // }).then((response) => {
        //     form.setFieldsValue({
        //         id: response.data.id,
        //         name: response.data.name,
        //         email: response.data.email,
        //         address: response.data.address,
        //         roleId: response.data.roleId
        //     })
        //     setUrlImage(response.data.image)
        // }).catch(error => console.log(error))

    }

    const confirmDelete = (id) => {
        axios({
            url: `https://pegoda.azurewebsites.net/api/v1.0/servicetypes/${id}`,
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
                            title="Quản lý loại dịch vụ"
                            extra={
                                <Button type='primary' onClick={() => {
                                    setTextButton({
                                        key: 0,
                                        value: 'Tạo'
                                    })
                                    setUrlImage('')
                                    setVisible(true)
                                }}>Tạo loại dịch vụ</Button>
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
                        label="id"
                        name="id"
                        style={{ display: 'none' }}
                    >
                        <Input />
                    </Form.Item>
                    <Form.Item
                        label="Tên loại dịch vụ"
                        name="name"
                    >
                        <Input />
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

export default ServiceType