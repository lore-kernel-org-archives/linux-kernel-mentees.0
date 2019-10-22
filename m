From: bnvandana at gmail.com (Vandana BN)
Date: Tue, 22 Oct 2019 13:21:39 +0530
Subject: [Linux-kernel-mentees] [PATCH 0/2] vivid: Support for touch device
Message-ID: <20191022075141.21069-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch adds support for touch devices in the vivid driver.
Current code provides a framework for touch support and passes
compliance tests.
TODO: Add touch emulation.

Thank you.
Regards,
Vandana.

Vandana BN (2):
  v4l2-core: fix touch support in v4l_g_fmt
  vivid: Add touch support

 drivers/media/platform/vivid/Makefile         |   3 +-
 drivers/media/platform/vivid/vivid-core.c     | 134 ++++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  18 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  11 +
 .../media/platform/vivid/vivid-kthread-cap.c  |   1 -
 .../platform/vivid/vivid-kthread-touch.c      | 211 ++++++++++++++++++
 .../platform/vivid/vivid-kthread-touch.h      |  13 ++
 .../media/platform/vivid/vivid-touch-cap.c    | 160 +++++++++++++
 .../media/platform/vivid/vivid-touch-cap.h    |  18 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  33 +--
 10 files changed, 578 insertions(+), 24 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.c
 create mode 100644 drivers/media/platform/vivid/vivid-kthread-touch.h
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-touch-cap.h

-- 
2.17.1
