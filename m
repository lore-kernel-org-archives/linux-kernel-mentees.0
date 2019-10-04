From: bnvandana@gmail.com (Vandana BN)
Date: Fri,  4 Oct 2019 17:38:35 +0530
Subject: [Linux-kernel-mentees] [PATCH v3 0/2] vivid: Metadata output support
In-Reply-To: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
References: <787ff1cb-dde3-800a-9dde-68f1db5e4897@xs4all.nl>
Message-ID: <20191004120837.31614-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20191004120835.YRaYyYatoFJxjjuytMnZs_xBTun0qK2XF6rkXfxyats@z>

This patch adds metadata output support in vivid driver.
New metadata format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.
V2 has changes in metadata output structure and metadata format define.
V3 addresses review comments.

Regards,
Vandana.

Vandana BN (2):
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     |  98 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  10 +
 drivers/media/platform/vivid/vivid-ctrls.c    |  12 +-
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-out.c | 174 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 10 files changed, 367 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1
