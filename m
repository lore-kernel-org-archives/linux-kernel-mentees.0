Return-Path: <SRS0=uLYh=6G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C10C55189
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 00:48:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A60272074B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Apr 2020 00:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="KNhsmWT9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A60272074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 68C01882F3;
	Wed, 22 Apr 2020 00:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1fLu5qx-8OV; Wed, 22 Apr 2020 00:48:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DB0387EB8;
	Wed, 22 Apr 2020 00:48:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B5B9C1797;
	Wed, 22 Apr 2020 00:48:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2ECEFC0175
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 00:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 190EF85F79
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 00:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQuuaem4QEXC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 00:48:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A8B7885F71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Apr 2020 00:48:49 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id b62so796246qkf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Apr 2020 17:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63fb5nFeJN7PoJsX4tG8GdYMct2l/caN8RuSWQJuLEw=;
 b=KNhsmWT9X7NXWyY5qb/yjj1tgaB4Sc31PWWRCMn2oniNkKQO+l8nFnvWBfaZoB8LrW
 MdmRsF69wY3y2esQ1/pOy1OTG71Wa3LSfHHLpIoETLNZ5Ff06H0Zu3/8SJ4+aFm5yDaM
 InnJDDkCl8D/h1TdruetLvGvYX3Spyr9N3LVM40J4npyDDgpjQiN/lgbomNITF6ZsNsm
 uw9oIuZ8OKxunofr/JwEa8PnFT0VGMIofbo7dlMLMG3KuA0Ohe+Ke1zjLh7I66hRmOoF
 EQyPst2FljABILEn0ty9aYHmzBfeyWeX2XI8biSmgAZs2HeQ1Pi8Kg67NNjKB7m3Fk0D
 TZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=63fb5nFeJN7PoJsX4tG8GdYMct2l/caN8RuSWQJuLEw=;
 b=jRkD5hS8qFh5owYnFgAd3NMfyRClcNqOmLe72t7WiaA7N4xH6ogVoiKFPUqXquhsnz
 Z/6aA0AiofriVABJklFq6lBg4L/ZecGxnvwk72rjWK1KBc79waVNzl1Hm7nlvM+9C1xa
 z5pMmPXwnAr6kg73TBohsFqEy1Z8d2zY2MiYE2koqobmRUesuJ2R4+TN8tHytZvopBhd
 7oNWaG6nlRLtkrTefQsV/qDIx/zYWN0M8S1QrA700A/j+PZLiyPQp/jbIRHRD8nizZ8X
 pR+DpPn4y7iriiMQ/4/aExf8pFZz7EMD/Qi2zKavN74ljaJQ85/f/N1sB4heMkTNR6a4
 7fYg==
X-Gm-Message-State: AGi0PuadvExCH6KFUQsy1T1MyO792EBV5Rx02aBEZmMh9C0S9YVXPtz+
 kLtAZXJdhvEtlRAh+7HAwHfYbQ==
X-Google-Smtp-Source: APiQypKnVlQo7Y1vutvcGSf2A5oq23tHZdydqy9HFBp8gsiIfPRT3HdwngbfzECoA6y6lCBu7COf+w==
X-Received: by 2002:ae9:f30f:: with SMTP id p15mr23756693qkg.178.1587516528359; 
 Tue, 21 Apr 2020 17:48:48 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id 60sm2867135qtb.95.2020.04.21.17.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 17:48:47 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Tue, 21 Apr 2020 21:48:44 -0300
Message-Id: <20200422004844.53284-1-vitor@massaru.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: masahiroy@kernel.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] um: ensure `make ARCH=um
	mrproper` removes arch/$(SUBARCH)/include/generated/
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

In this workflow:

$ make ARCH=um defconfig && make ARCH=um -j8
  [snip]
$ make ARCH=um mrproper
  [snip]
$ make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um
  [snip]
  CC      scripts/mod/empty.o
In file included from ../include/linux/types.h:6,
                 from ../include/linux/mod_devicetable.h:12,
                 from ../scripts/mod/devicetable-offsets.c:3:
../include/uapi/linux/types.h:5:10: fatal error: asm/types.h: No such file or directory
    5 | #include <asm/types.h>
      |          ^~~~~~~~~~~~~
compilation terminated.
make[2]: *** [../scripts/Makefile.build:100: scripts/mod/devicetable-offsets.s] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/home/iha/sdb/opensource/lkmp/linux-kselftest.git/Makefile:1140: prepare0] Error 2
make[1]: Leaving directory '/home/iha/sdb/opensource/lkmp/linux-kselftest.git/build_um'
make: *** [Makefile:180: sub-make] Error 2

The cause of the error was because arch/$(SUBARCH)/include/generated files
weren't properly cleaned by `make ARCH=um mrproper`.

Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
before out-of-tree build").
Reported-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
Tested-by: Brendan Higgins <brendanhiggins@google.com>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Link: https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ
---
v2:
 * Explains what this PATCH does and the importance as suggested
   by Brendan Higgins.
v3:
 * This problem only affects ARCH=um builds then arch/um/Makefile has
   been changed as suggested by Masahiro Yamada;
 * And with that the description has also been changed, and also to explain
   missing points and correct the tags as suggested by Masahiro Yamada:
   - Fix missing command `make ARCH=um mrproper`;
   - Add build error message; 
   - Add "Fixes" tag instead of "This bug was ...";
   - Add "Link" tag instead of "Related bug ...";
   - Add Reported-by and Suggested-by;
---
 arch/um/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index d2daa206872d..275f5ffdf6f0 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS) $(LD_FLAGS_CMDLINE)
 # When cleaning we don't include .config, so we don't include
 # TT or skas makefiles and don't clean skas_ptregs.h.
 CLEAN_FILES += linux x.i gmon.out
+MRPROPER_DIRS += arch/$(SUBARCH)/include/generated
 
 archclean:
 	@find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
