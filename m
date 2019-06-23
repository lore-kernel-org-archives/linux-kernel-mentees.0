From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Sun, 23 Jun 2019 03:14:06 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 0/7] Documentation: RCU: Convert to
In-Reply-To: <20190622090046.178d9d16@lwn.net>
References: <20190622090046.178d9d16@lwn.net>
Message-ID: <20190623081413.7095-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190623081406.AtHEJoVCQQxQWR9NG1HuEMIUi87xAAeMyEcwDa2onUk@z>

This patch series is the initial conversion of the RCU documentation
section.

[PATCH v2 0/7] Documentation: RCU: Convert the following to ReST
[PATCH v2 1/7] Documentation: RCU: Convert RCU basic concepts to ReST
	- ReST markup and TOC tree hook.
[PATCH v2 2/7] Documentation: RCU: Rename RCU basic concepts to ReST
	- Rename RCU basic concepts txt file to rst.
[PATCH v2 3/7] Documentation: RCU: Convert RCU linked list to ReST
	- ReST markup and TOC tree hook.
[PATCH v2 4/7] Documentation: RCU: Rename RCU linked list to ReST
	- Rename RCU linked list txt file to rst.
[PATCH v2 5/7] Documentation: RCU: Convert RCU UP systems to ReST
	- ReST markup and TOC tree hook.
[PATCH v2 6/7] Documentation: RCU: Rename RCU UP systems to ReST
	- Rename RCU UP systems txt file to rst.
[PATCH v2 6/7] Documentation: RCU: Add links to rcu.rst
	- Add the following links to rcu.rst:
		list_rcu
		up_rcu

[PATCH 1/3] Documentation: RCU: Convert RCU basic concepts to ReST
	- Convert RCU basic concepts and add TOC tree hook.
[PATCH 2/3] Documentation: RCU: Convert RCU linked list to ReST
	- Convert RCU linked list and add TOC tree hook.
[PATCH 3/3] Documentation: RCU: Convert RCU UP systems to ReST
	- Convert RCU UP systems and add TOC tree hook.

>8-----------------------------------------------------------------8<

Jiunn Chang (7):
  Documentation: RCU: Convert RCU basic concepts to ReST
  Documentation: RCU: Rename RCU basic concepts to ReST
  Documentation: RCU: Convert RCU linked list to ReST
  Documentation: RCU: Rename RCU linked list to ReST
  Documentation: RCU: Convert RCU UP systems to ReST
  Documentation: RCU: Rename RCU UP systems to ReST
  Documentation: RCU: Add links to rcu.rst

 Documentation/RCU/index.rst                   | 19 ++++
 .../RCU/{listRCU.txt => list_rcu.rst}         | 33 ++++---
 Documentation/RCU/rcu.rst                     | 91 +++++++++++++++++++
 Documentation/RCU/rcu.txt                     | 89 ------------------
 Documentation/RCU/{UP.txt => up_rcu.rst}      | 27 +++---
 5 files changed, 143 insertions(+), 116 deletions(-)
 create mode 100644 Documentation/RCU/index.rst
 rename Documentation/RCU/{listRCU.txt => list_rcu.rst} (93%)
 create mode 100644 Documentation/RCU/rcu.rst
 delete mode 100644 Documentation/RCU/rcu.txt
 rename Documentation/RCU/{UP.txt => up_rcu.rst} (89%)

-- 
2.22.0
