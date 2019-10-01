From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Mon, 30 Sep 2019 22:18:20 -0500
Subject: [Linux-kernel-mentees] [PATCH v4 0/3] cec-compliance: tuner control
In-Reply-To: <20190930043017.474025-1-c0d1n61at3@gmail.com>
References: <20190930043017.474025-1-c0d1n61at3@gmail.com>
Message-ID: <20191001031823.312020-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series implements analog tuner step features and cec-compliance tests.
Added tuner_ctl_test() to test new tuner features implemented in the cec-follower.

---

changes made since v3:
  - Correct commit message for tuner emulation bug fix
  - Refactor analog_get_nearest_freq_idx() to return freq index
  - Refactor analog_get_type_system_idx() to set device info
  - Add macro ARRAY_SIZE_ANA_FREQS
  - Refactor tuner_ctl_test() to use std::vector

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
  cec-compliance: add tuner control test

 utils/cec-compliance/cec-test.cpp   | 91 +++++++++++++++++++++++++++++
 utils/cec-follower/cec-follower.cpp |  2 +-
 utils/cec-follower/cec-follower.h   |  3 +-
 utils/cec-follower/cec-tuner.cpp    | 73 +++++++++++++++++------
 4 files changed, 150 insertions(+), 19 deletions(-)

-- 
2.23.0
