From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Tue, 24 Sep 2019 14:24:43 -0500
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] cec-compliance: tuner control
In-Reply-To: <20190924141752.5508-1-c0d1n61at3@gmail.com>
References: <20190924141752.5508-1-c0d1n61at3@gmail.com>
Message-ID: <20190924192445.93575-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series implements analog tuner step increment/decrement as well as performs
cec-compliance tests for: select analog service, give tuner device status, and analog
step increment/decrement.  New tests where added for tuner step increment/decrement and
existing tests where refactored for select analog service and give tuner device status.

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

---

Jiunn Chang (2):
  cec-follower: add tuner step increment/decrement
  cec-compliance: add/refactor tuner control tests

 utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
 utils/cec-follower/cec-tuner.cpp  |  47 +++++++-
 2 files changed, 184 insertions(+), 44 deletions(-)

-- 
2.23.0
