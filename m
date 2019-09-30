From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 29 Sep 2019 23:30:14 -0500
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] cec-compliance: tuner control
In-Reply-To: <20190924192445.93575-1-c0d1n61at3@gmail.com>
References: <20190924192445.93575-1-c0d1n61at3@gmail.com>
Message-ID: <20190930043017.474025-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series implements analog tuner step increment/decrement as well as
performs cec-compliance tests.  Tests where refactored into a single function,
tuner_ctl_test(), to test all tuner features.

---

Changes made since v2:
  - Fix bugs for tuner emulation
  - Add freq_idx to cec-follower state
  - Refactor tuner tests into a single tuner_ctl_test()

Changes made since v1:
  - Remove redundant error checking
  - Add circular wrap logic to tuner step increment/decrement

Jiunn Chang (3):
  cec-follower: fix bugs for tuner emulation
  cec-follower: add tuner step increment/decrement
  cec-compliance: refactor tuner control tests

 utils/cec-compliance/cec-test.cpp   | 184 ++++++++--------------------
 utils/cec-follower/cec-follower.cpp |   2 +-
 utils/cec-follower/cec-follower.h   |   3 +-
 utils/cec-follower/cec-tuner.cpp    |  93 +++++++++++---
 4 files changed, 135 insertions(+), 147 deletions(-)

-- 
2.23.0
