Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4017C47423
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:43:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D74120759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:43:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBqMt+nJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D74120759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2023487388;
	Thu,  1 Oct 2020 19:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuTgycxhImh9; Thu,  1 Oct 2020 19:43:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 842D087386;
	Thu,  1 Oct 2020 19:43:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72EA6C016F;
	Thu,  1 Oct 2020 19:43:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1330C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9BF1C87387
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:42:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sFQT4IgffRPu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:42:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0C2E287386
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:42:53 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id kk9so2465045pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=5U9Z3gfL0bBLA7Q56k9zKtijE63sIgmucRUpQOLPbo4=;
 b=nBqMt+nJxc5kctNIoz5OidnPOm+8PIwab+qxC10Y2tSBxv5SeMLy+ydOA2+PDIHlnc
 lUpNOGQoR/ZKvMsl2p8FEUI6bQIi8TBbyUPinfCElND6xRGHMHEb6SgH6nh0r8+Karr3
 uI1YP6csb2elDr6MBFk5uJ9zKGeZwKbq1FiRiLx6iG7Fv88KIUP5dz1lwkMUS4a1hLLa
 zFgWyPqIiR2OQEFly2oOvOzOOE5Fm6pSHoGAJxBSu6jlmQ2Oew+0ieVrbkvo0hPUCzjJ
 /OT1X6wA5yxheYY3yyQ/MBB+JPjCaX9uo+idq4ITY2figjmfCY4pgKsDxClVyv18bnyL
 025A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=5U9Z3gfL0bBLA7Q56k9zKtijE63sIgmucRUpQOLPbo4=;
 b=sBY7Gy2SmSIF8ESntPjqnKDB7V9L5ipKk50HxMrZVygK1LJILp6Qh+V6qfqHGirg1X
 +rlsjHwMKqlqr7zo4ZWwbgSa3SEvSNqCF/nxkfrANYL1Fwa7ffWizrLBcN/wgK37LxgR
 bhr2AzGUHk0FCIkLU2YQFv6ywMqYVABdIULXboH4K4mBHp1rqrsl5mkFAqCBdR602CaY
 HagtkndcgEJebwc0D2c6Hn5tMSRYlsCjPC0g3+HJNNGAObL3FNa55OsonAIZmIeMMJIU
 dWbHAO74adUpD0z+oAW8VAK60/OWdPCQnrs81oN+y2cb1hFW52z1g/0FUXadtdJzM3O6
 gDdg==
X-Gm-Message-State: AOAM531tRgheFCP+0BW6tYnQiUFPwEwLwQj+09gdGg52Mt3XmBXsaYwu
 QISaLZfnKAfr1SWeP9BF+FjiDEZEB+Jm0w==
X-Google-Smtp-Source: ABdhPJypedxnPSVYdqq6BhNnGmaLWW2OgFAHaqT0I9FqFtnB6xx+jvoBxHVJgjtLE15tUDsFbQK4Xg==
X-Received: by 2002:a17:90b:3109:: with SMTP id
 gc9mr1517585pjb.74.1601581372065; 
 Thu, 01 Oct 2020 12:42:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id e123sm7414543pfh.167.2020.10.01.12.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 12:42:51 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <d860ed8f-ef17-acd8-00ef-0a496f4cbc35@gmail.com>
Date: Fri, 2 Oct 2020 01:12:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] tools: kbuild: use interpreters
	to invoke scripts
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

We cannot rely on execute bits to be set on files in the repository.
The build script should use the explicit interpreter when invoking any
script from the repository.

Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Suggested-by: Kees Cook <keescook@chromium.org>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 tools/bootconfig/Makefile                        |  2 +-
 tools/bpf/Makefile.helpers                       |  2 +-
 tools/lib/bpf/Makefile                           |  2 +-
 tools/perf/Makefile.perf                         |  2 +-
 tools/power/cpupower/Makefile                    |  2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index da5975775337..b6aee03a6ca9 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -21,7 +21,7 @@ $(OUTPUT)bootconfig: main.c $(LIBSRC)
 	$(CC) $(filter %.c,$^) $(CFLAGS) -o $@
 
 test: $(ALL_PROGRAMS) test-bootconfig.sh
-	./test-bootconfig.sh $(OUTPUT)
+	$(CONFIG_SHELL) ./test-bootconfig.sh $(OUTPUT)
 
 install: $(ALL_PROGRAMS)
 	install $(OUTPUT)bootconfig $(DESTDIR)$(bindir)
diff --git a/tools/bpf/Makefile.helpers b/tools/bpf/Makefile.helpers
index 854d084026dd..6f2b042ff719 100644
--- a/tools/bpf/Makefile.helpers
+++ b/tools/bpf/Makefile.helpers
@@ -35,7 +35,7 @@ man7: $(DOC_MAN7)
 RST2MAN_DEP := $(shell command -v rst2man 2>/dev/null)
 
 $(OUTPUT)$(HELPERS_RST): $(UP2DIR)../../include/uapi/linux/bpf.h
-	$(QUIET_GEN)$(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
+	$(QUIET_GEN)$(PYTHON3) $(UP2DIR)../../scripts/bpf_helpers_doc.py --filename $< > $@
 
 $(OUTPUT)%.7: $(OUTPUT)%.rst
 ifndef RST2MAN_DEP
diff --git a/tools/lib/bpf/Makefile b/tools/lib/bpf/Makefile
index f43249696d9f..8a3f7399568f 100644
--- a/tools/lib/bpf/Makefile
+++ b/tools/lib/bpf/Makefile
@@ -179,7 +179,7 @@ $(BPF_IN_STATIC): force elfdep zdep bpfdep $(BPF_HELPER_DEFS)
 	$(Q)$(MAKE) $(build)=libbpf OUTPUT=$(STATIC_OBJDIR)
 
 $(BPF_HELPER_DEFS): $(srctree)/tools/include/uapi/linux/bpf.h
-	$(QUIET_GEN)$(srctree)/scripts/bpf_helpers_doc.py --header \
+	$(QUIET_GEN)$(PYTHON3) $(srctree)/scripts/bpf_helpers_doc.py --header \
 		--file $(srctree)/tools/include/uapi/linux/bpf.h > $(BPF_HELPER_DEFS)
 
 $(OUTPUT)libbpf.so: $(OUTPUT)libbpf.so.$(LIBBPF_VERSION)
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 6031167939ae..42f797e541d0 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -229,7 +229,7 @@ goals := $(filter-out all sub-make, $(MAKECMDGOALS))
 $(goals) all: sub-make
 
 sub-make: fixdep
-	@./check-headers.sh
+	$(Q)$(SHELL) ./check-headers.sh
 	$(Q)$(MAKE) FIXDEP=1 -f Makefile.perf $(goals)
 
 else # force_fixdep
diff --git a/tools/power/cpupower/Makefile b/tools/power/cpupower/Makefile
index c7bcddbd486d..b683e774f5e3 100644
--- a/tools/power/cpupower/Makefile
+++ b/tools/power/cpupower/Makefile
@@ -51,7 +51,7 @@ DESTDIR ?=
 # Package-related definitions. Distributions can modify the version
 # and _should_ modify the PACKAGE_BUGREPORT definition
 
-VERSION:=			$(shell ./utils/version-gen.sh)
+VERSION:=			$($(CONFIG_SHELL) ./utils/version-gen.sh)
 LIB_MAJ=			0.0.1
 LIB_MIN=			0
 
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
