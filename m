Return-Path: <SRS0=Wgtg=7Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFCAC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACBA6207F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Jun 2020 06:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJLSc/Ow"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACBA6207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4AF7C20447;
	Fri, 12 Jun 2020 06:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ub+s0qBGeXHt; Fri, 12 Jun 2020 06:46:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0674A20346;
	Fri, 12 Jun 2020 06:46:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E3377C0881;
	Fri, 12 Jun 2020 06:46:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D23DC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 29942203CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rE0+SGD5dznE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E29C20346
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jun 2020 06:46:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 64so3845941pfv.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Jun 2020 23:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5zzNr5y1d8VFjowbDn4IgbzrWJxjXgTuZtBl3FeVQOc=;
 b=lJLSc/OwfbYii0YL/Qi//+/D3OHKaDKwDHZ2WbsUBzfJjKxJwK4KSxGlMY8LZSZVLR
 7ukcagmNPVeJa/v0HoL8ubrVUr01cmrjN253SGv6YFlR5uJMMYcc5oADGoR5ONHhp/As
 YTAOS2DErG7lihlFBOxFsiqTHp5uMxC7w22VQr52OdmSD/6+DrY2FV9drH72DATFOdTZ
 khfubmn/huoCquIo6SYW7NmGADD+KsrnLVej0hi3Gs2jJPDZAl6DuVzPTYuZz+dAdZnY
 8oalqTJMud5hpk7h+ZtKnuomN8Sx9qXDSr9FzBAkoJanpx4EHLd4Eplek3tFw0kvJpcM
 qJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5zzNr5y1d8VFjowbDn4IgbzrWJxjXgTuZtBl3FeVQOc=;
 b=Mpxper+HbbFPsfHWvSZwKzDBRlccOIFWDFlUaqoUc+jHz6eoF3kqQnGSKjUilG1LKA
 q9teolMw96dHeWDLyd8K8idHgTZhQ/MuS5cRmxZO44AzBJgAID1tBVoUNfOANYRznIxE
 WBBNsD2P/I5sFkxvmlWr4vk8Hv+LowBi06X2NIzGjtQRtFxFKpaVpiAbzitWbAOa18AG
 0k5DZtEVsLZIB0O5N86fE9qCfDrubBiyqEU9VxLv9HoEr1WMGh0NTYWxSmBZH3bnOPp9
 18+/nu86Eg7DCb3JbsJbHqLE7K5CZspsBCpV01d1R3JpoFNgOlyrZl9uVPM3f9jT640y
 nQMQ==
X-Gm-Message-State: AOAM531hEBj8waIJnh/oLN+tpWjgwvU4eWsZjeD6QPQPqBcuDUJctoSx
 mNcYqoDcXEj9WaOvRRkEwsY=
X-Google-Smtp-Source: ABdhPJwHaIAnyADzI21yW34jkEpUtM4dPRrugZVq1bDgeLJNBtutl2hquDYJri43WpxRebva+bR8sA==
X-Received: by 2002:a63:4cc:: with SMTP id 195mr9706157pge.294.1591944370820; 
 Thu, 11 Jun 2020 23:46:10 -0700 (PDT)
Received: from localhost.localdomain ([1.38.217.229])
 by smtp.gmail.com with ESMTPSA id w192sm5087476pff.126.2020.06.11.23.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 23:46:10 -0700 (PDT)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri, 12 Jun 2020 12:15:41 +0530
Message-Id: <20200612064544.30194-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/3] parsing_cocci: Improve attr
	management in context_neg et al
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

Introduction of recent patches[1][2][3] for adding additional attributes to the SmPL AST introduced some poor management of attributes in the following files:
	parsing_cocci/context_neg.ml
	parsing_cocci/arity.ml
	parsing_cocci/unify_ast.ml
This patch series is for fixing these issues, by modifying cases wherever necessary.

[1]
[PATCH v3 00/23] cocci: Add parameter attributes to SmPL
https://lore.kernel.org/cocci/20200511101300.11101-1-jaskaransingh7654321@gmail.com/T/#t

[2]
[PATCH v3 00/32] cocci: Add cast attributes to C and SmPL ASTs
https://lore.kernel.org/cocci/20200529120703.31145-1-jaskaransingh7654321@gmail.com

[3]
[PATCH 00/30] cocci: Add macrodecl attributes to C and SmPL ASTs
https://lore.kernel.org/cocci/20200524171935.2504-1-jaskaransingh7654321@gmail.com


Jaskaran Singh (3):
      parsing_cocci: arity: Apply mcode2arity on macrodecl/param attrs
      parsing_cocci: context_neg: Apply equal_mcode for cast/param attrs
      parsing_cocci: unify_ast: Apply unify_mcode to macrodecl attrs


 arity.ml       |   26 ++++++++++++++++++--------
 context_neg.ml |   12 ++++++++----
 unify_ast.ml   |    3 ++-
 3 files changed, 28 insertions(+), 13 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
