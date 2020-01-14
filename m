Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F73C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:25:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459FD207FF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:25:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSa39OLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459FD207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 23C6F860ED;
	Tue, 14 Jan 2020 16:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sOQE3O3FXKxo; Tue, 14 Jan 2020 16:25:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5AF66860DB;
	Tue, 14 Jan 2020 16:25:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4A3F7C1D83;
	Tue, 14 Jan 2020 16:25:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 186E0C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 07267860DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:25:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mDALhe+RXqUq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:25:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DA37F860E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:25:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y8so5417687pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 08:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7jwlJAnIyJqxihW77uuy1REEn0k3bY6ojjoQKPqvEnc=;
 b=jSa39OLar/Fi32gqOEeLvW4p2KJj7cTCSWJihafTC4Hppz0jCfCy72OsknAnd4dOK9
 MT+LRI1ZmNPd8RBVMGGJcGAMAkSh+MwdPT5RfRo6kTPC93kD7PlpI7BrKZPimEHTdODe
 Hwt/0f7xhh55OR120i5bB9KnaOqzEvryZuhP1PPRZQ6ygaPVqItdRoLAak83TP+c/C63
 ad4t9a7e/iSaxFkBxVLJM0FcBdB3uprzQ6kubYq66lwixKRwgZ9h8MN+CarSpud6TsBf
 DlQtiYVqINRO+qiQrLvXgTRcWrzx7li4nJ+RTy9z9B8xslmqpOrTRhTjWbWEoVddkV8M
 LJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7jwlJAnIyJqxihW77uuy1REEn0k3bY6ojjoQKPqvEnc=;
 b=Pw95ok7xTGsNOhhkldiSANTruHxdYaYA3QgTQf3fXqf9TYGwYZ6v06lCyX5EHAlPJ6
 SQcc9h5IZBqnU+I53vT8LBur7HbYobcXDypL9bEcGODq4DnJF7IRATY+wf/ZFT+jhjA4
 fyrlVAiLIDE24OIcLWUpaQBQ54QgSu/3tgPqsMUavw5XBMHQhB8dG91F/m8MUSAQgD2e
 04EbOTv/qwKCK3mCcJvH1XHVA0AVXmoaBevK8OwVVHpJj8D9uuVRQ3gEm9X8X/uECEKW
 Yl9CYtHEbrX8i9vKQll1NuuUqiwZ9hhq9OjFhUmkjXa4l7MAIpgNx8JO8cuAT2l9uLuS
 o2Sw==
X-Gm-Message-State: APjAAAV5d0WVglAJ384wo2tpxhZVdQGFeJ6AJFPLGCeYUAbmzwngnuE5
 8sh5FnPhIlKmDkG+XpGxlStl9hru44M=
X-Google-Smtp-Source: APXvYqxrGnVakDKBqMasUm6BO3VJGLBeO4TD9RH57n1IJHxmeqqIWHb5RYsLLyH4vTfImZGgN5F89g==
X-Received: by 2002:a17:902:b103:: with SMTP id
 q3mr20545950plr.37.1579019144375; 
 Tue, 14 Jan 2020 08:25:44 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee7:f789:438:77e9:83ea:bb95])
 by smtp.gmail.com with ESMTPSA id o98sm18142914pjb.15.2020.01.14.08.25.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 08:25:43 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: mike.marciniszyn@intel.com, dennis.dalessandro@intel.com, jgg@ziepe.ca,
 paulmck@kernel.org
Date: Tue, 14 Jan 2020 21:55:36 +0530
Message-Id: <20200114162536.20388-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 drivers/infiniband/sw/rdmavt/mcast.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rdmavt/mcast.c b/drivers/infiniband/sw/rdmavt/mcast.c
index dd11c6fcd060..31c7f12c7665 100644
--- a/drivers/infiniband/sw/rdmavt/mcast.c
+++ b/drivers/infiniband/sw/rdmavt/mcast.c
@@ -224,7 +224,7 @@ static int rvt_mcast_add(struct rvt_dev_info *rdi, struct rvt_ibport *ibp,
 		}
 
 		/* Search the QP list to see if this is already there. */
-		list_for_each_entry_rcu(p, &tmcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &tmcast->qp_list, list, lockdep_is_held(&(ibp->lock))) {
 			if (p->qp == mqp->qp) {
 				ret = ESRCH;
 				goto bail;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
