Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEFAC35254
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:03:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B2F6217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 13:03:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkZaJOs1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B2F6217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64781862BC;
	Wed,  5 Feb 2020 13:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hc09PUNdcU27; Wed,  5 Feb 2020 13:03:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B70C2862C7;
	Wed,  5 Feb 2020 13:03:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1F32C1D81;
	Wed,  5 Feb 2020 13:03:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F2E0C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 548F287807
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kmqXPu616kL8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D303F878ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 13:03:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 185so1191254pfv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 05:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRF0BUgGDS22Q7Mf+gFVNCWsGmQAC8EV74GME1B2LTo=;
 b=qkZaJOs1E3zcrSHMrSdmvNUb7TYNF71HkWFOfvOPw09FzI4FGQef2Y32n6kkLSnug6
 ME5692GQt4hKUMQDIh6bjl6NPztVI5K94AgtV704VZgUchRr0SedvBlgUvRfDwnIRvje
 r1CJ71U4E2G1l8SaQ9tXvPux/5u5OE+272Fqbt4HjcsNEwc+BPrHuIDHiVLsFy5vr2aZ
 YFqpk0yoBGW5p0IUymSCIY/PFYsmxXjtO2/rwPkhAw0wAd0UeX9q21Sp7g9IV+i7d3hP
 SHg6Y9W2/utWF1iILBs0ObKzULGst+1tB1+9xPzXcfWRYDwQPfE5+NqdTiASt7tVSIYw
 1kng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vRF0BUgGDS22Q7Mf+gFVNCWsGmQAC8EV74GME1B2LTo=;
 b=c/0ewNxzDZHZ6cbqaLJ0+H04g8uJFGENYgbN4T9otXXOO8GXyfviudtjZevDvURbDK
 KZIB3ZnxZOTrdqpHfFDjb/MWqp9XB08Nu2qSZbBASF6RPpTXFDDfuG00z+qIg8iPzRFK
 8R4GmVklwYZ3SokhDUVwN+aGUqQT5+GQ2uqG8iCfMGw7MmgLbDttO/Xj80rUzGE322gR
 nO8NgkbA6HH2kZshldfTH3aA9UzLfauNYwTzzaylkVquS8t2tJSubpRh9FBrwzM8KSER
 i6wkJFRKm3tPHss14Qi0W1jc6Ho+nE2a9BfOQMxFF9YHAq1LW6hJB/BgIAx58wXNlpLA
 xnrg==
X-Gm-Message-State: APjAAAVB2Sw9HSMiQCbzs9J3KGZ4X1z/NUUgb3L476/cpIpXYK4c8Gtg
 P8jQvl9lfMK4xBFiuXGwjuA=
X-Google-Smtp-Source: APXvYqzZb3QsqhyiUY3XOg48gvZlJJOVhilvJuYQaA9LpOQoA3tKrSJUe/IL9LaKcS0rsSCfBmONow==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr35898354pgj.341.1580907832410; 
 Wed, 05 Feb 2020 05:03:52 -0800 (PST)
Received: from localhost.localdomain ([2405:204:30e:4a31:b268:7a3:7dc6:f288])
 by smtp.gmail.com with ESMTPSA id
 q6sm28137098pfh.127.2020.02.05.05.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 05:03:52 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Wed,  5 Feb 2020 18:33:25 +0530
Message-Id: <20200205130327.6812-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] cocci: Align the C AST and Cocci
	AST for pointer
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
