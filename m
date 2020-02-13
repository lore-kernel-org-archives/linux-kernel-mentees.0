Return-Path: <SRS0=i9XN=4B=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50652C3B18B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:03:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A2F218AC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Feb 2020 15:03:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEunzPMS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A2F218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF4E785FC9;
	Thu, 13 Feb 2020 15:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ka6lShwT1rHD; Thu, 13 Feb 2020 15:03:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D95A85F45;
	Thu, 13 Feb 2020 15:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72F9DC07FE;
	Thu, 13 Feb 2020 15:03:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BE3FC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0938585FC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6DgzNe54XfKF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A3D2E85F45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 15:03:49 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id p14so3214299pfn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Feb 2020 07:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G1URVlj7Itamof72U88sCTyKrE2tsgoZIU1g2MQTLT4=;
 b=eEunzPMSbxFG4bweZ0Ndj/87P833Ic9MFPnCSzj55NPcR0ymQ82wsiZqYSb1nk4y8n
 vnpDpP/RPoawFH2lKT+fH4LIqVcY3vw+XZ6VCFYWIxChO/zfnraDY1s+K2Vu8WxYmGaf
 p6kt/jZUcpj6P7ZpJdtxdBMtpgOT126Vr4mY5DboJ08lKnkcs7yEah2L6qRnLy2HAFmn
 pSdCkkgmCIlMOHbVYd62VqCTkmnmn1rTPlIW36YpxbBZMLjgQ2Wqpvfx1S8tGhno5wx4
 UsaeR6bH6DWuuSJJfZxvFgJ53tyZO1tbQs3rnpCGEKCKyJ36BSJBdlZtxA4O0oLBVawd
 /bpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G1URVlj7Itamof72U88sCTyKrE2tsgoZIU1g2MQTLT4=;
 b=JbhFiLhvyj0MIZLbQXHIImPq9uKFaX39bdgmoJsRiClD1K+AartIBnb4VPM0h9tAm8
 76/oRb9IAyt2sCnFVDUl5iH74kJ1gZkfl8uedOKGqdFgvxOXAsk9mpjoY1/V0Y2vlgDc
 pVnDzscNx6/G7lpwubWTpADhpBPfFKmDP1OL5v0roY5ol6DSiCY53hkuysoCxE2rKnHR
 AWF3wWC32ZVq5KdJmVnCPuwPHYJvDhQjHTXol2bBXWemtC6EQbRxzrkYzYFVWPiGNl0d
 L08BUsqIpSmxYMY5jrdmZ1x6oJa4dMmfroiMJgM+50y57XpN7Pm23Tqe7G8LJSuV790G
 PXRw==
X-Gm-Message-State: APjAAAXFmv2wjJeDAukIutDNTf0gEOKX0vVN8G1AZPlquuzJv7np7n2B
 tQ6HvpErv5hK5TF1oliuww==
X-Google-Smtp-Source: APXvYqy80BcDGxTwmn1WGkdzrAgompUbMy/tI6GtsozghL2Dy+wTbFwgE9Ja9AVRnkewKVx01aOEMQ==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr17868613pgt.432.1581606229256; 
 Thu, 13 Feb 2020 07:03:49 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:f65a:fc5b:5bfd:1ab4:4848])
 by smtp.gmail.com with ESMTPSA id 11sm3625726pfz.25.2020.02.13.07.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:03:48 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: bfields@fieldses.org,
	chuck.lever@oracle.com
Date: Thu, 13 Feb 2020 20:33:31 +0530
Message-Id: <20200213150331.5727-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-nfs@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] fs: nfsd: nfs4state.c: Use built-in
	RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when  CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 fs/nfsd/nfs4state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 369e574c5092..3a80721fe53d 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -4295,7 +4295,8 @@ find_file_locked(struct knfsd_fh *fh, unsigned int hashval)
 {
 	struct nfs4_file *fp;
 
-	hlist_for_each_entry_rcu(fp, &file_hashtbl[hashval], fi_hash) {
+	hlist_for_each_entry_rcu(fp, &file_hashtbl[hashval], fi_hash,
+				lockdep_is_held(&state_lock)) {
 		if (fh_match(&fp->fi_fhandle, fh)) {
 			if (refcount_inc_not_zero(&fp->fi_ref))
 				return fp;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
