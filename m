From: bnvandana at gmail.com (Vandana BN)
Date: Tue,  8 Oct 2019 12:57:54 +0530
Subject: [Linux-kernel-mentees] [PATCH v10 0/3] vivid: Metadata support
In-Reply-To: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
References: <96d53360-5520-f253-db8e-995bf5920746@xs4all.nl>
Message-ID: <20191008072757.22752-1-bnvandana@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

This patch adds metadata support in vivid driver.
Metadata capture supports UVCH format V4L2_META_FMT_UVC as it is widely used in webcams.
https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-meta-uvc.html
For Metadata output a new format V4L2_META_FMT_VIVID is added,
which is used to set brightness, contrast, sturation and hue.

Regards,
Vandana.

Vandana BN (3):
  vivid: Add metadata capture support
  v4l2-core: Add new metadata format
  vivid: Add metadata output support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     | 197 ++++++++++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  24 +++
 drivers/media/platform/vivid/vivid-ctrls.c    |  75 +++++++
 .../media/platform/vivid/vivid-kthread-cap.c  |  54 ++++-
 .../media/platform/vivid/vivid-kthread-out.c  |  50 ++++-
 drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
 drivers/media/platform/vivid/vivid-meta-out.c | 174 +++++++++++++++
 drivers/media/platform/vivid/vivid-meta-out.h |  25 +++
 drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
 drivers/media/platform/vivid/vivid-vid-out.c  |   5 +-
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 14 files changed, 825 insertions(+), 18 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-out.h

-- 
2.17.1
