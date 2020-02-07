Return-Path: <SRS0=QXRK=33=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9555C2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 06:09:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A230220726
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Feb 2020 06:09:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUCItdEo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A230220726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7312720430;
	Fri,  7 Feb 2020 06:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v6ePER7U2lAy; Fri,  7 Feb 2020 06:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 084F32039E;
	Fri,  7 Feb 2020 06:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7D0CC1D81;
	Fri,  7 Feb 2020 06:09:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFC7EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 94B4920430
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nYtHN9G5L0xJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:09:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A4262039E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Feb 2020 06:09:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s1so712795pfh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Feb 2020 22:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WXvCAuGoQP5htG9+fAp1LyL2Dhtbc3v/kIql9co2TdQ=;
 b=AUCItdEog9QbsXtbePS9JgG/C47z72vyMgzGdkwBDWb52m5JdKGYsBhOo2aUbc/Tt5
 7rpjAgrmQ4qbSOIqelDtCAaICzJ3BCWMpZwYisz5d9NPzgXE6CXa98dEZBMEVnlN0rx3
 QjaQGZulfbrs3gJJPWutgGJmJTbsvqZrRXreSI03VAwQ+4v3eW6PcZ6IqRy57fr/QtO1
 vqqCPdSaPsyBnYa83oERiyd6JPwiSJ08w7yeP1bm93hG9XcwKwQvtvqLytBvsdsOzHXf
 qgc9HtRuZ9CfGZwEl/xqNzVKXvTQ5wbb5RveI+QETGp2E7PFmUltuMTOX4d6PmVWEFe2
 nYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WXvCAuGoQP5htG9+fAp1LyL2Dhtbc3v/kIql9co2TdQ=;
 b=PX5k96tGyaeo/ZzkS4stUwX0xrvVDGla2oIstQiagLoNVnPmIHiM0D4FKQ20+YZKc1
 XLElTaYg3GY4my28VnjKhJRQm9nTgrv55FshXGZr+e2WkJWRpW/aBlvgmfcKoGU3ESYo
 ABnFwbWIX78UW2utoYbHxSbcDDUVcBdNwuaHu0ApTk5SXC/1u82s0oOuDgqfTTYxmG43
 ssiX1UMqfb37P8uaKpR5VngdLA6ZOM20vfa/QzxLGnUT9IiE7XRU+hZlT+u7N+2OlKIx
 aLfcti93iUx6wrILDpmnPorzpNo8rmH13Rit1hJlCQEAPy9B7uuxOI2FcHOBSfv973du
 cKPQ==
X-Gm-Message-State: APjAAAWo+9er0c8xiHMy3gNsHXeKle6/4kh286N3a5gMdBpuK5Q233RM
 R1MsYJbMasBu8IXw89pBw74=
X-Google-Smtp-Source: APXvYqztBrS8ObO1kvBTYbkUnW+FVscKdol8AzQhNt8FBImZQcxCoKNQaSBjp63msi6Pr1lV9HOKyA==
X-Received: by 2002:a63:2782:: with SMTP id n124mr7819216pgn.188.1581055791961; 
 Thu, 06 Feb 2020 22:09:51 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 b130sm1243438pga.4.2020.02.06.22.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 22:09:51 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Fri,  7 Feb 2020 11:39:36 +0530
Message-Id: <20200207060938.9531-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
References: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] cocci: Align the C AST and
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

Patch 1/2 is for aligning the C and Cocci AST so that
pointer to const pointer and its variants can be matched.

Patch 2/2 consists of a test case for matching a pointer to
const pointer and its variants.

Changes in v2:
--------------
- Change body and subject of Patch 2/2 as per suggestion of Markus
  Elfring.

 parsing_c/parser_c.mly      |    4 ++--
 parsing_c/pretty_print_c.ml |    6 ++++--
 tests/constptr.c            |    7 +++++++
 tests/constptr.cocci        |   19 +++++++++++++++++++
 tests/constptr.res          |    7 +++++++
 5 files changed, 39 insertions(+), 4 deletions(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
