From: c0d1n61at3@gmail.com (Jiunn Chang)
Date: Tue, 24 Sep 2019 09:17:50 -0500
Subject: [Linux-kernel-mentees] [PATCH 0/2] cec-compliance: tuner control
Message-ID: <20190924141752.5508-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20190924141750.V4o5AxPMidUcUpATmLYyzgCfYn-A0sgeskmhawZeMho@z>

This patch series implements analog tuner step increment/decrement as well as performs
cec-compliance tests for: select analog service, give tuner device status, and analog
step increment/decrement.  New tests where added for tuner step increment/decrement and
existing tests where refactored for select analog service and give tuner device status.

---

Jiunn Chang (2):
  cec-follower: add tuner step increment/decrement
  cec-compliance: add/refactor tuner control tests

 utils/cec-compliance/cec-test.cpp | 181 +++++++++++++++++++++++-------
 utils/cec-follower/cec-tuner.cpp  |  49 +++++++-
 2 files changed, 186 insertions(+), 44 deletions(-)

-- 
2.23.0
