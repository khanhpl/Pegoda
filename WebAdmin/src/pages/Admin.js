import { Button, Col, Row, Card, Modal, Form, Input, InputNumber, Table } from 'antd'
import { useState, useEffect } from 'react'

const Admin = () => {
    const [visible, setVisible] = useState(false)
    const [loadingButton, setLoadingButton] = useState(false)
    const [loading, setLoading] = useState(true)
    const [data, setData] = useState([])

    const [form] = Form.useForm()

    const onFinish = () => {

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

export default Admin