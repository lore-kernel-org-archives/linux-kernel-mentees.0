Return-Path: <SRS0=efVN=3A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FD5C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jan 2020 07:39:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E54312072E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 11 Jan 2020 07:39:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BRq3uXnf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E54312072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AF7FE86BEF;
	Sat, 11 Jan 2020 07:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n7vqTbaq9hPV; Sat, 11 Jan 2020 07:39:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4C20786BEC;
	Sat, 11 Jan 2020 07:39:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 369A6C1D80;
	Sat, 11 Jan 2020 07:39:56 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8BDFC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jan 2020 07:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E034886BED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jan 2020 07:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INHzSVqkwbwd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jan 2020 07:39:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5D1EA86BEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 11 Jan 2020 07:39:55 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id s21so1752027plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sj2E8hbf+1n1JQewsDgj2Fs29eg9VqanuSP3luTlahg=;
 b=BRq3uXnfOC/WIjl9+DbaxslikTOCbxvw6S5ZzMoh4VEfmtZlzzVlFRaHOrgci0WAyE
 DVwlYZ/G1nx8+Y+ZCNlj/3oY8GUL2ALOuiYPxwJEykRMfQAmi3LDX1vsEy4rYKWeMEP9
 9wXW7dXUK3CkxPh6L70MMH9ULPtXUIo6H6bJRU49x77fPNzY6G/H/HaQ7mpnd4yMgRWx
 Ujqwg0XQgfw02W2MFxuW8EePWRt5AhXTOIegnlKtxPP+w7QIupOKFWBngtU7XMb3cFRh
 uvPRzR9VOsY/PxEC8sZagAbNn4J2tlzh2kMr4GEPgrF8uMOjGqDoHStkZlIyY9XRsUmP
 uLRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sj2E8hbf+1n1JQewsDgj2Fs29eg9VqanuSP3luTlahg=;
 b=ppi6hJjX8v4k9Lj2PirfHqx0mITh/7jKjdVasnACUn5FUuB7iyfW1iJ6sDAKZZ5wgA
 6A9NJ+vKXaEXzsTVvU5FNzYaaGLzsnsNI7kk5SBqDAMHRvV8OCQN5ndwuw/PNR+ljWus
 darbKQzQE4t0QO998IM7kDG29EAqfjcQ/aKaYHmUuVap58o+/PbcNqPlOJG0URm5s3Kj
 PcUhTSH/Wr3qtIOuhy+NapUEX0JwnYN/NOnTm13PMG36zC63EgBQ9mXV7uEBHvX0LR+Y
 RAxjcYq28BCkAjbdTzap3LOmpDygmdsSaqVn9pV8MogX2G0s23AJidwZimAvn7fcAoFk
 MC6g==
X-Gm-Message-State: APjAAAW1mnNFCBVKwK8bBqMvzz1CNXBpblqa7ItcGCHz1LEuek7b2Zzm
 KNk0F751DHaes5Awy+TCxjM=
X-Google-Smtp-Source: APXvYqzQun+14sGBUPw6UTkEDD50gGQAL0YWb8/xCo0l7Y8qM6mXd12JR0SEd2bwgk3cOVE3zuf3UQ==
X-Received: by 2002:a17:902:61:: with SMTP id 88mr3257670pla.17.1578728394863; 
 Fri, 10 Jan 2020 23:39:54 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.13])
 by smtp.googlemail.com with ESMTPSA id z4sm5437450pfn.42.2020.01.10.23.39.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 23:39:54 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Date: Sat, 11 Jan 2020 13:08:16 +0530
Message-Id: <20200111073815.7659-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: kbuild test robot <lkp@intel.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] drivers: nvme: target: core: Pass
	lockdep expression to RCU lists
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

ctrl->subsys->namespaces and subsys->namespaces are traversed with
list_for_each_entry_rcu outside an RCU read-side critical section
but under the protection of ctrl->subsys->lock and subsys->lock
respectively.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Reported-by: kbuild test robot <lkp@intel.com>
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v3:
- Fix error reported by kbuild test robot

v2:
- Fix sparse error
  CHECK: Alignment should match open parenthesis
- Remove global macro and use local lockdep expressions

 drivers/nvme/target/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 28438b833c1b..35810a0a8d21 100644
--- a/drivers/nvme/target/core.c
+++ b/drivers/nvme/target/core.c
@@ -555,7 +555,8 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
 	} else {
 		struct nvmet_ns *old;
 
-		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link) {
+		list_for_each_entry_rcu(old, &subsys->namespaces, dev_link,
+					lockdep_is_held(&subsys->lock)) {
 			BUG_ON(ns->nsid == old->nsid);
 			if (ns->nsid < old->nsid)
 				break;
@@ -1172,7 +1173,8 @@ static void nvmet_setup_p2p_ns_map(struct nvmet_ctrl *ctrl,
 
 	ctrl->p2p_client = get_device(req->p2p_client);
 
-	list_for_each_entry_rcu(ns, &ctrl->subsys->namespaces, dev_link)
+	list_for_each_entry_rcu(ns, &ctrl->subsys->namespaces, dev_link,
+				lockdep_is_held(&ctrl->subsys->lock))
 		nvmet_p2pmem_ns_add_p2p(ctrl, ns);
 }
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
