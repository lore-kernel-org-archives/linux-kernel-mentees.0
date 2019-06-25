From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 25 Jun 2019 01:26:27 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 6/6] Documentation: RCU: Add TOC
	tree hooks
In-Reply-To: <20190623081413.7095-1-c0d1n61at3@gmail.com>
References: <20190623081413.7095-1-c0d1n61at3@gmail.com>
Message-ID: <20190625062627.26378-7-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190625062627.xP0IOmE6SyUJM9CBIUMsHZEaRe0ucA1E8WuEe44BgDI@z>

Add TOC tree hooks for:
  - rcu
  - list_rcu
  - up_rcu

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/index.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/RCU/index.rst

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
new file mode 100644
index 000000000000..8349dd598bb8
--- /dev/null
+++ b/Documentation/RCU/index.rst
@@ -0,0 +1,19 @@
+.. _rcu_concepts:
+
+============
+RCU concepts
+============
+
+.. toctree::
+   :maxdepth: 1
+
+   rcu
+   list_rcu
+   up_rcu
+
+.. only:: subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.22.0
