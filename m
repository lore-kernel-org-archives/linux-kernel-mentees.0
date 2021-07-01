Return-Path: <SRS0=5SPK=LZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0F12C11F64
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 368486108C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Jul 2021 03:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 368486108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D89E041612;
	Thu,  1 Jul 2021 03:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6Wo5gM2LMZ8; Thu,  1 Jul 2021 03:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D3D3940669;
	Thu,  1 Jul 2021 03:08:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABF6EC001A;
	Thu,  1 Jul 2021 03:08:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3DE7C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C64E41612
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0mYaYQdGlxVw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CD8E40669
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Jul 2021 03:08:25 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b5so2856728plg.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 20:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dC2tDQKb0XkHAVvgr1NTYrtv5/+PY16weB+Ng/scnVw=;
 b=HZ8eWzaGzEC5xyge8WQAPfBbE8YLqNbU8hXsDuHwYOyo+QiLk1EWJHvP3PG9j+UC5Y
 s8SoU2IEoewFrV+gdUCnIcQ26vO/kA9tIVj/0e+151uurqW2FNrUkKlB2pWOyLlN25p2
 wWkY8jFVMWREbSD/hgrylDIs/kno0Q4z2W7Yvs4T5D2dEQnXsBOqBVwhgkf/lqFI2RIj
 Hq42PByuM/K1GToODNlaXxjT8Ey+4o86x1QUT1EzF4wXVZl/ljWbkYrZhqEgF7XJKm/E
 r4b6v300ZJxUsMnyIZ38cc808AZqL89n+21PHnR0dbirU4ZeEeEnZhKnqebe/soEjoCW
 f+ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dC2tDQKb0XkHAVvgr1NTYrtv5/+PY16weB+Ng/scnVw=;
 b=EjWjOFXZFE796+gVNzYDMEzn9cy1P0z/SV1a2qtcovmAcCUSG3hMJoTIq21n+uos+k
 Jtu9J6WjaZqDOH2sSUOT98uWs2NMVqyiYVkfSSAmh0OsbhCOHrTgEdzHMleELgfnYxI0
 D2Iu9h8ReehvdsqmDDkMRmAfsBqREnCFNUrTc8Ezb//VUQSb7cPfc0BRdcqZtHq93w4O
 CnfZquzwL/rN2Vr25b0aR/e69HZPDtwOd1Jw6Y0FD5X8lVIBJpSWhbJM/OqNmVXxgSlB
 14jR1tvSNEfOK/CAxn9hkKzYUC+9dQBXkUIkqjWuVvpdi9t9SxHOGb4e960k7o2MkvxW
 +sHw==
X-Gm-Message-State: AOAM533bCjUxrD+XBMgfrn6g/UF+lCK/MMAXeuSAQbo+ae9//MZJOZQx
 tktGAqXF0HpS/Je2swqG4fI=
X-Google-Smtp-Source: ABdhPJy4YYFXgECHmGNmhLJ/wD9ZBzYDQelLtBdBYJIjzp/yVE6wiqvZxqz3mCwwYl+eN4aMrAew3w==
X-Received: by 2002:a17:90b:3655:: with SMTP id
 nh21mr7713862pjb.105.1625108904489; 
 Wed, 30 Jun 2021 20:08:24 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id g10sm4568568pjv.46.2021.06.30.20.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 20:08:23 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gustavoars@kernel.org,
	viro@zeniv.linux.org.uk
Subject: [PATCH v2 0/3] hfs: fix various errors
Date: Thu,  1 Jul 2021 11:07:53 +0800
Message-Id: <20210701030756.58760-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, slava@dubeyko.com,
 linux-fsdevel@vger.kernel.org,
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

Hi,

This series ultimately aims to address a lockdep warning in hfs_find_init reported by Syzbot:
https://syzkaller.appspot.com/bug?id=f007ef1d7a31a469e3be7aeb0fde0769b18585db

The work done for this led to the discovery of another bug, and the Syzkaller repro test also reveals an invalid memory access error after clearing the lockdep warning. Hence, this series is broken up into three patches:

1. Add a missing call to hfs_find_exit for an error path in hfs_fill_super

2. Fix memory mapping in hfs_bnode_read by fixing calls to kmap

3. Add lock nesting notation to tell lockdep that the observed locking hierarchy is safe

v1 -> v2:
Patch 1: Consolidated calls to hfs_find_exit on error paths in hfs_fill_super, as suggested by Viacheslav Dubeyko.
Patch 2: Added safety checks, clarified code, and switched from kmap/kunmap to kmap_atomic/kunmap_atomic, as suggested by Viacheslav Dubeyko.

Desmond Cheong Zhi Xi (3):
  hfs: add missing clean-up in hfs_fill_super
  hfs: fix high memory mapping in hfs_bnode_read
  hfs: add lock nesting notation to hfs_find_init

 fs/hfs/bfind.c | 14 +++++++++++++-
 fs/hfs/bnode.c | 25 ++++++++++++++++++++-----
 fs/hfs/btree.h |  7 +++++++
 fs/hfs/super.c | 10 +++++-----
 4 files changed, 45 insertions(+), 11 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
