Return-Path: <SRS0=7LP4=7S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6058C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C39C206E6
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  5 Jun 2020 13:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uaZ4Eqt1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C39C206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4553D86B4F;
	Fri,  5 Jun 2020 13:44:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPN4jERLYVgl; Fri,  5 Jun 2020 13:44:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CAE0E87199;
	Fri,  5 Jun 2020 13:44:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E5FC0888;
	Fri,  5 Jun 2020 13:44:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88E8EC016E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 747B786B4F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vc5m5P-J1To0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1641B8714B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  5 Jun 2020 13:44:19 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id s88so2753146pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 05 Jun 2020 06:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cGDUzhZcEhkVFp2C8yOH7JRCO3lSVAy9MoJAYsw+VoQ=;
 b=uaZ4Eqt19z7Ew6mwrXFRvpNjsNsPjMDjDum9578ngnRKoDLa5UusiRFm2CyTDCwTCh
 Sk/KU7UC6TTnGE9T+60Hy+QylFEKkRNjSVrUc691KVjYBzQYRu4JFrMPn03qLAXKnC0J
 vvxKl6mxAOk2MEPdgN9N1viu4tu5eesc642443mF5/5D2l/a5DvWxSk4S0kMzozGXqIs
 fcRtmvyjrHpTOKznswHmxyz5PVbxcQ+MuQclZHkHg/NXxKIQn/W8jh0ponc6wqzQpuxa
 YLkw4CIrcOlRajGx9M6uLll5cjmUn+az0g7Vwa+pKRYcv095I7/ogZSel9qr3sTBvDLT
 lH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cGDUzhZcEhkVFp2C8yOH7JRCO3lSVAy9MoJAYsw+VoQ=;
 b=o0LvlnFL1Tgcl3Fve6ToAKCQ7p3zc+3iIInDxoDio5Qi07FLko8kmI8eSOBTS/lAJM
 9+Tx2TUcId+ZG5zSTx4X7ADcBOqMOjIBSe2auRI7RmFB8YZ3XlXZRBTmjloyqb72AcVP
 6N/SHT4B068td3TN2l3TLzAPMX3RgtR5nWzCX2voBvRxw1Xzhdfe/l2ltHZZJWqOglkm
 L82ml7JR0kIEfOYGtW9y/5aEvzE25gy4he10CfK3Z+LgXJR+q1/+iae2ARf+1IbHN8sE
 7LeAbxrAt3xYkjaIbcNr9djT1BuuFvF2tkjWplTS4KL7OEKmIjEVwqJTkSuteCOd97xf
 ts8w==
X-Gm-Message-State: AOAM532Kduc+WDDkCbz4m23NDuq9i+cwNBCEC7sz0BYQNsv1485bwS3z
 vMjIbeG07QTssyIaZr7KC7w=
X-Google-Smtp-Source: ABdhPJwdfxNYcS6dClsRvyguGwtVD/wCFW3GQ0+Fxh/dbO40vna8ov/YiPX1aa+i2Oykmpd9qfqaqA==
X-Received: by 2002:a17:90b:3005:: with SMTP id
 hg5mr3075251pjb.215.1591364658594; 
 Fri, 05 Jun 2020 06:44:18 -0700 (PDT)
Received: from localhost.localdomain ([1.38.221.125])
 by smtp.gmail.com with ESMTPSA id w186sm7861353pff.83.2020.06.05.06.44.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:44:18 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  5 Jun 2020 19:13:13 +0530
Message-Id: <20200605134322.15307-6-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
References: <20200605134322.15307-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 05/14] parsing_c: parser: Add
	expression statement attributes
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

As per GCC's C grammar, the expression statement rule has the following
production:

	expression-statement:
  	  gnu-attributes ;

Add this production to the expr_statement rule of Coccinelle's C parser.
If attributes are recognized, this parses the following code
successfully:

	label: attribute;

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parser_c.mly | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/parsing_c/parser_c.mly b/parsing_c/parser_c.mly
index d259f12a..e4352a61 100644
--- a/parsing_c/parser_c.mly
+++ b/parsing_c/parser_c.mly
@@ -1082,8 +1082,9 @@ stat_or_decl:
 
 
 expr_statement:
- | TPtVirg      { None,    [$1] }
- | expr TPtVirg { Some $1, [$2] }
+ | TPtVirg                     { None,    [$1] }
+ | end_attributes TPtVirg      { None,    [$2] }
+ | expr TPtVirg                { Some $1, [$2] }
 
 selection:
  | Tif TOPar expr TCPar cpp_ifdef_statement              %prec SHIFTHERE
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
