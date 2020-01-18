Return-Path: <SRS0=GiD0=3H=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADCCFC33CB6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 04:25:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7962A24656
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 18 Jan 2020 04:25:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ta7ULbJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7962A24656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 448D02051D;
	Sat, 18 Jan 2020 04:25:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwONV+dKXSfI; Sat, 18 Jan 2020 04:25:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A7B8D20021;
	Sat, 18 Jan 2020 04:25:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89F4CC18DC;
	Sat, 18 Jan 2020 04:25:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B797BC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A115C20134
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:25:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F24y9VAufmvc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:25:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id E2F6520021
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Jan 2020 04:25:35 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so4062165pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 20:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHBJFZwYhK7Tmr8esHxqJUtoRn8WnZqTo+H+EnwYrJo=;
 b=Ta7ULbJ9wR6kMfZta5m7PrCEQqG28jhlvt1bjqZZFQJSYf4GxA71p6YbO45HBWUSgf
 MfbwElMbBtq5KSBmCdrgdcU2bAn5Ktkj1vv0Ic/RRKhl1A1hcbZnq9K4XHnlqR8usnHC
 SRtKpDxusODzswKsqwDzJajlJoZcSUPH3/eSXUj/FS+fHIWtJS5ATuwWad48pIq/ClvE
 FEss3YD02wwPEZ0Vw7fY66T88s2r6svVRxfZ9LTAhzOHC+Zf0U7dsjuv2a5VhwlMsjn2
 cy7gmeZAYdBcash7krqzGBtluNuTwaB3WM3Gq1P8Qovfm4KuDd3K/iGKwgmjzx+w32Wb
 yQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YHBJFZwYhK7Tmr8esHxqJUtoRn8WnZqTo+H+EnwYrJo=;
 b=GR6FmgXcFdNg7vgtBBz1HsOOzozfac8z217vobpkF1jO92EHw1ZGPYrxHwMP4JKhpZ
 AvHnzvsol8A21Sk5h9QZJ2jCi/Gu4F4gKFUCEZTgtE7XUtlhimr+B0TfnURn9sfaDPxQ
 QMRIdDuviz54Ed1QghkgPbBWACI98GLciqBIg5P70UTovX6plh52zZifk6kZIy7sxRgo
 1ZPsK9bP6V4DTwhM5K8lPlZqU5UMOsy89apjGwW0lI4foNWjSRvwBqqGRd6MepdbJ6v1
 jSToKEgoFfUwAAQ3KclslEEIOVKL1H4j6uKkoSlf5Q+wXDrTOHMV6cxXVupnkpigjSFE
 qZgg==
X-Gm-Message-State: APjAAAUf9HPQte8DNh2EgAogpVR1NAT7La15UXeftVdIqOH8IL8eBUbc
 9mB62Qwrk+ZXghVGuh7atjA=
X-Google-Smtp-Source: APXvYqzfq2rQlvfACHCOS+RwFwK6woYWos+WSMvOBXpfFgrS0GmGE6BLdwKkUxdrfeti3s13++vWpQ==
X-Received: by 2002:a17:90b:4398:: with SMTP id
 in24mr10196469pjb.29.1579321535509; 
 Fri, 17 Jan 2020 20:25:35 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.181])
 by smtp.googlemail.com with ESMTPSA id r37sm8995812pjb.7.2020.01.17.20.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 20:25:34 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Olof Johansson <olof@lixom.net>
Date: Sat, 18 Jan 2020 09:54:34 +0530
Message-Id: <20200118042433.4968-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, santosh.shilimkar@oracle.com,
 linux-kernel@vger.kernel.org, soc@kernel.org, arm@kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: soc: ti:
	knav_qmss_queue: Pass lockdep expression to RCU lists
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

inst->handles is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of knav_dev_lock.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Add macro for the corresponding lockdep expression.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Remove rcu_read_lock_held() from lockdep expression since it is
  implicitly checked for.

 drivers/soc/ti/knav_qmss_queue.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
index 1ccc9064e1eb..37f3db6c041c 100644
--- a/drivers/soc/ti/knav_qmss_queue.c
+++ b/drivers/soc/ti/knav_qmss_queue.c
@@ -25,6 +25,8 @@
 
 static struct knav_device *kdev;
 static DEFINE_MUTEX(knav_dev_lock);
+#define knav_dev_lock_held() \
+	lockdep_is_held(&knav_dev_lock)
 
 /* Queue manager register indices in DTS */
 #define KNAV_QUEUE_PEEK_REG_INDEX	0
@@ -52,8 +54,9 @@ static DEFINE_MUTEX(knav_dev_lock);
 #define knav_queue_idx_to_inst(kdev, idx)			\
 	(kdev->instances + (idx << kdev->inst_shift))
 
-#define for_each_handle_rcu(qh, inst)			\
-	list_for_each_entry_rcu(qh, &inst->handles, list)
+#define for_each_handle_rcu(qh, inst)				\
+	list_for_each_entry_rcu(qh, &inst->handles, list,	\
+				knav_dev_lock_held())
 
 #define for_each_instance(idx, inst, kdev)		\
 	for (idx = 0, inst = kdev->instances;		\
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
