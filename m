Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3DB40FDAC
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Jun 2026 13:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824892; cv=none; b=RFvXGtMtGuPJ+PqanI1akJG5QHcPPoFR9IH3lkW5zvnpEDOz4HXrw/fsrNOvk3BNNfXGv/ISwlt9OoNBlxsRqKfJSFVBTgNJkgmrxVLhm9cCAlJp6VUslPMeLULKvzMaC7RVLoAK8qJHh0qisfysZGm1q9Dxhncx9xuGx8IGvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824892; c=relaxed/simple;
	bh=v90WNkUJaI76E3J1bgXlk2sMkqnYwKRFGAk2rrarAXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k9jwRZs2t6fvoHT/8W5uEfMtGuDWm8MIzNK3wMu5LFAicN8zdZ76KR9rAfruCDQf07cYi/kVWE8RPEMC9bbUMSQLjQVjFl2Auyhvn6gTuwNN6YQ54G6SWOr1ClhT4OKkT7qQT6ZaOkIw5F8lwOzd2710N+Xz3E3T+1lnUG+bhtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kRemJdsu; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kRemJdsu"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-847917c3678so229220b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 30 Jun 2026 06:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782824890; x=1783429690; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=kRemJdsu4ewxfb+0lt5gpBujQuh/F1BVKjW3Q0/U5Xv1/aABHf2x8mKEzNpT5+VcA/
         QgXEgH9VM5zyuRI9k/7rLIokyaijwt8mD9jGnvV2nSPOs/aBP8KIgdqAZ5uwg6Wt7xB6
         SwS5J43bweU4EN7xoUOPECKGJ24td6FIomy8/UNS7iBLTo6GWSjKjz0BGA1bGoQjul1J
         8gorD60R5/ZUC/MRettTCoM/vRiHmnqTmynqnVAgttPdBzpZRxTzi9CbpG3X/O0s5Or2
         7B7Y/iLFioCHL6jwI4W5ZRvhsHP7cXWkdvQQKZuV1pQteNswUTBc3lxWXTEdGCIBaOtg
         QGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782824890; x=1783429690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6j0F+xqCQECDY9wnaqI3d2SI54fqdn+nhFSDa4vOUo=;
        b=ASkUD8q/ADpPkSNv3qaQ5vyb/wCnPNxaHW0yLButg5Fr2N8/QpjOAURW+7fxWoMYs9
         m7ZJB9/6pdDwy9/+npj4zEBXLAMUYiK0uHcC869wgpPoUBa/AE9UoQzdE8HDDhDDHcIe
         wj1FJh7zZWwGMzafbH0nxuHzspxah/jBQL+zTFMdpcsbwyyaik5vftS0djpjMeWDpejB
         HiyMfUgxrg5qaoUKz7pxsvESaZPLbz+vTOBdDMHuvh4wQCEc+qct7hOuoL3rXU7CB9ue
         iVh0by4oqz0HhBLOF/6dQDJQEINk+rb5MO9I/0WUg5XbL2/rprMwAsnFFISHQ8VyY7P6
         GQLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpkNMQLJfiet/XObNDcA3CeP3ieWxJiA6XwRqqbF0YZpv7zxkhLX98B96KkBaPfao2YwsrBNRaxAxGIRlZf3Cwcpucmrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJ0lFqRExkx9cEr1Xy8G/iZ+Y13goyj6Uw0pB9utYPweevHw1A
	BJEhKOM9yCcRmS9luqEbIP0pYUO5SyP89FULFkK2WisxkHtFJtqsUKN5
X-Gm-Gg: AfdE7cm2KE0mjiYHhNh2PtA4TcTy7zaLI694kPwnNmXERUuZOpL23RZ2P6qNU80uMnf
	Nu9+VKsAnZzDPtIpuEH9JVCwS3O1oeTjg9E1R9VN/v8hAH5MEuqA9LRZF5JrR201kXkjretDkWf
	iPltvu3vW7tcF0pKI+W62XYhsgG4rjNNoh/NyAIv7p1/63zeYekxz7jdomrTpsJqAHCLAtOocL6
	gVuYMtLu59LFCaeW2ONHdVqMpP5Rwh+Vdsejtg5qGBEycIhmKPDYoKCRVjRoXsV3jxOLWqhcaFl
	B2v8d7MC7DFe7QpzNZ000pkXJWnvodlCZBcoObqXJPh3laIfhsxaHw+41tcfljH3By4orxZv/2i
	X0WieBGUDozCM9icI2jUHFeM0rC60lBYt03sh8NJV21qz/3QlgSyRNDuPopTPqo2X0ABWYf+9hN
	Skb55SGKjaldLm0eF/R9/qX6PLITMBVnv140txkw==
X-Received: by 2002:a05:6a00:85a3:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847a7ed202dmr1140309b3a.0.1782824889921;
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:1b46:470e:6375:45a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03a6fd5sm1991541b3a.57.2026.06.30.06.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:08:09 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: tomi.valkeinen@ideasonboard.com,
	kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH] media: raspberrypi: rp1-cfe: acquire state_lock in cfe_start_streaming()
Date: Tue, 30 Jun 2026 20:07:56 +0700
Message-ID: <20260630130756.28744-1-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cfe_start_streaming() modifies shared device state without holding
state_lock. The driver exposes multiple video nodes backed by
a single cfe_device. While one node runs cfe_start_streaming(),
another node's cfe_buffer_queue() may read the node state via
test_all_nodes() under state_lock to decide whether to schedule a job.
Another case is when node->fs_count is read by the interrupt handler
in cfe_sof_isr().  Modifying this state without state_lock races
against those readers.

The counterpart cfe_stop_streaming() already takes state_lock around its
state modification. Fix cfe_start_streaming() to do the same.

Found by code inspection.

Fixes: 6edb685abb2a ("media: raspberrypi: Add support for RP1-CFE")
Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 drivers/media/platform/raspberrypi/rp1-cfe/cfe.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
index 8375ed3e9..d8ea71830 100644
--- a/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
+++ b/drivers/media/platform/raspberrypi/rp1-cfe/cfe.c
@@ -1151,6 +1151,7 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 	struct v4l2_subdev_state *state;
 	struct v4l2_subdev_route *route;
 	s64 link_freq;
+	unsigned long flags;
 	int ret;
 
 	cfe_dbg(cfe, "%s: [%s]\n", __func__, node_desc[node->id].name);
@@ -1184,9 +1185,11 @@ static int cfe_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	state = v4l2_subdev_lock_and_get_active_state(&cfe->csi2.sd);
 
+	spin_lock_irqsave(&cfe->state_lock, flags);
 	clear_state(cfe, FS_INT | FE_INT, node->id);
 	set_state(cfe, NODE_STREAMING, node->id);
 	node->fs_count = 0;
+	spin_unlock_irqrestore(&cfe->state_lock, flags);
 
 	ret = cfe_start_channel(node);
 	if (ret)

base-commit: 06cb687a5132fcffe624c0070576ab852ac6b568
prerequisite-patch-id: 4c010e20cdeb611d14546bc729b513f959e25afd
-- 
2.53.0

