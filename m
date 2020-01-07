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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E87C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAF7E222D9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O45qqj0a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAF7E222D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D12286092;
	Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d0KU9lN8nfQx; Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43EED859C2;
	Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32C49C1796;
	Tue,  7 Jan 2020 17:36:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 020B8C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E22ED8560E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wahV4cvPise5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8242185617
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a6so86913pjh.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 09:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yEpRHlcDF4psUPPX8udaCtEP3gg4YAcBzZqIRmvDq4M=;
 b=O45qqj0aDDULssDuKLQcH16n+Zkv27jPGry9/wMjWy0wRqXphQim2gedId/p3u4n2Z
 MMcmLTugiChCJ7XpCS0cGoXvkAUaTZCdA68ICgGDyGESgXIrKDek3SK5U9jL9ggoBXKi
 /QVCQV+SXMbuh3h4lzYjs4AmZAXZ8R82e/Rz//ukbWs9tLnHy3FyBZsXgved9Bf6PNdH
 C47yCiHk9ag1bygHICUnu52JC3Q84XJSjP7qHGcrb+lh/8JLZruI1NBnArcirWoER96h
 gGhphUznyXUT6/c8h+3fjnCkTa5SD9fnFzBHJWF4xI2QScOkI0ZgDMhr/5m7UuWzj1Yw
 1aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yEpRHlcDF4psUPPX8udaCtEP3gg4YAcBzZqIRmvDq4M=;
 b=k3UPoWx6gPqQi5zSiWxJ8RCAaQYkfqFyNAJ7I33JkahrMrtn54Ywy3DAGP5OOUvYtn
 y4Hnno6GkH1alG6DUB09b6FSpXOKXHg6Wx8T676ZxNLWRqfzsM2a3Q9SM87bvlf+8NgB
 RV22jIdeaWHpKVYz5dRLMoC6xEq1inclIKjs65dChnurFd0YHzkkfmFPlxSc9lTiOXH5
 oEQ7CLnYYOu9z2qlSgcLGzoUidRrUiWd6hWsDIMIH73RPPGK3CfA6a78Pz+Up+/t72Vn
 lYnolLZzvWNJrsKIFUPpOCNc/3uwwm+UebtAfBf67wJG3LqDc1EpqGupx8byQu46Igxr
 T4Bw==
X-Gm-Message-State: APjAAAVgFSbkg3N+f2rR0gp9xnJI0ha/6fxpIQJVmPl9BafAusmihCq3
 2P5LJk6q+FqDQmbntIbwH7+X1VPy5Vg=
X-Google-Smtp-Source: APXvYqwlIMhhQqRk4XXts851ki2Ruxlx1uFIWb/XbuB0nNQEVcpwt/2clYA0lB6mVvUaefD7sNnXEw==
X-Received: by 2002:a17:902:c509:: with SMTP id
 o9mr822791plx.112.1578418607016; 
 Tue, 07 Jan 2020 09:36:47 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:981d:523f:a647:bef8])
 by smtp.gmail.com with ESMTPSA id d3sm130091pfn.113.2020.01.07.09.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:36:46 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Tue,  7 Jan 2020 23:05:10 +0530
Message-Id: <20200107173510.20320-3-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
References: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] infiniband: sw: rdmavt: mcast.c:
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

Use built-in RCU and lock-checking for list_for_each_entry_rcu()
by passing the cond argument.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/sw/rdmavt/mcast.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rdmavt/mcast.c b/drivers/infiniband/sw/rdmavt/mcast.c
index dd11c6fcd060..5fce375f22f4 100644
--- a/drivers/infiniband/sw/rdmavt/mcast.c
+++ b/drivers/infiniband/sw/rdmavt/mcast.c
@@ -224,7 +224,8 @@ static int rvt_mcast_add(struct rvt_dev_info *rdi, struct rvt_ibport *ibp,
 		}
 
 		/* Search the QP list to see if this is already there. */
-		list_for_each_entry_rcu(p, &tmcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &tmcast->qp_list, list
+								lock_is_held(&(ibp->lock).dep_map)) {
 			if (p->qp == mqp->qp) {
 				ret = ESRCH;
 				goto bail;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
