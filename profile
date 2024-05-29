
- name: Set JAVA_HOME and PATH in profile file
  block:
    - name: Add JAVA_HOME and PATH to profile file
      lineinfile:
        path: /etc/profile
        line: |
          export JAVA_HOME=/opt/jdk/{{ jdk_version }}
          export PATH=$JAVA_HOME/bin:$PATH
      backup: yes
      state: present
  rescue:
    - name: Replace existing JAVA_HOME and PATH in profile file
      replace:
        path: /etc/profile
        regexp: 'export JAVA_HOME=.*'
        replace: 'export JAVA_HOME=/opt/jdk/{{ jdk_version }}'
    - replace:
        path: /etc/profile
        regexp: 'export PATH=\$JAVA_HOME/bin:\$PATH'
        replace: 'export PATH=$JAVA_HOME/bin:$PATH'
