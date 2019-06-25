From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 01:26:25 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 4/6] Documentation: RCU: Rename
	txt files to rst
In-Reply-To: <20190623081413.7095-1-c0d1n61at3@gmail.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
Message-ID: <20190625062627.26378-5-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

Rename the following files to reST:
  - rcu.txt
  - listRCU.txt
  - UP.txt

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/{listRCU.txt => list_rcu.rst} | 0
 Documentation/RCU/{rcu.txt => rcu.rst}          | 0
 Documentation/RCU/{UP.txt => up_rcu.rst}        | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/RCU/{listRCU.txt => list_rcu.rst} (100%)
 rename Documentation/RCU/{rcu.txt => rcu.rst} (100%)
 rename Documentation/RCU/{UP.txt => up_rcu.rst} (100%)

diff --git a/Documentation/RCU/listRCU.txt b/Documentation/RCU/list_rcu.rst
similarity index 100%
rename from Documentation/RCU/listRCU.txt
rename to Documentation/RCU/list_rcu.rst
diff --git a/Documentation/RCU/rcu.txt b/Documentation/RCU/rcu.rst
similarity index 100%
rename from Documentation/RCU/rcu.txt
rename to Documentation/RCU/rcu.rst
diff --git a/Documentation/RCU/UP.txt b/Documentation/RCU/up_rcu.rst
similarity index 100%
rename from Documentation/RCU/UP.txt
rename to Documentation/RCU/up_rcu.rst
-- 
2.22.0
