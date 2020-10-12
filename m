Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58732C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 17:08:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8911820838
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 17:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rcDnF/aV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8911820838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D86B207A6;
	Mon, 12 Oct 2020 17:08:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9ccGEssSBwg; Mon, 12 Oct 2020 17:08:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A1997204D5;
	Mon, 12 Oct 2020 17:08:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64BAFC07FF;
	Mon, 12 Oct 2020 17:08:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F335C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 17:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2B8B084C9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 17:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yhiG8KqORpO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 17:08:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F33C9863DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 17:08:35 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id u24so14941980pgi.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 10:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=88AU0+hOtEr3LX7JPS56bloXLsETwbX3NL4vxoI6fR8=;
 b=rcDnF/aVYnGq60l01oe+I4m8b+6mm+geAakhn1EmbfPG3tO+PnqIMKRAkDDajCwR3e
 cG5qp9c2h9k4OTqzgOre1VV6E25lvBzAo0oxeOoPhzQNTh/oWbMBC7yI6EPvIOP7Meew
 HLguismldIxcQFfznP4q9jgc6kTKe4fPBcjZ+QfGhZn9UU+Q6mS1+nsfFnkwDf3pFwkD
 VG/DwclBl6RO+ByzK2sWxUU6eX4bvWXEmCZJYR5m1M6lH2JwOVXUbEk1mItLVdulfvrl
 do+Xg9hY9hakUbh5LnaUWIu6exS7sPwEVxGBMY9K+PI3vv2L/cFUGmR2IWi5tBE0L5uy
 korg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=88AU0+hOtEr3LX7JPS56bloXLsETwbX3NL4vxoI6fR8=;
 b=KfHEHFNrRvkRwoxV8cekVMIOltssv0VNmWeGDh6wu/f2S9d4AbB/6fiQj12WanL9pF
 MpiuM5qg4orZ7yYQI8nqqBiZpFFD2WOzgK+2t+j3O+Lh2Otnt9yEadZNU3tafIxfL65w
 4coZkvwIJJq858iniYwGTc77HanyAH/aEH8fE06uj3hA24RWob2ou9s7qTd6dliYGAdf
 ZmqDxc+ojPffzUS+qvu/eQ+6GeX6XbTKU24cnhAB89jKHbPjMQUzqUTnbWT/TSJchyCM
 IyAGJojGz6PM0dt3LZEckaeFyO5YotOOm9lgSX+1AfP6qh9JHvWeFP0gXSl4N5tWJ4uT
 CW6A==
X-Gm-Message-State: AOAM5319A7iS5WUx6dvDLPzEfqEq1R/RDAR61AmPetzQnWT1qS9bepyq
 pF+w2j0HeuxdBXgQ4IseKfc=
X-Google-Smtp-Source: ABdhPJzaNfI7nE3EZ2Fy8n9RsMiFJqfM9rdxrVlioaPCS1JwLBL4PqWCM0MkelaVImbjaoIcH45ORQ==
X-Received: by 2002:a17:90b:4d0d:: with SMTP id
 mw13mr21103770pjb.192.1602522515412; 
 Mon, 12 Oct 2020 10:08:35 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id x16sm20494337pff.14.2020.10.12.10.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 10:08:34 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
 Michal Marek <michal.lkml@markovi.net>
Date: Mon, 12 Oct 2020 22:36:29 +0530
Message-Id: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-ia64@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/2] use interpreters to invoke
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
  - Adds specific interpreters (in Kconfig) to invoke
    scripts.

After this patch I could successfully do a kernel build
without any errors.

  - Again, adds specific interpreters to other parts of
    kbuild system.

I could successfully perform the following make targets after
applying the PATCH 2/2:
make headerdep
make kselftest-merge
make rpm-pkg
make perf-tar-src-pkg
make ARCH=ia64 defconfig
ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make prepare

Following changes in PATCH 2/2 are not yet tested:
arch/arm64/kernel/vdso32/Makefile
arch/nds32/kernel/vdso/Makefile
scripts/Makefile.build

---
Changes in v2:

  - Changes suggested by Masahiro Yamada
    $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)


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


base-commit: 2cab4ac556258c14f6ec8d2157654e95556bbb31
--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
