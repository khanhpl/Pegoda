import { UploadOutlined } from '@ant-design/icons'
import { Button, Card, Col, Form, Input, Modal, Row, Table, Upload } from 'antd'
import axios from 'axios'
import { useEffect, useState } from 'react'

const Admin = () => {
    const [visible, setVisible] = useState(false)
    const [loadingButton, setLoadingButton] = useState(false)
    const [loading, setLoading] = useState(true)
    const [data, setData] = useState([])

    const [form] = Form.useForm()

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
            axios.post('https://pegoda.azurewebsites.net/api/v1.0/users/register', {
                // headers: {
                //   'Authorization': `Bearer ${token}`
                // },
                // data: {
                name: values.name,
                email: values.email,
                image,
                address: values.address
                // }
            }).then(response => {
                console.log(response.data)
                setLoadingButton(false)
                setVisible(false)
            })
                .catch(error => console.log(error.response))
        }).catch(error => console.log(error.response))
    }

    const columns = [
        {
            title: "STT",
            dataIndex: "stt",
            key: "stt",
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
        }
    ]

    useEffect(() => {
        axios.get('https://pegoda.azurewebsites.net/api/v1.0/users?roleId=9E675F86-B425-4047-A36F-08D9FB37C635', {
            //'Authorization': `Bearer ${token}`
        }).then(response => {
            console.log(response.data)
            setData(response.data)
            setLoading(false)
        }).catch(error => console.log(error))
    }, [])

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

export default Admin