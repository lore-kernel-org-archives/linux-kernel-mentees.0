Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C55C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:54:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10B020726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 11:54:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVyqha9S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D10B020726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9834486132;
	Sun,  9 Feb 2020 11:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id leaFUPg0eTxy; Sun,  9 Feb 2020 11:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88544860F9;
	Sun,  9 Feb 2020 11:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7543DC07FE;
	Sun,  9 Feb 2020 11:54:45 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20652C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0437483754
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MeygM_-r6z89
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 79A1C835DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 11:54:43 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so1638142pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 03:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iME+4RwX541eER4UFLDExBQMUtAjsX8GSiFR3pPKgU=;
 b=MVyqha9Sa5zHgcf5bNsRdThWGx5kGOztS5Or5uZTb6eIfRBouKtb/NcbBvNjr8ZuNM
 NlUuSMsLJt+BwXbdmma02N1hv6OIOAFRfEewc9m4UFYHMFS59ooOIW76ufVuAhBmtmri
 W//6Au8OCegF5Cw6lvUDWPoK3D2sma466HIB8AnvDtV/D624RGGo7eKzYL9jDm+CgwTs
 hNWmsXvIwGlY2R78RREZMTIkPP7ub3VjxENjjZk+NjlO33AKNjPcdjviGQBw3aeqaRVm
 QD3joGnudn9VFkCb8fCQxhfNraz/fs9wZEqiqrcslowmaQGtTILd+qH+ub6bp2vPJCGD
 vZpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/iME+4RwX541eER4UFLDExBQMUtAjsX8GSiFR3pPKgU=;
 b=ZNuxRmOPb5+9qurE9JytQ1AaH+M2vOog6BMlcz0hzSVkUmxW6ZpdxPbhy7O5XODkGS
 A0y20uj1806nAP5LlKxt3E5b1H7RzDexeeGusQ3yaAuzYBHdL1H44ZUtzg5KRflMDJ0F
 ORkfjWfN4qXIE/SEX/F64sF11eb/9kyhvq95W690YV0fLa6622bOdQn4MsunA8GmJuLq
 6BT+GCxfkmIhdH84yQFrr03x9uzHedQmM0CfpY9dj2RD9/vyyZ3acjGTz2h9y4KMDKp2
 W2A7YHwT/vEVTecUmZwx2pEd6exR6MEOkjn3h+UvC2n9W5lcCFkt6fv+Dba6axGwwm3P
 Pbpw==
X-Gm-Message-State: APjAAAW0njNh+ZOqmaIbWDDTumVnhjvzzCGHD6LqHa/MGCa7/tt7dJRe
 Q1Ob7QEefOXQCNsMMO7GnaJXmIvQ8qQ=
X-Google-Smtp-Source: APXvYqzluqmHHV0yGzKIlet6ryKkjTMelOOuq0INHWHmj8rTC+xWe/6aljqzPH479iLYNfj1RYl8cQ==
X-Received: by 2002:a17:90a:ec10:: with SMTP id
 l16mr14621404pjy.19.1581249282769; 
 Sun, 09 Feb 2020 03:54:42 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166e:dca2:8d98:ad42:3c3b:8544])
 by smtp.gmail.com with ESMTPSA id y6sm8947429pgc.10.2020.02.09.03.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 03:54:42 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 17:24:16 +0530
Message-Id: <20200209115419.32337-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] cocci: Align the C AST and
	Cocci AST for pointer
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

This series is to address the type matching problem in Coccinelle.

Patch 1/3 is for aligning the C and Cocci AST so that
pointer to const pointer and its variants can be matched.

Patch 2/3 reflects the pretty printing changes made in 
1/3 in the ptrconstptr test case. A space is added between
the * and const.

Patch 3/3 consists of a test case for matching a pointer to
const pointer and its variants.

Changes in v3:
--------------
- Add a space between the * and qualifier in Patch 1/3.
- Add Patch 2/3 to add a space between * and const in the test
  case ptrconstptr.

Changes in v2:
--------------
- Change body and subject of Patch 2/2 as per suggestion of Markus
  Elfring.

[PATCH v3 1/3] parsing_c: Align C AST and Cocci AST for pointer
[PATCH v3 2/3] tests: Add space between * and const in
[PATCH v3 3/3] tests: Add test case to match const pointer variants

 parsing_c/parser_c.mly      |    4 ++--
 parsing_c/pretty_print_c.ml |   12 ++++++++----
 tests/constptr.c            |    7 +++++++
 tests/constptr.cocci        |   19 +++++++++++++++++++
 tests/constptr.res          |    7 +++++++
 tests/ptrconstptr.res       |    2 +-
 6 files changed, 44 insertions(+), 7 deletions(-)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
