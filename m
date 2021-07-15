Return-Path: <SRS0=ZtpW=MH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE1C47E4B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 10:34:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3E760041
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 15 Jul 2021 10:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3E760041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CA4583DA8;
	Thu, 15 Jul 2021 10:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S8RZGj9VsEws; Thu, 15 Jul 2021 10:34:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D12A783DA4;
	Thu, 15 Jul 2021 10:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8E75C0010;
	Thu, 15 Jul 2021 10:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B52C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 10:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AB5B60B3F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 10:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZOGLScJD8pfG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 10:34:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 94F8F60B28
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 10:34:32 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 p14-20020a17090ad30eb02901731c776526so5882003pju.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Jul 2021 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oSd5AIwHXyRxmbXI7YN1Do3jrBN/ZwcUGcPjvgZeFk=;
 b=AFHnbrvTfgXatGFDpeKuSk4yYxFCvxAArkKWMB2xhrzPriZ/ItDVwlf7rzN6cGdXKS
 aMvgfdXg19XYmqFFhWHPqLHctEIDlFvgNxMAItXD8hJQNgnZMOHUiIcbjEzMmp9/+7Fy
 xWD8qhbnLO+NFEyMxNiPj2PuX2wtqXQTTcmSx18tbeTcKkZBj8DJ9ZWe0DbhX/xavYan
 LeBhysNvsvj3U/jrYtUvwi0Zj2D/vMWyI7hdstrBLS5uTMeYaOGNOUDM1EMRAtASVbgP
 WvLSIXnwdZoHmrVNYWqAyk1bWRwcXU1XHdxAQO4Q8FhtLU52cdQL3c1z1Rt431Wg+a+L
 ux2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+oSd5AIwHXyRxmbXI7YN1Do3jrBN/ZwcUGcPjvgZeFk=;
 b=NxYYm3DhJ9kglNhgvv+80D9hbPQvXi4+zm9TNIvpziezBYDsuD1UZlo0Df/0ZoxgqA
 ihQDGMgkZThh7/uhBoWc1gAr1GBhffrVzBFR8TH9Fm0Hx+cPjI43nWrZSDAY6qV5pa2c
 +Scui2eBhsClykUGWhceQY8ZHmh+hrEJO0UPSq1tK4CH5IeRmhSaoqeZHAEa/xRQ17EM
 FPwml1ECXkiZ2hHiqBT6oyCU4E26BVI6XhxASwOqBcTxytJjpOkH033g7URVt8DyquQL
 t6LaCMWwqbKO/bAskKckj9rMCuK5AuGdiegjV2B1NAHLclfMjq8ZDkd1Pm/7GKQtzDRh
 AkTg==
X-Gm-Message-State: AOAM533RK5SVTY7HrdRY5pyljEwOMyDkX3FoE1od6fWCExT4+E7SEbeO
 9+Z6vAlCy3O7LM9t/a4SC2U=
X-Google-Smtp-Source: ABdhPJzsgVuM1EhE0Bt1tm9UkzYH3XoF5+771CCc0YfNyBorSFfKh1zma+esEJdf3zhFYWz2Y4Kgpw==
X-Received: by 2002:a17:90a:8e82:: with SMTP id
 f2mr9659205pjo.177.1626345272037; 
 Thu, 15 Jul 2021 03:34:32 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id e18sm6059326pfc.85.2021.07.15.03.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 03:34:31 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com
Subject: [PATCH] btrfs: fix rw device counting in __btrfs_free_extra_devids
Date: Thu, 15 Jul 2021 18:34:03 +0800
Message-Id: <20210715103403.176695-1-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, anand.jain@oracle.com,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-btrfs@vger.kernel.org
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

Syzbot reports a warning in close_fs_devices that happens because
fs_devices->rw_devices is not 0 after calling btrfs_close_one_device
on each device.

This happens when a writeable device is removed in
__btrfs_free_extra_devids, but the rw device count is not decremented
accordingly. So when close_fs_devices is called, the removed device is
still counted and we get an off by 1 error.

Here is one call trace that was observed:
  btrfs_mount_root():
    btrfs_scan_one_device():
      device_list_add();   <---------------- device added
    btrfs_open_devices():
      open_fs_devices():
        btrfs_open_one_device();   <-------- rw device count ++
    btrfs_fill_super():
      open_ctree():
        btrfs_free_extra_devids():
	  __btrfs_free_extra_devids();  <--- device removed
	  fail_tree_roots:
	    btrfs_close_devices():
	      close_fs_devices();   <------- rw device count off by 1

Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
Reported-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
Tested-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 fs/btrfs/volumes.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/btrfs/volumes.c b/fs/btrfs/volumes.c
index 807502cd6510..916c25371658 100644
--- a/fs/btrfs/volumes.c
+++ b/fs/btrfs/volumes.c
@@ -1078,6 +1078,7 @@ static void __btrfs_free_extra_devids(struct btrfs_fs_devices *fs_devices,
 		if (test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state)) {
 			list_del_init(&device->dev_alloc_list);
 			clear_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state);
+			fs_devices->rw_devices--;
 		}
 		list_del_init(&device->dev_list);
 		fs_devices->num_devices--;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
