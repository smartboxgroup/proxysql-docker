# proxysql-docker

During image build ProxySQL code will be fetched from https://github.com/renecannao/proxysql master branch and compiled.
You can override the git repo and branch to fetch the code from using environment valiables

## ENV Vars

<table>
  <tr>
    <th>Name</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>GIT_BRANCH</tt></td>
    <td>Where to get the ProxySQL code from</td>
    <td><tt>master</tt></td>
  </tr>
  <tr>
    <td><tt>GIT_REPO</tt></td>
    <td>Where to get the ProxySQL code from</td>
    <td><tt>https://github.com/renecannao/proxysql</tt></td>
  </tr>
  <tr>
    <td><tt>CONF_FILE</tt></td>
    <td>Path to configuration file</td>
    <td><tt>/etc/proxysql/proxysql.cnf</tt></td>
  </tr>
  <tr>
    <td><tt>DATA_DIR</tt></td>
    <td>Data dir path</td>
    <td><tt>/var/run/proxysql</tt></td>
  </tr>
</table>
