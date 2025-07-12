Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A427FB02
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752330492; cv=none; b=YGyqOcjZFGUCPS6rt2z+YW4xnRnU3tytTtLrn+Ypba+CTNPFuha10+zK+vFTCwJOv6S7DnSErbphqJaILzH7bNJR2y+dtWsUVoKvvd8pyPU3LTKnPmwOPBm/gwnMzoWa1gWV6/FaSNhOu/OHJSiguJh264/Ch/HWBj/oCGwudUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752330492; c=relaxed/simple;
	bh=mfJj0mxIXjnqzDfwlQsTgEOe1NZBpZ9DDzkiqanQElI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXvM3oqIh8ALymar83m8XBreFbijEq8MqK0wCtWdB2cVanf0pbxAghjyKtIYloc6LyT/5co+rDdgYunXEEXX4hZtRAiBoq9fQp0BzelAaCTNnWnDEfnAM0WJjEaijqV4T+TEQeTjQeYj7aejmv9GZTY8PEJa1rzdBImj8N37HQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAFUZOiW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAFUZOiW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a582e09144so1961261f8f.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 12 Jul 2025 07:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752330489; x=1752935289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vKO+RdbPOJHVDRjTSXIDaC42JXuaUA/QuGjWq2fHQQ0=;
        b=PAFUZOiWT9fuECfF7OHPUTuwGPnAphzroD8zwwBDHmiqgODenbnpn3tRaLmP6DNBdr
         VmTU9XzFMzjcfx0ve/jhaD/I60EiaqudCFfFcx1CWcGorDPLtQJyK38It43OKjP4VtD5
         1I87i5Hb4eh8m51SXdIp6LjKRjEP3vYVX76x2PeZdoBsxrEqJp4B7B7lfxABk65nd53x
         etF+9XRN7eYUwFyfi7AKjV/OoUlc1Rz+6Gp2Q7Le7Bt+ZwDgfpX3XOLheZ3RYSlx8EP1
         LdLB7HcgJ/ihyTxS6uR7cr8IIDMHYUn6w4XDn0i5CtQ1PA52oHPeOTCsdcQQs4s+cxaB
         Orhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752330489; x=1752935289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vKO+RdbPOJHVDRjTSXIDaC42JXuaUA/QuGjWq2fHQQ0=;
        b=NNAz8kiXlHLeAEDFXo5ehMts10uUuYmWuLfYOHP9JC//lQJmIULDj8VZVociS3vLt8
         ONjjF5R8my9fpSj64uQi37WhwGx4PgRhktecDke2qzp3KiVu91ELPTpl2Rw6CtENW5g9
         3rDY7Mr+cHLvOxax5CcHjur+pucAOJF3OOOX3Tqtf+bv1xXMN2isgrwHVCdmQ8mett0/
         ig5aeLOt4wMecJfU1xb/jeyZndun+ScVr9b7rnc5p4cHTcwAJpSnq+q+RcHIPIHfhNmB
         BKjIkCtOq7SFGaHSGdaqPG9HdAq8leMGw37z8mEPsFTDFCWdjf7Ibis3Xvaoh4KJU0cx
         1UHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSkkUO/KK4HlDS2iD4DyZf7XOb/Fo0MF99vJiFD4+F1OBpjm88H37rubpBw6QlkkoApGifdsoDV4jnQYdFpWsFNOBRQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJ1SCzv08KH7ux0yPfbw4AoiE3dJxqZYCPX0KbuAX4oZ1m47fE
	5HAgleW5CtOaJ57fwa8cEs6cCquJqPS83ZxLSLIAxOd0nDjVe9BvfA/8
X-Gm-Gg: ASbGnctLNZCFI9sSKosSSqfXFMpkSbUVlGuQMGhxMMLESCclC40gAu3SGfWNIicDYaN
	hPNNzC9JzMRw57NrttDNgmstoKFnGz/++mtOzEZgdRD6DlYRlnU504koPgQSPcomzwj1xvcUnHo
	jp5c8RAZzwy7SqAE5FhIbKCNXuI1ExEIauRzDCjYgejzjA3DOlyyLM69a58K30Pb2s4tLn4up7x
	v85WmrMMHiNziGc/f1QMiZwo6XJp7UueoU/+DWXwU26dTEv3IZkr9mUFvx/PNF3Uckk3H39WnfK
	gQV630Z+qGcWOc2rtXsZbcSi8HRMQtCAICpzyfjuw43H5tgm2+9XDIIwbweufHQShADsrKgck0R
	z68mjz/Pl0fJdmiR5lEPVBm/BofvrAM2B1jOo/5HZO+/nJlI=
X-Google-Smtp-Source: AGHT+IHxg/G8bJsXW2Lq+V/p8vKXWydJIxg0pHkVofJfHd8FkPrdkd7tp9DGRP70quCAzNfuK6z55g==
X-Received: by 2002:a05:6000:2c0e:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b5f2db159fmr5579245f8f.1.1752330488660;
        Sat, 12 Jul 2025 07:28:08 -0700 (PDT)
Received: from localhost.localdomain ([154.183.63.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cdb549absm105569565e9.1.2025.07.12.07.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 07:28:08 -0700 (PDT)
From: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
To: liyihang9@huawei.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com
Cc: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>,
	linux-kernel-mentees@lists.linux.dev,
	shuah@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scsi: hisi_sas: use sysfs_emit() in v3 hw show() functions
Date: Sat, 12 Jul 2025 17:28:03 +0300
Message-ID: <20250712142804.339241-1-khaledelnaggarlinux@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace scnprintf() with sysfs_emit() in several sysfs show()
callbacks in hisi_sas_v3_hw.c. This is recommended in
Documentation/filesystems/sysfs.rst for formatting values returned to
userspace.

Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
---
 drivers/scsi/hisi_sas/hisi_sas_v3_hw.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
index bc5d5356dd00..84bc02f7da27 100644
--- a/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
+++ b/drivers/scsi/hisi_sas/hisi_sas_v3_hw.c
@@ -2849,7 +2849,7 @@ static void wait_cmds_complete_timeout_v3_hw(struct hisi_hba *hisi_hba,
 static ssize_t intr_conv_v3_hw_show(struct device *dev,
 				    struct device_attribute *attr, char *buf)
 {
-	return scnprintf(buf, PAGE_SIZE, "%u\n", hisi_sas_intr_conv);
+	return sysfs_emit(buf, "%u\n", hisi_sas_intr_conv);
 }
 static DEVICE_ATTR_RO(intr_conv_v3_hw);
 
@@ -2881,8 +2881,7 @@ static ssize_t intr_coal_ticks_v3_hw_show(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct hisi_hba *hisi_hba = shost_priv(shost);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n",
-			 hisi_hba->intr_coal_ticks);
+	return sysfs_emit(buf, "%u\n", hisi_hba->intr_coal_ticks);
 }
 
 static ssize_t intr_coal_ticks_v3_hw_store(struct device *dev,
@@ -2920,8 +2919,7 @@ static ssize_t intr_coal_count_v3_hw_show(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct hisi_hba *hisi_hba = shost_priv(shost);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n",
-			 hisi_hba->intr_coal_count);
+	return sysfs_emit(buf, "%u\n", hisi_hba->intr_coal_count);
 }
 
 static ssize_t intr_coal_count_v3_hw_store(struct device *dev,
@@ -2959,8 +2957,7 @@ static ssize_t iopoll_q_cnt_v3_hw_show(struct device *dev,
 	struct Scsi_Host *shost = class_to_shost(dev);
 	struct hisi_hba *hisi_hba = shost_priv(shost);
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n",
-			 hisi_hba->iopoll_q_cnt);
+	return sysfs_emit(buf, "%u\n", hisi_hba->iopoll_q_cnt);
 }
 static DEVICE_ATTR_RO(iopoll_q_cnt_v3_hw);
 
-- 
2.47.2

