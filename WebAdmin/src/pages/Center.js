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

const { Title } = Typography

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
  const onChange = (e) => console.log(`radio checked:${e.target.value}`)

  const [data, setData] = useState([])

  useEffect(() => {
    axios.get('https://pegoda.azurewebsites.net/api/v1.0/centers/search', {
      //'Authorization': `Bearer ${token}`
    }).then((response) => {
      console.log(response.data)
      setData(response.data)
    })
      .catch(error => console.log(error.response))
  }, [])

  return (
    <>
      {data && <div className="tabled">
        <Row gutter={[24, 0]}>
          <Col xs="24" xl={24}>
            <Card
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Quản lý cửa hàng"
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
                  pagination={true}
                  className="ant-border-space"
                />
              </div>
            </Card>

            {/* <Card
              bordered={false}
              className="criclebox tablespace mb-24"
              title="Projects Table"
              extra={
                <>
                  <Radio.Group onChange={onChange} defaultValue="all">
                    <Radio.Button value="all">All</Radio.Button>
                    <Radio.Button value="online">ONLINE</Radio.Button>
                    <Radio.Button value="store">STORES</Radio.Button>
                  </Radio.Group>
                </>
              }
            >
              <div className="table-responsive">
                <Table
                  columns={project}
                  dataSource={dataproject}
                  pagination={false}
                  className="ant-border-space"
                />
              </div>
              <div className="uploadfile pb-15 shadow-none">
                <Upload {...formProps}>
                  <Button
                    type="dashed"
                    className="ant-full-box"
                    icon={<ToTopOutlined />}
                  >
                    Click to Upload
                  </Button>
                </Upload>
              </div>
            </Card> */}
          </Col>
        </Row>
      </div>
      }
    </>
  )
}

export default Center
