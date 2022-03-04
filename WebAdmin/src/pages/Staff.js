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
import { Card, Col, Row, Table } from "antd"
import axios from "axios"
import { useEffect, useState } from "react"


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
    dataIndex: "center",
  },
]


function Staff() {
  const [data, setData] = useState([])
  const [currentPage, setCurrentPage] = useState(1)
  const [pageSize, setPageSize] = useState(10)
  const [length, setLength] = useState()
  const [loading, setLoading] = useState(true)

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

  return (
    <>
      <div className="tabled">
        <Row gutter={[24, 0]}>
          <Col xs="24" xl={24}>
            <Card
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Quản lý nhân viên"
            // extra={
            //   <>
            //     <Radio.Group onChange={onChange} defaultValue="a">
            //       <Radio.Button value="a">All</Radio.Button>
            //       <Radio.Button value="b">ONLINE</Radio.Button>
            //     </Radio.Group>
            //   </>
            // }
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
              {/* <Pagination style={{ paddingTop: 20, paddingRight: 10, paddingBottom: 10, float: 'right' }} defaultCurrent={1} total={20} /> */}
            </Card>
          </Col>
        </Row>
      </div>
    </>
  )
}

export default Staff
