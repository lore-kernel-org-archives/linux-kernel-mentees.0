Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E6DCC43214
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 07:13:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB599611AD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 07:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB599611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E0F8380E;
	Tue, 27 Jul 2021 07:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I69_zVlK7eUL; Tue, 27 Jul 2021 07:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DC8398381F;
	Tue, 27 Jul 2021 07:13:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B13E0C001A;
	Tue, 27 Jul 2021 07:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 609F4C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 07:13:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48E5E400F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 07:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U7pbmAggcsIz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 07:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AC98F400A8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 07:13:51 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 m2-20020a17090a71c2b0290175cf22899cso3617774pjs.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 00:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrrJwiLbM3Ga7nei1tG5qM9T+06r1hAsagdwYPL060k=;
 b=jvQXoar1Xahk3e8uQeeVl7OK02Fswvs4y1JvdgZ93YspKNaORNAnz+zgOWG2cB27/l
 XUovgz8r6G61X12/X1fT4lvlSGwN0BUagN8S1DtK9Q76X8Py/TNvP1MEdsjFKCUZXJln
 TKaHMdW6/76wQTTf/PJ3AGhd0b6WKbdZ/wmggHvm9j05Yq+EWJK7eeQFDX/W/19teX81
 fq960S63dOv6FG0h1l9Sb29/EJcwVug7EU5bcnXqxyTHn5cvgbnEh3l3/4c4gF6s390p
 xq/HSpn0UI55a+VShKD77A8bBvJwJ0dTTgHap//Kj3mRE/ToQGWOrB2hX9zv3Gqi1Pc7
 X/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KrrJwiLbM3Ga7nei1tG5qM9T+06r1hAsagdwYPL060k=;
 b=qA4KGUhbWhGt2EtFr29Nx0JuU8/pLR9OltK81grzCuIn9Wc4nlTeqA3STuRgssRdby
 szEuyPY95tLdm5Vq+fp8rIBl7z1QrM7AHPMwY5mSxf4qvmnQuDrS2ve8pqFZYAFdu8Zj
 tcNUFdgqTKlhf/EqzOD7ZdvmFXAjm4yx87rL5AsFzJLygzueM0JutJOFu0QkcOJjB9cb
 FJBbfmUlEkpZfFKacUMjFgnt2GamumhQfkSdrqzCI/Y+CW4U7D8+c+NQwOIH3AkjUT0e
 v8O+pmlr0MQB0tRTdGkSwl4qCly3QOe6KukrYaygJZdUXmRskQnTcnlMCckf5OrZZ4Hn
 9GeQ==
X-Gm-Message-State: AOAM530AmQy20pKSjqjvTk2fPFr3PvMR7TM612HK3B38rb7dbxS6pBrj
 TpuQcWHK9V1ScE6MV4XJDAA=
X-Google-Smtp-Source: ABdhPJxl/oFTVpBPLS9lHnjiYkPouAfBbgeyg9umctBTQA7m/uCelnOcXkz6H/S0DedIwEb3jc3HJw==
X-Received: by 2002:a05:6a00:a8a:b029:30c:a10b:3e3f with SMTP id
 b10-20020a056a000a8ab029030ca10b3e3fmr21536386pfl.40.1627370030492; 
 Tue, 27 Jul 2021 00:13:50 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v9sm2361542pfn.22.2021.07.27.00.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 00:13:49 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com
Subject: [PATCH v2] btrfs: fix rw device counting in __btrfs_free_extra_devids
Date: Tue, 27 Jul 2021 15:13:03 +0800
Message-Id: <20210727071303.113876-1-desmondcheongzx@gmail.com>
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

When removing a writeable device in __btrfs_free_extra_devids, the rw
device count should be decremented.

This error was caught by Syzbot which reported a warning in
close_fs_devices because fs_devices->rw_devices was not 0 after
closing all devices. Here is the call trace that was observed:

  btrfs_mount_root():
    btrfs_scan_one_device():
      device_list_add();   <---------------- device added
    btrfs_open_devices():
      open_fs_devices():
        btrfs_open_one_device();   <-------- writable device opened,
	                                     rw device count ++
    btrfs_fill_super():
      open_ctree():
        btrfs_free_extra_devids():
	  __btrfs_free_extra_devids();  <--- writable device removed,
	                              rw device count not decremented
	  fail_tree_roots:
	    btrfs_close_devices():
	      close_fs_devices();   <------- rw device count off by 1

As a note, prior to commit cf89af146b7e ("btrfs: dev-replace: fail
mount if we don't have replace item with target device"), rw_devices
was decremented on removing a writable device in
__btrfs_free_extra_devids only if the BTRFS_DEV_STATE_REPLACE_TGT bit
was not set for the device. However, this check does not need to be
reinstated as it is now redundant and incorrect.

In __btrfs_free_extra_devids, we skip removing the device if it is the
target for replacement. This is done by checking whether device->devid
== BTRFS_DEV_REPLACE_DEVID. Since BTRFS_DEV_STATE_REPLACE_TGT is set
only on the device with devid BTRFS_DEV_REPLACE_DEVID, no devices
should have the BTRFS_DEV_STATE_REPLACE_TGT bit set after the check,
and so it's redundant to test for that bit.

Additionally, following commit 82372bc816d7 ("Btrfs: make
the logic of source device removing more clear"), rw_devices is
incremented whenever a writeable device is added to the alloc
list (including the target device in btrfs_dev_replace_finishing), so
all removals of writable devices from the alloc list should also be
accompanied by a decrement to rw_devices.

Fixes: cf89af146b7e ("btrfs: dev-replace: fail mount if we don't have replace item with target device")
Reported-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
Tested-by: syzbot+a70e2ad0879f160b9217@syzkaller.appspotmail.com
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Reviewed-by: Anand Jain <anand.jain@oracle.com>
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
