Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2961C33CA3
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985AE2080D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0P6lIkO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 985AE2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 67D27884CF;
	Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g7npOUbEc1-Q; Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 10C55884CE;
	Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05EF9C1D7D;
	Fri, 10 Jan 2020 17:29:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 757FBC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7216C884CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgX3IO5DyKMF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:29:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2DE13884D0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:29:51 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id m13so1273983pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=if4RAkhreXdypvivvkzUzoNLQmdHtvLSynu8xvJL9L0=;
 b=P0P6lIkO0vEXevJyCi0Ve6nTaWGmPr9DQ9iU9vm86zyegmAuPFirXAbtYuTbzz3vkX
 IwYPqghnfSK4u10G0ECYGMKyJNdS7dH7F0qOWU1LKQiE9fdExxHqQ76dxjgxGrkSGBWD
 b5/sRrmV9CfAIEL7nUH2bj2hPGDnrM9VcBEwjPOyYzL6h49AmjZeWsuVinNCId28pAio
 sOAq8PD1HwwIvlTtUJG8cdfc3LQmrxFQKqn1t2TVKKnbqRrS+I8Zy5+rld+yTe4ACTcA
 kNaaR7Ar2b7FVQ2UoIyG4ivhwcahOq5BR0mV4fY0Em64olkCNL6Wh3hEVEV/FlxbNYla
 gUOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=if4RAkhreXdypvivvkzUzoNLQmdHtvLSynu8xvJL9L0=;
 b=aBLGc4J4qFSGLUI3MPSqYflDQCZ+XcPOfqzopkY1UrC2rFeRrn0QGXpEX+0LB/1Yw5
 VSPyh5K+ZNCDz4FwtQYmx9QMjRm0TriPDmmZMhsMZJO4G399Pe06fLdCGt6pq1kY/EkA
 d3g+WSJoFVsrRh9rIqiAJpgAJ2xYmfRzbJShOd/k0X0/okxgWAWGoPXGoNqeMnztdh2g
 wXbsrePZriuSGCNxo4U08CN+MR+l6WAVaOJ/POlBPXu1CXF1unUKAiMksmnpuYRCwA4s
 XJM3avwbp86MgVHJTWpzi44xJiE5EK0EeyP/MSqyRPWSurC1CFpHc2N1GkyAszSJ4igb
 wuIg==
X-Gm-Message-State: APjAAAUoLX8T1n564DkaZ7AEShlzDk6j0wR3hQ+IOR3sGQ6PEa4JkURv
 gLGuwYS6Is7kWnmUWEZyMts=
X-Google-Smtp-Source: APXvYqyRCM49T218y2zPfZg/Q1kMxItt+bAymfNhW/HR5muuMaPgLbxwUDSNLZMQCHjcIKtBirsL/A==
X-Received: by 2002:a17:90a:ead3:: with SMTP id
 ev19mr6168728pjb.80.1578677390808; 
 Fri, 10 Jan 2020 09:29:50 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id p28sm3513553pgb.93.2020.01.10.09.29.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:29:50 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Date: Fri, 10 Jan 2020 22:53:46 +0530
Message-Id: <20200110172343.17796-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] drivers: nvme: target: core: Pass
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
hlist_for_each_entry_rcu outside an RCU read-side critical section
but under the protection of subsys->lock.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
v2:
- Fix sparse error
  CHECK: Alignment should match open parenthesis
- Remove global macro and use local lockdep expressions

 drivers/nvme/target/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
index 28438b833c1b..c2d6c2dd53fa 100644
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
+				lockdep_is_held(&subsys->lock))
 		nvmet_p2pmem_ns_add_p2p(ctrl, ns);
 }
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
