Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEEEC35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 15:35:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F4E20726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 15:35:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9Qi+Nqv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F4E20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C573B811F2;
	Sun,  9 Feb 2020 15:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sL+I-HeWFKq4; Sun,  9 Feb 2020 15:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 480EF84CE0;
	Sun,  9 Feb 2020 15:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27739C07FE;
	Sun,  9 Feb 2020 15:35:06 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C802BC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B11E784E8C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XaDc3Tdgk1hs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3732084E7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 15:35:04 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id s1so2378012pfh.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImjBmad0Y7KkkpXWrulDc58ZF4Njp59A+rW6CHlZR+U=;
 b=Y9Qi+NqvUn1+xgdPS/Nn8zddkgudP2nSfjzIBBqsklwud4NLjIDg1eZnVOMobvgm+L
 7SiAzhppcFAzl1INZEm8iXL4WKEMBMQK4Nh88WcIX2DOW+4puvHEE8PnEV11qR2UjOzb
 xDaZ0LGTfnCbblzCaSN20r5tNqrFR6aUqIs78bbOihafC8x7Du4pqnasHWgSRxPpIGo8
 iDjK9ALoID7TxL/l77XIBvA1WyLN2A1yBV+c77GI0R8eYerVxESRyf+z8abg2DlXQP/h
 4zKPa5jum7zvKdcR8Rf2yVtkrdeTlHR5WBA3oNPU1LpWwh3kgqlc7s4yXqQV/5f6A0us
 8yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ImjBmad0Y7KkkpXWrulDc58ZF4Njp59A+rW6CHlZR+U=;
 b=mZSBfn5fY1xBpPq1Itn7d75noIdQrfxEBkwiga/7Rj47z4jNv2FLsppETewvG09kXx
 B+vLpqgkCcPBBF9u0iRTPoRSeP4LoOGFRtKqng6c11o7fFR4Mvipgc/sPo5N/9WBtplQ
 rYY1/GNCk4TFerFfEN2lUBnyRvlZHCioYP7b+MqD+GI2ey1kIxnNpIxvf9FQx7Oa3JGn
 tBJpukVhi7eDiwhpZpmZ0YvUjjiipTOhGxppGzhMSr6PKkxW3NZPxP/zk4oDswV15CFk
 vL2rt1rPESnHiipUFbHfLEHLpou4lDIbLVpyntop2s6qJCVgR6Fcl1YWb09MyHMeGVYh
 WhJw==
X-Gm-Message-State: APjAAAUUrUk43fbgsczbzv71BCocTXZOnl+M5jKqiDcz8Uc7XIJgL7+3
 mrDnYRnedHxM63QtKIJxeOc=
X-Google-Smtp-Source: APXvYqxRwSyHg7aaX3NIfUKtjWJRm7LL8+kQ7sFstIo+nZhmfOQhp8ibI4cqrhmCdUpmi2BqbJGF/g==
X-Received: by 2002:a63:3349:: with SMTP id z70mr5505854pgz.408.1581262503659; 
 Sun, 09 Feb 2020 07:35:03 -0800 (PST)
Received: from localhost.localdomain ([2405:204:22ac:7250:d1c8:6411:2f12:731d])
 by smtp.gmail.com with ESMTPSA id c11sm9451702pfo.170.2020.02.09.07.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 07:35:03 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun,  9 Feb 2020 21:04:49 +0530
Message-Id: <20200209153452.11837-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v4 0/3] cocci: Align the C AST and
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

Changes in v4:
--------------
- Change coding style w/r/t placement of comment with List.iter and
  the qualifier printing function.

Changes in v3:
--------------
- Add a space between the * and qualifier in Patch 1/3.
- Add Patch 2/3 to add a space between * and const in the test
  case ptrconstptr.

Changes in v2:
--------------
- Change body and subject of Patch 2/2 as per suggestion of Markus
  Elfring.

[PATCH v4 1/3] parsing_c: Align C AST and Cocci AST for pointer
[PATCH v4 2/3] tests: Add space between * and const in
[PATCH v4 3/3] tests: Add test case to match const pointer variants

 parsing_c/parser_c.mly      |    4 ++--
 parsing_c/pretty_print_c.ml |   14 ++++++++++----
 tests/constptr.c            |    7 +++++++
 tests/constptr.cocci        |   19 +++++++++++++++++++
 tests/constptr.res          |    7 +++++++
 tests/ptrconstptr.res       |    2 +-
 6 files changed, 46 insertions(+), 7 deletions(-)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
