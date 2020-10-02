Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 636DCC4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:38:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C403F206CD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 10:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1HzOuWQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C403F206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C8CE86B0B;
	Fri,  2 Oct 2020 10:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVL9EcOYYWsH; Fri,  2 Oct 2020 10:38:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 844E286B03;
	Fri,  2 Oct 2020 10:38:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76C49C016F;
	Fri,  2 Oct 2020 10:38:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F368FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D523E204C0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BikekadoUnq2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:38:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 0334B2048C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 10:38:11 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id n14so953650pff.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1ITpaSjMTTNCd8kAtMpz5h/WML4r2TuO8FdKdspC25k=;
 b=j1HzOuWQrV3u5dLUCqeLJ24Kp7iEUVt5M/Ocd89/es2I4XxItmLl7RVQctDKQfAFur
 LVvIUo+5YhSeaB/4pKX8YcZdQqIhNM+aMChVt6tzEDdqCRkiK/NX4VBZBFszP9uP7agL
 htlICFVTVS3iI2tvlLa64Vup7+bOEJAROoqdZfCfVrobLNfB/ZfBN6B/Pvp5Yj3uKitS
 u7gvh9Ea/6qkJcTHNICh+IW2+ETQHVXz3wbOpueSYP10hZKrkBBKMDwGfcUmDdCNVTie
 0ffbSc0Lb2govKjxj73rgjwLhf7IDiEdCJFxsOKsucXkjzMPcUQyCPB7r61X/uYF5N+k
 2c2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=1ITpaSjMTTNCd8kAtMpz5h/WML4r2TuO8FdKdspC25k=;
 b=DjWngVjFJdBD7TaYMtqXavzhu7Zb9dwGH6U8TMj1hZXQecESfqE+sipI6w44F6I1TH
 FbgVdsa4oWfcJcKPlZjwuLYyGZ1F8273BBrxvam35xpwxFfOIsR2F8wlS+hXHAaSuUuo
 2ivm5WUcHdTpPIWkvm5yf3f+tica7QBAo47/gi/XIw2JWvBo1JWL8rAk0jJ+IjgbH85+
 C4m9JEplt4H3UbMC51n/Ihvbh/cF8dwu8s0/yMmlfG1by99nNBTFkqoy8si0vOWmJmUR
 mkSuSpSi/hFa2go2my/K38gSl9b4kQtLV6Dre4Oz7g00rg5M+AXGmafAL5NbcXFdxONv
 1Z8A==
X-Gm-Message-State: AOAM533j3eQWCpuETwUSDRi7BgF3Eya2BFRvB5ygWOnezif9I/4voFn1
 bQOJs6GACqh2/zsJltnJv2bMKqPBSHW4bg==
X-Google-Smtp-Source: ABdhPJyI+wnehvld9c9XFreCsXm/5IKyQ8gOh/DEPI4lmulQZTyhSYkLFQw64JArcWe13lhnBxVl0A==
X-Received: by 2002:a62:1902:0:b029:13e:d13d:a12e with SMTP id
 2-20020a6219020000b029013ed13da12emr2167167pfz.22.1601635090916; 
 Fri, 02 Oct 2020 03:38:10 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id f19sm1503947pfd.45.2020.10.02.03.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 03:38:10 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <06b25639-0d7d-e635-706c-19b950c5ff2e@gmail.com>
Date: Fri, 2 Oct 2020 16:08:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC 0/2] use interpreters to invoke
	scripts
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

This patch series aims at removing the dependency on execute 
bit of the scripts in the kbuild system.

If not working with fresh clone of linux-next, clean the srctree:
make distclean
make tools/clean

To test the dependency on execute bits, I tried building the 
kernel after removing x-bits for all files in the repository.
Removing execute bits:
for i in $(find -executable -type f); do chmod -x $i; done

Any attempts to configure (or build) the kernel fail because of 
'Permission denied' on scripts with the following error:
$ make allmodconfig
sh: ./scripts/gcc-version.sh: Permission denied
init/Kconfig:34: syntax error
init/Kconfig:33: invalid statement
init/Kconfig:34: invalid statement
sh: ./scripts/ld-version.sh: Permission denied
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
sh: ./scripts/clang-version.sh: Permission denied
init/Kconfig:49: syntax error
init/Kconfig:48: invalid statement
make[1]: *** [scripts/kconfig/Makefile:71: allmodconfig] Error 1
make: *** [Makefile:606: allmodconfig] Error 2

Changes:
1. Adds specific interpreters (in Kconfig) to invoke 
scripts.

After this patch I could successfully do a kernel build 
without any errors.

2. Again adds specific interpreters to other parts of 
kbuild system.

I could successfully perform the following make targets after 
applying the second patch:
make headerdep
make kselftest-merge

Following changes in the patch 2/2 are not yet tested:
arch/*
scripts/*

Ujjwal Kumar (2):
  kconfig: use interpreters to invoke scripts
  kbuild: use interpreters to invoke scripts

 Makefile                          |  4 ++--
 arch/arm64/kernel/vdso/Makefile   |  2 +-
 arch/arm64/kernel/vdso32/Makefile |  2 +-
 arch/ia64/Makefile                |  4 ++--
 arch/nds32/kernel/vdso/Makefile   |  2 +-
 init/Kconfig                      | 16 ++++++++--------
 scripts/Makefile.build            |  2 +-
 scripts/Makefile.package          |  4 ++--
 8 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
