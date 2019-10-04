From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Thu,  3 Oct 2019 23:05:05 -0500
Subject: [Linux-kernel-mentees] [PATCH v6 0/1] cec-compliance: tuner control
In-Reply-To: <20191003031816.168985-1-c0d1n61at3@gmail.com>
References: <20191003031816.168985-1-c0d1n61at3@gmail.com>
Message-ID: <20191004040506.31488-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series implements analog tuner step features and cec-compliance tests.
Added tuner_ctl_test() to test new tuner features implemented in the cec-follower.

---

Changes made since v5:
  - Add missing fail_on_test(cec_msg_status_is_abort(&msg)): hverkuil
  - Remove redundant test unrecognized_op(&msg): hverkuil
  - Refactor tuner_ctl_test to use memcmp(): hverkuil

Changes made since v4:
  - Add TOT_ANALOG_FREQS macro: hverkuil
  - Rename function to analog_update_tuner_dev_info(): hverkuil
  - Set freq_idx in analog_update_tuner_dev_info(): hverkuil
  - Reuse info variable in tuner_ctl_test(): hverkuil
  - Refactor tuner_ctl_test() to leverage timed_out_or_abort() and
    abort_reason(): hverkuil

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

Jiunn Chang (1):
  Add test for new features in cec-follower

 utils/cec-compliance/cec-test.cpp | 75 +++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

-- 
2.23.0
