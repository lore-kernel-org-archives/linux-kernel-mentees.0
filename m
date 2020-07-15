Return-Path: <SRS0=zsCJ=A2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC70AC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:11:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9175C2070E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jul 2020 03:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="r83DgT29"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9175C2070E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5B30D878CE;
	Wed, 15 Jul 2020 03:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvGvheDy20WE; Wed, 15 Jul 2020 03:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DFF7286981;
	Wed, 15 Jul 2020 03:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB197C0891;
	Wed, 15 Jul 2020 03:11:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C048C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 74DF486F8D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFhfByOPIsPz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 89DBE86981
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jul 2020 03:11:27 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id g13so609834qtv.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 20:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43tn4SCdUQPE+RtWwrBeE6OYYiz+sN9YblVYLrd3cSI=;
 b=r83DgT29XWRfj/E7kT6DQYKdCfnI9xI/0edg/bbFkV//C89wvNTd4nIGL/BjrPYIWC
 tvFQi2YYH4+gOuGYcFnVDui7pyAX77p2sV/fCKLn0+80JLmbDB8KYA2MYENTAN4mBcr3
 m3/1fScIkCh8vnuV2VqtumrP7DHivlE2HhB0zm+0VMZuQVgv1yXJuJ9hyZXZaU9bHYpq
 HHpIxZm3rtMT/yRX7tvMg7/N2m9ffCf6LD2oepP8UHxOcpq4DamHysbUISrm7oGUbKHc
 GnJEe4LUjs6ErJS+KTAhjR+Qer6Dsx/R1xoehGnGR1d0rOpqP4FUq8ZAqwSvPvsg1JjS
 TsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=43tn4SCdUQPE+RtWwrBeE6OYYiz+sN9YblVYLrd3cSI=;
 b=PkBjsVxFbMVOzO/w8RRJN7OZ0pRokB70eZwpcpjt30o8NMjRLMysTCShRfsXlB0cGO
 unrIRVI+WpAdqS4gXovQFOHy5+TgjQy2YCoJH7uCq+LSB7+ecFsMddbUAj2QmHEVW8ev
 fAFxMmwFjg7dUqwIR39FC4RG9tXl/ajM+l4LZOQ0FCwZiZkFexcpYfvstjdD+WQZ86Ap
 ibmc6pwET6QkV+fRoic5j+fXWf1qJxYn2180kGC7kJ610sroyg0Jgpg+MAQuH2VBbH3d
 NTVFMehxKmYme9IxD1ZVqf9dxtFGZg7kAHIlGxjG5LCyFrPg0yMp3hDWjwYY9iPjELR3
 ERzg==
X-Gm-Message-State: AOAM5321glaRU64XCvar2qiECpcY9y482cS8EtzpZqHzMPz0hdAlth3h
 jSDURMsZW7+nbjTsiTidcvIlAw==
X-Google-Smtp-Source: ABdhPJz+ERBPdgPWk+4c+xiGhT5xApaA/bLt7Vj/xp0Mu7m61aF81TVotdoVo7ixAdGzSmR3E69gqw==
X-Received: by 2002:ac8:40cd:: with SMTP id f13mr7767036qtm.373.1594782686419; 
 Tue, 14 Jul 2020 20:11:26 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id x29sm1269229qtx.74.2020.07.14.20.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 20:11:24 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Wed, 15 Jul 2020 00:11:17 -0300
Message-Id: <20200715031120.1002016-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kselftest@vger.kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, davidgow@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, keescook@chromium.org
Subject: [Linux-kernel-mentees] [RFC 0/3] kunit: add support to use modules
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

Currently, KUnit does not allow the use of tests as a module.
This prevents the implementation of tests that require userspace.

This patchset makes this possible by introducing the use of
the root filesystem in KUnit. And it allows the use of tests
that can be compiled as a module

Vitor Massaru Iha (3):
  kunit: tool: Add support root filesystem in kunit-tool
  lib: Allows to borrow mm in userspace on KUnit
  lib: Convert test_user_copy to KUnit test

 include/kunit/test.h                        |   1 +
 lib/Kconfig.debug                           |  17 ++
 lib/Makefile                                |   2 +-
 lib/kunit/try-catch.c                       |  15 +-
 lib/{test_user_copy.c => user_copy_kunit.c} | 196 +++++++++-----------
 tools/testing/kunit/kunit.py                |  37 +++-
 tools/testing/kunit/kunit_kernel.py         | 105 +++++++++--
 7 files changed, 238 insertions(+), 135 deletions(-)
 rename lib/{test_user_copy.c => user_copy_kunit.c} (55%)


base-commit: 725aca9585956676687c4cb803e88f770b0df2b2
prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
