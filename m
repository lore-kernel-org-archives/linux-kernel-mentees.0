Return-Path: <SRS0=nCKz=6I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEDB9C55194
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858BF20724
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 24 Apr 2020 09:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7jq44I/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858BF20724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 774D123251;
	Fri, 24 Apr 2020 09:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0TPvyPyynlk; Fri, 24 Apr 2020 09:19:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB93E24763;
	Fri, 24 Apr 2020 09:19:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC86C089E;
	Fri, 24 Apr 2020 09:19:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B3E3C0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 63CA223251
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBPo3DHjCNUI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id DB76620115
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 09:19:56 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id o185so4375561pgo.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2020 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=E7jq44I/8LQbSbFh4C7amXREHt9vpbDMy4Mp6Rh2tJOWIhJ3cK5V+mF7TUqUw/NBEo
 CQzU2eeBAD5rC/FH/8UmxLbD6G0NejF/GqmqYfe5O6LtdG0sZohNskc/zHLSjBFjP+7e
 orIi06XeMWoWo57EyIB1vVicwg3DQQLU66F1vzNCP6GGQoKaffmfEyJHa4PqTJ5AgDXH
 AC23T/tneADvgxBEGfVskPYiaSSjnYUVuoKYBULoSuOu06LgsyORlP5G51aSEJOG74Qg
 YdJeaHBGtJ+HK1xCKytvpJ0INOH82Zj5o0jx3QDLdlhTD/hC2zEawXOiPZzYXOiftLwH
 I3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R4XE5uPcNgqgWnR2Cr0pQe97/Ns3BG8LcPaOZ3ZDM6I=;
 b=mneG4cgFMusTAsw3uNPhyfI342ScGvVsCMMUWWktPdlKQ/Vn+CEH5BmdandntcwJd2
 nrEVxo7cdqFyF4NXDLvpxmlJJOXfGgOv9P9DlmG4QxmDeCz0AK5CDMYLY4KvDxFNcTtM
 wOQ1SP7rCcTLdHSbAPkEJDiOxfnzDlP5FWewbADnN9w5AUmxw+nFIgrVDmWic+5cZbPH
 MlIAG92xwxfY7sD0xv9VgZtXEjIb477G91fxmTqFHXfAWA+DvbTaHrfgk5ACLfkmPO5l
 GA7dCTsBQRpdLPlh6RTcleTd+LV/wQoxlZCPVhzagD4BTsCNpc6zSAje2UxPCV81ukTs
 Hmww==
X-Gm-Message-State: AGi0Puayi/4ya7E1W338XOtDYXDW+jVdiAW52Qd+Azm8zrBRdXA7QWTH
 BFPKuWhS9SaRJmGJLlDOE7U=
X-Google-Smtp-Source: APiQypJ19ZQEx+K1b1G/arEzOTllLH0p+gCjdbaKR6Zi+rUhdEfHFlovQlPYuC19BD3y36lYZSZQdA==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr7836836pgd.277.1587719996337; 
 Fri, 24 Apr 2020 02:19:56 -0700 (PDT)
Received: from localhost.localdomain ([1.38.216.60])
 by smtp.gmail.com with ESMTPSA id c80sm5043933pfb.82.2020.04.24.02.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2020 02:19:55 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 24 Apr 2020 14:47:59 +0530
Message-Id: <20200424091801.13871-24-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
References: <20200424091801.13871-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 23/25] parsing_c: type_c: Add
	parameter attributes to record
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

Paramter attributes are added to the C AST. Reflect this change in a
case in type_c.ml.

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/type_c.ml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/parsing_c/type_c.ml b/parsing_c/type_c.ml
index 4a85b683..617b6fc6 100644
--- a/parsing_c/type_c.ml
+++ b/parsing_c/type_c.ml
@@ -304,6 +304,7 @@ let (fake_function_type:
                 { Ast_c.p_namei = None;
                   p_register = false, Ast_c.noii;
                   p_type = ft;
+                  p_attr = [];
                 }
               in
               Some (paramtype, ii)
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
