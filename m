Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B012C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:29:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD4F2077B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Doa0xXd4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD4F2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A525287866;
	Tue,  7 Jan 2020 19:29:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgE+Z5Yxqw6i; Tue,  7 Jan 2020 19:29:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3982A8778F;
	Tue,  7 Jan 2020 19:29:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 308E3C1796;
	Tue,  7 Jan 2020 19:29:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA1F8C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C49B6861A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqsRqnb6yl5I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:29:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5139B8547F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:29:23 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g6so115498plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vHcS5MGixSiDikhb0k92gL0arFETtVoaijzCLdHtLs4=;
 b=Doa0xXd4L03LriDOdzUb4PU2OvOqF2EQ8JOzdGLm73k7Vxe/dz15NwT7qpKFg8RrNJ
 65cNAAU4n7s14QuA25hrNAMpkYen3wc6txbuBvmkpRgQvOY3zSfU9Kt6DtpqFVmwFFty
 IR/ORtSpbVlygr3LEUQwC9kKqZWpt/myftShQUzkBPuN0sZ0IgtTI34IVdXtQJE8VIHw
 MDjsz/M4AqyXXrBtJOFfLD2fPWfSjUgt6BxH5ZDSFwelFWyIA7/W4dRdHhCtWL+oLDOd
 1lhLfZ5sQ7/mfya9t5ChQCM/176AKI/2Jl6+r+bZuIZ9TSMv8syU0lh7RCMnq9lZjp/D
 Rm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vHcS5MGixSiDikhb0k92gL0arFETtVoaijzCLdHtLs4=;
 b=jD8cuxP4QOzz0ACyZE0DeXaHTsvrdceDhUh6BRceSj1+ZL3V2JDtR8Z6oUJ6qCrlsP
 6ysfqyju69U/MRBcwkQXYH2v/srSyEQ+fMaujhx69BsMT8IPOURCWqxBHuIwnclmL7a7
 5HTgwnCngWcOYqRf+eJpAF85cDcOO4oj7W++Zy1mBt9Acs8aJBY+KUjqyF191olOJ57H
 6j1xioVlSYB/BaZEr21fBNpc4U2Gl9I02pFMWPLyl8wDiVJoFaSnfwj9xooXsPwPIVBz
 kw+ghGu3gYsiul63tkLfjWciD28mZ8tzHEk0i89tcG6XSJjEN7FVztm4N3b2BRjZKkFD
 b8kA==
X-Gm-Message-State: APjAAAW0P8lJnhCjR4/ypuB3i3xAZ5lUh8uSQfFrbIN60SOjOLgLSL0D
 QpBziCax0kRDgV8HUXFrVUo=
X-Google-Smtp-Source: APXvYqyWhmCx9SqRgxjB8qdN1U0G0J1bBoWoaWFrOZ9tfpnMbEDodA/3o3t2QYZgXg19a7MsJuhHyA==
X-Received: by 2002:a17:902:426:: with SMTP id
 35mr1291908ple.176.1578425362592; 
 Tue, 07 Jan 2020 11:29:22 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:8500:6ea8:4ef2:c9be])
 by smtp.gmail.com with ESMTPSA id w7sm333554pjb.31.2020.01.07.11.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:29:22 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Wed,  8 Jan 2020 00:59:12 +0530
Message-Id: <20200107192912.22691-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1: verbs.c:
	Use built-in RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

list_for_each_entry_rcu has built-in RCU and lock checking.
Pass cond argument to list_for_each_entry_rcu.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
index 089e201d7550..e6abdbcb4ffb 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
 				       opa_get_lid(packet->dlid, 9B));
 		if (!mcast)
 			goto drop;
-		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &mcast->qp_list, list,
+					lock_is_held(&(ibp->rvp.lock).dep_map)) {
 			packet->qp = p->qp;
 			if (hfi1_do_pkey_check(packet))
 				goto drop;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
