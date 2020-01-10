Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0652C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6000A2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaSVl6Bm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6000A2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 36138884C1;
	Fri, 10 Jan 2020 17:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElY4Buui1aqQ; Fri, 10 Jan 2020 17:12:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5D6E884B9;
	Fri, 10 Jan 2020 17:12:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5254C1D7D;
	Fri, 10 Jan 2020 17:12:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 742BDC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 704D5884B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPNDqlVuUWlv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF890884A0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:12:09 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id s21so1083791plr.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEVYK9aqtGKNYk8ayn8obK4LdyjwwVi/XRTh47nIavg=;
 b=gaSVl6Bmz5jW/oBpEpFgWB4wgnN+xKAuUZlid0HPQ9VR2CRVIcDH87dapf7uLiicr3
 1ZgJfNw5C7tSG/2NRE4jaUoKU7sXxuDKfcH8vcmmc6NAfioXxYxiIAj0iM2/UVBdlgfe
 ROsh9XT9e2Ng8ZKe/YLfGW58XGN5KOQRSr8z/CQqsurbWEWUvl8ZGPsJSMDhFmzZgab0
 rgpZbOg1dbcEuwvr8Mnp+QO1BNToTc6qwC+hNfdbKOdOZrbGcg4qVoyFe7/kZ+LzAJw/
 lRqc8CgwoX5Dfq1xUIYxdjg52WJ61R1xutwUpYBkNHWfh2gXTxAqirSHkvEXdZg9HyKe
 W1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lEVYK9aqtGKNYk8ayn8obK4LdyjwwVi/XRTh47nIavg=;
 b=uEQZbhBOGiItbZvPrIy8DM8XNh7It+sqhp2lpu8HcQRNsoCHZEJXr1g0i241aXmjyx
 6E3aw/Yu4aX3NsQerwuoRu7YCDe6UTMrhRMWZYzOkbr+FDMTl1Uxha3IF+AymQ4CVkM4
 6MY5jEIGd8bfbj8g4CCf9q91lTvGxpKHXbkST5UBk7QUfDOmfDB/dZ9gqOqAaO0EYwN+
 fvZMF+vMtlRoxydBtarEvb1wVVYt+PaBwnT3Nai3kwie9rhykK+hmsz4DWQIl1MWbDMx
 66UwQqhc7Oyp5mkEaE3DCU4t4v+t3FbwMQis+jajSRHAcu/WGSFZ4Dek4QGbu309g1/w
 XpNw==
X-Gm-Message-State: APjAAAWOpd1088ulxApsN4PnhJpJzTaBha5/Ar0+NJTecGKVxuj1pNjo
 FHchR+nNX01jB0SO9Ql4p20=
X-Google-Smtp-Source: APXvYqzLcDbvgHbLNW8MG1OX8FderF9d4SCHPJN7UTd9kuJq8ngUXFQIfKHIMcyofuUzbZtPvm5iug==
X-Received: by 2002:a17:902:6113:: with SMTP id
 t19mr5429388plj.201.1578676329357; 
 Fri, 10 Jan 2020 09:12:09 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:1662:5ce0:c587:cd6:22a3:e892])
 by smtp.gmail.com with ESMTPSA id b24sm3534920pfo.55.2020.01.10.09.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:12:09 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 10 Jan 2020 22:41:48 +0530
Message-Id: <20200110171150.14695-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] cocci: Support user comments
	attached to identifiers
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

Comments attached to identifiers via OCaml/Python bindings can be helpful
in using Coccinelle for source code analysis. Users of SmPL can attach
these comments to identifiers for denoting some information.

This patch series is for handling these comments and adding a corresponding
test case for cases that previously caused pretty printing errors

 parsing_c/unparse_cocci.ml |   32 +++++++++++++++++++++++++++++---
 tests/id_comments.c        |    4 ++++
 tests/id_comments.cocci    |   19 +++++++++++++++++++
 tests/id_comments.res      |    6 ++++++
 4 files changed, 58 insertions(+), 3 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
