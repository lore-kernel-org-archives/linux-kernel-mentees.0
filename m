From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Wed, 26 Jun 2019 14:12:49 -0500
Subject: [Linux-kernel-mentees] [PATCH v4 5/5] Documentation: RCU: Add TOC
	tree hooks
In-Reply-To: <20190625062627.26378-1-c0d1n61at3@gmail.com>
References: <20190625062627.26378-1-c0d1n61at3@gmail.com>
Message-ID: <20190626191249.21135-6-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190626191249.ClOYOVi115UwJJNChvQPbIJR1V0KmcQIRLRs1HtzDMs@z>

Add TOC tree hooks for:
  - rcu
  - listRCU
  - UP

Signed-off-by: Jiunn Chang <c0d1n61at3 at gmail.com>
---
 Documentation/RCU/index.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/RCU/index.rst

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
new file mode 100644
index 000000000000..340a9725676c
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
+   listRCU
+   UP
+
+.. only:: subproject and html
+
+   Indices
+   =======
+
+   * :ref:`genindex`
-- 
2.22.0
