Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41408C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:28 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05EA422522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBqPWmuO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05EA422522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB4D6879C3;
	Tue, 21 Jan 2020 08:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Np+76DfU5B1; Tue, 21 Jan 2020 08:05:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 961BA8798F;
	Tue, 21 Jan 2020 08:05:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ECD5C0176;
	Tue, 21 Jan 2020 08:05:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F32BC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 84EAC879A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fbvc36m0QVgs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0BC958798F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:14 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q10so1076466pfs.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGP9dkFNBF7qY4vfMORKTU0siRrZw5MX1d25w1d6MCk=;
 b=LBqPWmuOEU0nfp96yVYLfHWAmWfJXN1fziaUbw/fatLBiMneSMGWYOy2Y/jCrH4YAY
 jwls1qXmiOY5V2PUUvFEj21j1KM0vq72csbbobpF+gPeQzSLcz/EUqXXXTSkJMq8l5ee
 QX9kWydYrS09jUJ8Cd63o6KJFtRosd+/gdv3MhPU77OpeRWV0zVa1y2WO4bV8cEvF2qj
 XrqKZcJ8Ud+E4d6KG31uL3NIWWM5BFkn6SjZm2sIfGDB5o4p3McYsueoP3NjPfGSkQaD
 vnbYc4Lv6pgK4mOhNaTp2rlDcFmB3iDJzA7WI8BB5Te5eiSz9VF0TEeJJeltl1JpTIls
 n0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZGP9dkFNBF7qY4vfMORKTU0siRrZw5MX1d25w1d6MCk=;
 b=cidyzCfRhQFsmr7P2W6B3TVHFWoCtfuP7EIl+Kya3reSAlI6Rcp4N5C+PzgD/QY/jz
 eJhXF9FySbaaZG1byWZa+WNvfrpL2X5jEbIpeorJnvp6ONoy6EYjscYGZbC545DBxbLA
 +kRZO82dyZncLHTJC7bOwS9s6eXA09+Rd6kKUNzbYl8Qj0c3y54hEdMluEd68/9y7M17
 8N/UuCDBVANpWNeikhhSotapcI8SN1zgyJjvF/9b8loDgfQAe7+veGRXIfnRmq5xyTWb
 58DuVFK9Eo5uJ0NSAdb+rKHDgr79KsiFkcvMKURVStdieIRa0k7xdnfhoT9CmOJmxNCT
 7TpQ==
X-Gm-Message-State: APjAAAVWxQk0dSTQRvcTO3NiDu1dZPCrt1UzRxLKdS/yIUpYaF6AIqix
 2/znXE0oawo9NM6+9Cq6qHW4ObskXBY=
X-Google-Smtp-Source: APXvYqyJtbnK4kwL6PtjPps0PDAFXE6c04E6tiBeMczQVLRzC7P09DNzJDAXp/SVBB4QGY1PqCemLA==
X-Received: by 2002:a63:d543:: with SMTP id v3mr3956243pgi.285.1579593913545; 
 Tue, 21 Jan 2020 00:05:13 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 k23sm39229604pgg.7.2020.01.21.00.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 00:05:13 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 13:34:52 +0530
Message-Id: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/3] cocci: Improve management of
	macros before typedefs
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

This patch series is for improving the management of the following
case:

<macro> <typedef> <ident>

If <typedef> is a known typedef (such as u8 or *_t) then label <macro>
as a CppMacro. Subsequent cases will label <typedef> correctly as a
typedef ident.

Also add bool to the list of known typedefs so that cases of

<macro> bool <ident>

are handled correctly just like any known typedef will be.

Changes in v2:
--------------
- Group these patches as a series for clarity
- Add a test case for <macro> bool <ident> (Patch 3/3)
- Explain what has been improved with Patch 2/3

 parsing_c/parsing_hacks.ml    |   37 ++++++++++++++++++++++++++++++++++++-
 tests/macro_before_bool.c     |    4 ++++
 tests/macro_before_bool.cocci |    9 +++++++++
 tests/macro_before_bool.res   |    5 +++++
 4 files changed, 54 insertions(+), 1 deletion(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
