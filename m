Return-Path: <SRS0=2FyS=LC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4291DC47082
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Jun 2021 11:06:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C731961073
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Jun 2021 11:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C731961073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8107A403FF;
	Tue,  8 Jun 2021 11:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q3JIs6PVxpPi; Tue,  8 Jun 2021 11:06:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25D6C402E6;
	Tue,  8 Jun 2021 11:06:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2B44C000B;
	Tue,  8 Jun 2021 11:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95057C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 11:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F1736070D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 11:06:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vXmzzNZud1-u
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 11:06:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53C2A606C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Jun 2021 11:06:44 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id c12so15464140pfl.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Jun 2021 04:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agz9CSylDXq5In5z8KQvrOkrG9eT9u+AOTvuu0ZY5Nc=;
 b=kGJnoao0/Q/HCganKG1fHKbr1Rvvy+ZswfjL1itdz2Fa3nj6p0fdUcUGr9zmUrRqh3
 i+EaiDMe2/M8vkPY13QjEDQDK04NGqhOr1bzlDllU0QlBDpYJaO4bE4DuYMY1sbkQLsy
 q61tkrjOHNH1WfEYj6pgQ4UrB8wObwr9PCvR8TZobNvIy2cZp0uJjDmHEyBLvdB74UZi
 4haMcQI5taiEdShso56uQeGBHkg1S4gjWzKzSDMQ0GCc8qF9J2JYuG5dBPnml6u8PUt9
 Ln6S5lxSWmgLYzvv/F2qKIfEsk5f8apHSuxrNTdXyih+OHNHW8vnJ9tiUHWJeJ6+j1cv
 7p+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=agz9CSylDXq5In5z8KQvrOkrG9eT9u+AOTvuu0ZY5Nc=;
 b=eQF4AcEFNRG4ObnF4ny6BF8+eqNg98zBZ86bx561uLuVxCmoyez87lNdnD5JyFtShN
 Dp86oijr5u6nyMkns1j8LLtERpCM81E4Ifh82/bgFok+mGoo1Fv/iUgvfWkSywwZenAI
 kLY4ujev+3LUoKNT6h/Bi64RJ8GJ6u8uFK7ElMllQnHVZO+1hk0SCq7R8oP3ovVOYzKp
 7Upriu1Mt2veaDV5tr4ZZxxZUkvpeoHa+STMbWCzIIKrdyHyaeanG/rzwZlGei+X/SCq
 YmjAerdCNr2qCb5uzrVOyyWovv5ZhSHFNaWzp/Mcnl37kgoks+yyNjvBgXd/7ggitctf
 NDMQ==
X-Gm-Message-State: AOAM531UUXWh1fGGdtSUbL8UIbXhDf2IMtvk9fWLPN9S9AcS70pVN4Q9
 TkBDYNgzbKWLUW1I9XQ+PYA=
X-Google-Smtp-Source: ABdhPJw+2vg8VRQZjpROEMosr54/72J0JLFObMsUY2RUtiQT6wgQDH+LwDd8IMe+yGnWjpe5wSHOag==
X-Received: by 2002:a63:954e:: with SMTP id t14mr22339484pgn.427.1623150403690; 
 Tue, 08 Jun 2021 04:06:43 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a9sm10264209pfo.69.2021.06.08.04.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 04:06:43 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Fix use-after-free read in drm_getunique()
Date: Tue,  8 Jun 2021 19:04:36 +0800
Message-Id: <20210608110436.239583-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

There is a time-of-check-to-time-of-use error in drm_getunique() due
to retrieving file_priv->master prior to locking the device's master
mutex.

An example can be seen in the crash report of the use-after-free error
found by Syzbot:
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

In the report, the master pointer was used after being freed. This is
because another process had acquired the device's master mutex in
drm_setmaster_ioctl(), then overwrote fpriv->master in
drm_new_set_master(). The old value of fpriv->master was subsequently
freed before the mutex was unlocked.

To fix this, we lock the device's master mutex before retrieving the
pointer from from fpriv->master. This patch passes the Syzbot
reproducer test.

Reported-by: syzbot+c3a706cec1ea99e1c693@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---

In this patch, I made the assumption that dev and file_priv->master->dev refer to the same struct drm_device*, and from my test runs this seemed to be the case. If this was a wrong assumption to make, please let me know.

 drivers/gpu/drm/drm_ioctl.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index d273d1a8603a..495a4767a443 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -118,17 +118,18 @@ int drm_getunique(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv)
 {
 	struct drm_unique *u = data;
-	struct drm_master *master = file_priv->master;
+	struct drm_master *master;
 
-	mutex_lock(&master->dev->master_mutex);
+	mutex_lock(&dev->master_mutex);
+	master = file_priv->master;
 	if (u->unique_len >= master->unique_len) {
 		if (copy_to_user(u->unique, master->unique, master->unique_len)) {
-			mutex_unlock(&master->dev->master_mutex);
+			mutex_unlock(&dev->master_mutex);
 			return -EFAULT;
 		}
 	}
 	u->unique_len = master->unique_len;
-	mutex_unlock(&master->dev->master_mutex);
+	mutex_unlock(&dev->master_mutex);
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
