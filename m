Return-Path: <SRS0=9uDz=3T=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74A2C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:11:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C388206D5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jan 2020 10:11:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkOH7nZq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C388206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 65863203DB;
	Thu, 30 Jan 2020 10:11:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9XbH+GMFUr9; Thu, 30 Jan 2020 10:11:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B6A6321563;
	Thu, 30 Jan 2020 10:11:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95AA2C0178;
	Thu, 30 Jan 2020 10:11:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF2E1C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DCD84864AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yWaWHUZTgd8B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6AA9E86444
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 10:11:41 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id s64so1385802pgb.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jan 2020 02:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mz6Sg+1xlyo1RAumtR2m9UZfDaDkaYdFhbdbNKvWKs4=;
 b=HkOH7nZqbOyGwH1fu0ppaau8VwYWH0iMaAnnXrxYZPHWSes9zL4AVH4XpB9eO3PfQu
 If7eVjiU18TtgXymv1vpr02ZZBsZVv7x0VOLx3mDChU+bWjwMOGHtGWLpaSr22mBhTNl
 eqLWe4lJyL0z34vCcZTl7t0EFwsjvvRKic7DEYD4zHeYy3Jkmgv/DTW9xC0tbz6rTpuQ
 pJJTe5v5WP52nOPqs6XfOPsQzEV8uByt6ZaIwNPWvZNvG5nhr+wg5zX0W3qALk+10v7I
 nc16WMlE25YLLzE0JfcKyOBoA3pZk4wFAaROMMxAGBGgJy0DqC/f+UmsA9Uaf0KIhn7g
 FJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mz6Sg+1xlyo1RAumtR2m9UZfDaDkaYdFhbdbNKvWKs4=;
 b=AhBB5S+sFc+dphGNBdbvTdoqr+1Jv0XVQVW4wInvWcIdTpqeiAg8Po6gDEtanNjwRm
 f3YgEV/xmKWqPfc3PfodZvHIOkl+li3/0J2A7a7ipeZGIQCGAl3X7JaDETproEmb7IxA
 vkmIPU76OtM8Rv/u1tCd5IlgQxlpWxIHE5RhNub5LhkeOlxpnQSNSAYevNt007DILsxP
 9pGl1jHeHjh7vZ6XNYV/YbUXoiq74y8PpZU8lRk7RXGejmdxKDUxJmJnOh4BOziQya7k
 WpA3Po2Je/usui2DW1hM0zywc6BPyva1ofMEhXQxC8ALMvvxn1ClgLfYAheJZmXp4RXc
 dYyA==
X-Gm-Message-State: APjAAAVMcueS1mf1evQrbrb8BgRnyJ+vA7JmVu5C4B+dDNoxlsViz1wu
 JLR2/WM2/W7C8bnwZqkI9TA=
X-Google-Smtp-Source: APXvYqxryqEa+v+/LI4WvWVdSwoiDVrYKw2NS71V1082sPc/hxKYLdwKiBOeldsH7+QUoiR81NFJAA==
X-Received: by 2002:a63:214e:: with SMTP id s14mr3857659pgm.428.1580379100984; 
 Thu, 30 Jan 2020 02:11:40 -0800 (PST)
Received: from localhost.localdomain ([2405:204:848d:d4b5:49ce:a9e3:28b5:cf94])
 by smtp.gmail.com with ESMTPSA id k21sm6239683pfa.63.2020.01.30.02.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 02:11:40 -0800 (PST)
From: Pragat Pandya <pragat.pandya@gmail.com>
To: valdis.kletnieks@vt.edu,
	gregkh@linuxfoundation.org
Date: Thu, 30 Jan 2020 15:41:16 +0530
Message-Id: <20200130101118.15936-1-pragat.pandya@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devel@driverdev.osuosl.org, Pragat Pandya <pragat.pandya@gmail.com>,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 0/2] Remove unused structures from
	source
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

This patchset removes following two unused structures from the source as
they are not referenced in any other file(s).
 -structure "part_info_t"
 -structure "dev_info_t"


Pragat Pandya (2):
  staging: exfat: Remove unused struct 'part_info_t'
  staging: exfat: Remove unused struct 'dev_info_t'

 drivers/staging/exfat/exfat.h | 10 ----------
 1 file changed, 10 deletions(-)

-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
