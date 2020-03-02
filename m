Return-Path: <SRS0=MxuE=4T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D2C3F2D7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB39C2467B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Mar 2020 18:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+H+SNwy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB39C2467B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B96891FE32;
	Mon,  2 Mar 2020 18:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g+-c8TfhHniP; Mon,  2 Mar 2020 18:32:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C9B591FFFE;
	Mon,  2 Mar 2020 18:32:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8693C07FE;
	Mon,  2 Mar 2020 18:32:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D913C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0964486E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5SWynPc-FUM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 22D0686B6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Mar 2020 18:32:21 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id dw13so151531pjb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Mar 2020 10:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XOGS7l9HvCLkL/Ca6VaW0Z7YxhyZD65Hc+/iXSNMm1w=;
 b=D+H+SNwyOb1uwWqOXYfe7Vtlqu2lIMmc7cX4+rAUVwDV7J1QBn6WGg3Cp4LqKykkpo
 MrS0MNDfk8lf5p+n3aYjYGu+twinmiJ4dcW8ZRmXF9TEmvPn5/q9Xu4fWUGS8c4SY5Yt
 CQMGYGSnQ9bdB7fEaioP055eJjQNLPpgryEN9QdeC0li+Riwm3VpzxHZe255zBo3PVrS
 uVAj3XiYUi3cdkt9ZVAgh8XkjL5BkwEWTlbuys3om9ppynclGKObWCCVpRoIrwvelEn5
 V9qkX1hH5WCSSiWN4Udt77Z5/a7VLvXGx4rmmBg3G8zWKzdccT6iyoMRlU89aW63ahJx
 u5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XOGS7l9HvCLkL/Ca6VaW0Z7YxhyZD65Hc+/iXSNMm1w=;
 b=MmRKuVgqaSztbex9k/wa6VTPgi31B+2jZTXnXS7FY1pfMMim/70EGFTWFgLbp0xCyC
 WmYkrz+Hk45C69Lfl1lOKmnouwOSJDtdTmuLRN0+T3r9Y0uCaY7wEwbqzGGq0v5KevEL
 Dh4+kHY2qtQIWJOGRqqZbOSMDqAtrLxBwd1a5IKPNu0abae527ZLuZHvfd0CedFGVRz4
 ki2Uu1q/Jgf5d5cTeMd6nV29YsnPtJ1Y6PS9nBeTXo4ZsmqA1Fobuddic8WSFZn1PER/
 c6dstlm2ZCU93RVq8i9UP3HDWcF63orGn19D915+WrVRPMI0HHgwpu4JdWJb9DwplFee
 iuUQ==
X-Gm-Message-State: ANhLgQ0sWgj/ZUagfIw/XZQ4AB4wn3KI8StpaL3T42kJvmuJwXaxhOV3
 Lwm6j1O8ggL8hy5lkulh61o=
X-Google-Smtp-Source: ADFU+vvCJhg7ByUBJicumo+sQEK+AtxZa+87yFru/+XH2ceA0BHAgSoyhCDHgrpxzoCh9u2hzFwSgA==
X-Received: by 2002:a17:90a:fa93:: with SMTP id
 cu19mr254565pjb.166.1583173940626; 
 Mon, 02 Mar 2020 10:32:20 -0800 (PST)
Received: from localhost.localdomain ([2405:204:800a:15c3:b0b0:78ba:d728:349e])
 by smtp.gmail.com with ESMTPSA id r145sm22508484pfr.5.2020.03.02.10.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 10:32:19 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: corbet@lwn.net
Date: Tue,  3 Mar 2020 00:01:05 +0530
Message-Id: <20200302183105.27628-3-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200302183105.27628-1-pragat.pandya@gmail.com>
References: <20200302104501.0f9987bb@lwn.net>
 <20200302183105.27628-1-pragat.pandya@gmail.com>
Cc: Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 2/2] Documentation: Add
	io_ordering.rst to driver-api manual
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add io_ordering.rst under Documentation/driver-api and reference it from
Sphinx TOC Tree present in Documentation/driver-api/index.rst

Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
---
 Documentation/driver-api/index.rst       |  1 +
 Documentation/driver-api/io_ordering.rst | 51 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/driver-api/io_ordering.rst

diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index e9da95004632..9335412e3832 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -80,6 +80,7 @@ available subsections can be seen below.
    isa
    isapnp
    io-mapping
+   io_ordering
    generic-counter
    lightnvm-pblk
    memory-devices/index
diff --git a/Documentation/driver-api/io_ordering.rst b/Documentation/driver-api/io_ordering.rst
new file mode 100644
index 000000000000..2ab303ce9a0d
--- /dev/null
+++ b/Documentation/driver-api/io_ordering.rst
@@ -0,0 +1,51 @@
+==============================================
+Ordering I/O writes to memory-mapped addresses
+==============================================
+
+On some platforms, so-called memory-mapped I/O is weakly ordered.  On such
+platforms, driver writers are responsible for ensuring that I/O writes to
+memory-mapped addresses on their device arrive in the order intended.  This is
+typically done by reading a 'safe' device or bridge register, causing the I/O
+chipset to flush pending writes to the device before any reads are posted.  A
+driver would usually use this technique immediately prior to the exit of a
+critical section of code protected by spinlocks.  This would ensure that
+subsequent writes to I/O space arrived only after all prior writes (much like a
+memory barrier op, mb(), only with respect to I/O).
+
+A more concrete example from a hypothetical device driver::
+
+		...
+	CPU A:  spin_lock_irqsave(&dev_lock, flags)
+	CPU A:  val = readl(my_status);
+	CPU A:  ...
+	CPU A:  writel(newval, ring_ptr);
+	CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+	CPU B:  spin_lock_irqsave(&dev_lock, flags)
+	CPU B:  val = readl(my_status);
+	CPU B:  ...
+	CPU B:  writel(newval2, ring_ptr);
+	CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+
+In the case above, the device may receive newval2 before it receives newval,
+which could cause problems.  Fixing it is easy enough though::
+
+		...
+	CPU A:  spin_lock_irqsave(&dev_lock, flags)
+	CPU A:  val = readl(my_status);
+	CPU A:  ...
+	CPU A:  writel(newval, ring_ptr);
+	CPU A:  (void)readl(safe_register); /* maybe a config register? */
+	CPU A:  spin_unlock_irqrestore(&dev_lock, flags)
+		...
+	CPU B:  spin_lock_irqsave(&dev_lock, flags)
+	CPU B:  val = readl(my_status);
+	CPU B:  ...
+	CPU B:  writel(newval2, ring_ptr);
+	CPU B:  (void)readl(safe_register); /* maybe a config register? */
+	CPU B:  spin_unlock_irqrestore(&dev_lock, flags)
+
+Here, the reads from safe_register will cause the I/O chipset to flush any
+pending writes before actually posting the read to the chipset, preventing
+possible data corruption.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
