Return-Path: <SRS0=6pMY=LJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA4F8C48BE6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:37:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4257461166
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Jun 2021 02:37:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4257461166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AAFF6081A;
	Tue, 15 Jun 2021 02:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpbhXYEHqttf; Tue, 15 Jun 2021 02:37:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 3D34F607B9;
	Tue, 15 Jun 2021 02:37:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DE99C000E;
	Tue, 15 Jun 2021 02:37:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A5191C000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A94D4053B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:37:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxhE8GZL5e1M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:37:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9B35D40525
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Jun 2021 02:37:31 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e20so10265058pgg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Jun 2021 19:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZngOmx3QZGSGE9q4/ABb06fw8+v1CSMYNte3U/V958=;
 b=j8BK1QDugcRXfg29Tqm6PhfSwlMgaC9EAqEaNluYMNCwd1ZYqElpq+kpbUktZ/urN4
 MVFmsPENeAISNrJygUJCEH0UF3af93a34tumnmJViTDG/YGE/wodIWkh6IlvmCndB6+C
 dhDr528Ave7TwpBKkGjCQI5PK87kyPYmJvipI4DE38MSn+6feAKYNBkQV19h8yNjhNDr
 UYugo4buc+C0+WvrHfvDhza6lHEJ+JjmM2oqHjcwqmDbG1d19wnfbfgHbu/EGX3jc2Tu
 jTh8f5lXw1t0Dqjad76TQQ7B/0slKvtYlcdMqP/585LM2WdakYuYfAYdSziFLM0+kJIK
 /K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XZngOmx3QZGSGE9q4/ABb06fw8+v1CSMYNte3U/V958=;
 b=YRDYqNuQbvafPjwTPTlHUtWOl7vZaeK8rGMJjh7CUuo6DPS1CernPyAUi/xnX3+WGU
 ejmg/OuWld2P8cRIRjvnCziXCckr3Y4XLDznZ539zv8ukE70XrCaiIhAqtbVZZUo1+Wl
 6dDafKdyxhonEE53m3nSIDt7FTmDbxI2gm6vRNp5uB7wPKSOh0xY1t22d8FG/Hjjgd4b
 0dQeGNzJwJHZNl0BcHj5060hhHVyAWBLGynAOTZkl94mr3nhwNDc01yLEOkn2tG85ai8
 dsEqTeV7FMIWyAtRGAStU/iuUBcYTOGhvDYh1H+diDl4U6Sr5NErMIR2exqMS/bpB6ZV
 86VA==
X-Gm-Message-State: AOAM533KyYUx0aPadB9a1jwxGnCGNuttCFs4a7yA2XJWCNJbhevtJ1Xq
 api13U/xZZ61rFbgg+UeZpg=
X-Google-Smtp-Source: ABdhPJwkiRcyYOeOqxFuMqJ+7O0OK1G86N3d9NPQLqADbQgmmfevSGkqOf0Dpo41Ig68e77DvD7ZZA==
X-Received: by 2002:a63:ce07:: with SMTP id y7mr3664904pgf.249.1623724650822; 
 Mon, 14 Jun 2021 19:37:30 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id b133sm14102623pfb.36.2021.06.14.19.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 19:37:30 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 0/2] drm: Address potential UAF bugs with drm_master ptrs
Date: Tue, 15 Jun 2021 10:36:43 +0800
Message-Id: <20210615023645.6535-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: emil.l.velikov@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
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

This patch series addresses potential use-after-free errors when dereferencing pointers to struct drm_master. These were identified after one such bug was caught by Syzbot in drm_getunique():
https://syzkaller.appspot.com/bug?id=148d2f1dfac64af52ffd27b661981a540724f803

The series is broken up into two patches:

1. Implement a locked version of drm_is_current_master() function that's used within drm_auth.c

2. Identify areas in drm_lease.c where pointers to struct drm_master are dereferenced, and ensure that the master pointers are protected by a mutex


Change in v2:
- Patch 2: Move the lock and assignment before the DRM_DEBUG_LEASE in drm_mode_get_lease_ioctl, as suggested by Emil Velikov

Desmond Cheong Zhi Xi (2):
  drm: Add a locked version of drm_is_current_master
  drm: Protect drm_master pointers in drm_lease.c

 drivers/gpu/drm/drm_auth.c  | 23 ++++++++++++---
 drivers/gpu/drm/drm_lease.c | 58 +++++++++++++++++++++++++++----------
 2 files changed, 62 insertions(+), 19 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
