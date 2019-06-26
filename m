From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 15:07:04 -0500
Subject: [Linux-kernel-mentees] [PATCH v5 4/5] Documentation: RCU: Rename
	txt files to rst
In-Reply-To: <20190626191249.21135-1-c0d1n61at3@gmail.com>
References: <20190626191249.21135-1-c0d1n61at3@gmail.com>
Message-ID: <20190626200705.24501-5-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626200704.YqoLu8N0DtqzPBNDZ-l5Chcd_asZOVLUVOkwzRrlsUU@z>

Rename the following files to reST:
  - rcu.txt
  - listRCU.txt
  - UP.txt

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/{UP.txt => UP.rst}           | 0
 Documentation/RCU/{listRCU.txt => listRCU.rst} | 0
 Documentation/RCU/{rcu.txt => rcu.rst}         | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/RCU/{UP.txt => UP.rst} (100%)
 rename Documentation/RCU/{listRCU.txt => listRCU.rst} (100%)
 rename Documentation/RCU/{rcu.txt => rcu.rst} (100%)

diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/UP.rst
similarity index 100%
rename from Documentation/RCU/UP.txt
rename to Documentation/RCU/UP.rst
diff --git a/Documentation/RCU/listRCU.txt b/Documentation/RCU/listRCU.rst
similarity index 100%
rename from Documentation/RCU/listRCU.txt
rename to Documentation/RCU/listRCU.rst
diff --git a/Documentation/RCU/rcu.txt b/Documentation/RCU/rcu.rst
similarity index 100%
rename from Documentation/RCU/rcu.txt
rename to Documentation/RCU/rcu.rst
-- 
2.22.0
