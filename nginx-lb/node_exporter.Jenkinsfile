pipeline{
    agent{label "worker1"}
        stages{
            stage('node_exporter service'){
                steps{
                    sh '''
                    wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0-rc.0/node_exporter-1.0.0-rc.0.linux-amd64.tar.gz
                    tar -xzf node_exporter-1.0.0-rc.0.linux-amd64.tar.gz
                    mv node_exporter-1.0.0-rc.0.linux-amd64/node_exporter /usr/local/bin/
                    echo '[Unit]
                    Description=Node Exporter
                    Wants=network-online.target
                    After=network-online.target

                    [Service]
                    User=root
                    Group=root
                    Type=simple
                    Restart=on-failure
                    ExecStart=/usr/local/bin/node_exporter

                    [Install]
                    WantedBy=multi-user.target
                    ' >/etc/systemd/system/node_exporter.service
                    systemctl daemon-reload
                    systemctl enable node_exporter
                    systemctl start node_exporter
                    '''               
            }
        }
    }
}
