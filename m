From: c0d1n61at3 at gmail.com (Jiunn Chang)
Date: Sun, 13 Oct 2019 23:17:13 -0500
Subject: [Linux-kernel-mentees] [PATCH 0/8] cec-compliance: add digital
	tuner support
Message-ID: <20191014041721.52025-1-c0d1n61at3@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch series will add digital tuner support to cec-compliance.
cec-follower support for the following digital broadcast systems:

  - ARIB-BS
  - ARIB-T
  - ATSC-SAT
  - ATSC-T
  - DVB-S2
  - DVB-T

has been added for 18 digital plus 81 analog for a total of 98 channels.
Tuner step features have been implemented to cycle through all available
channels with digital proceeding analog.  Channels will wrap on both ends.
Tuner testing will cycle through all channels and check status with tuner
select service following after.

---

Jiunn Chang (8):
  cec-follower: fix analog tuner device info update
  cec-follower: rename freq_idx to service_idx
  cec-follower: create digital ARIB channels
  cec-follower: create digital ATSC channels
  cec-follower: create digital DVB channels
  cec-follower: add tuner digital service emulation
  cec-follower: fix tuner step increment/decrement
  cec-compliance: add digital tuner control testing

 utils/cec-compliance/cec-test.cpp   |  50 +++-
 utils/cec-follower/cec-follower.cpp |   2 +-
 utils/cec-follower/cec-follower.h   |   4 +-
 utils/cec-follower/cec-tuner.cpp    | 375 ++++++++++++++++++++++++++--
 4 files changed, 400 insertions(+), 31 deletions(-)

-- 
2.23.0
