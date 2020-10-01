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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6EBC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:35:03 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6768D20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:35:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DISWrRHN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6768D20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0391A86916;
	Thu,  1 Oct 2020 19:35:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRNxwDkdejzk; Thu,  1 Oct 2020 19:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A3EA0868FB;
	Thu,  1 Oct 2020 19:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88842C016F;
	Thu,  1 Oct 2020 19:34:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D1C6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:34:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 047BD2725F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5ZaO8Z2WFXV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 4CB1F23039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:34:50 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t14so4806067pgl.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=9aGKR5Izut5cCTpEMTc/WIuC1PjDN/r9wnOGc6nJSOg=;
 b=DISWrRHNMOxKLBUQXTOSYl5/zqEohOK3eB41jt+rb1kC7ttHDFKozpdAAfH+cV4x4u
 3vWAUdLTreuGo+cJQe0N9u/Fja9TB74OHY3fup4wIIyAuHGGZCkG9px3zontcnl6+yxN
 1WvSsbIoMZYzwuti0RAmIGpjOba8CbYZ6ZpPpZ+akB+wMZ4vnaW6eEXiWgosnNfQjK6n
 ZXE0FS7qJJ2Sr7dQ3d6JgE+IX5cqL4tKjvF/aZ1JnulqfmIeYf8VYE8vPGGaFbs7fd0W
 eU99g13Ana93hsI3NtbZEM9yfIfbu8AmXNKUoXydl0M3jfZgh03IoHTxb/PEnkHdARKw
 cjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=9aGKR5Izut5cCTpEMTc/WIuC1PjDN/r9wnOGc6nJSOg=;
 b=UhfsRQUF43ZTAaXKIppQ+DFuQBnHjPFcuGPjWqeXyn5c2YKkR9Ugcl9N28VNj+3cO7
 snK9fB/YspEyCLRZzCLMygNPDczOorbzDz8qchWC3By2jst6+AXsOXab3WWpQ9Ga59qR
 hH6F7ejUZWUalP72wJrdUUnIm72zvQMFMTpxmIL+wf41cWJ5rn0Dhs9JfmLkqkjXQMjU
 1+X1y0Jz7mEWOLY4BmsXrlxgDls8YZbqkTWi5tbZ+haAaj8+jFuNnU45BDpQm8sOidKT
 sEEegQ4X1ILFkYhWOCM33/C+ilKZTF0V3+Xkwa2YvgPqezcgyIxJ2pmTpfBaYhnc01gZ
 QBHQ==
X-Gm-Message-State: AOAM5305OsgEoX/LbmxQROs5fJ589CUYPvMez3qhB6WUjpScoeapcJWp
 TPiFqKZ2QUrPbV2tJ2VFqYfTOmrGw/T6TA==
X-Google-Smtp-Source: ABdhPJwWuaxbks+R/cS2li1onsainp149B12/f01oHt9lfw28q1HzSO23f9Tbc2q/CgsIo0zgIrCAg==
X-Received: by 2002:aa7:941a:0:b029:142:2501:35d1 with SMTP id
 x26-20020aa7941a0000b0290142250135d1mr8819736pfo.49.1601580889194; 
 Thu, 01 Oct 2020 12:34:49 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id r1sm5867418pgl.66.2020.10.01.12.34.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 12:34:48 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <65a0d539-394c-49ca-41ca-44e079f8f2bf@gmail.com>
Date: Fri, 2 Oct 2020 01:04:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] selftests: kbuild: use
	interpreters to invoke scripts
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
 tools/testing/selftests/rcutorture/Makefile      |  2 +-
 tools/testing/selftests/rseq/Makefile            |  2 +-
 tools/testing/selftests/vm/Makefile              |  6 +++---
 tools/testing/selftests/wireguard/qemu/Makefile  |  4 ++--
 tools/testing/selftests/x86/Makefile             |  6 +++---
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/Makefile b/tools/testing/selftests/rcutorture/Makefile
index 5202dc666206..011a6990e8ac 100644
--- a/tools/testing/selftests/rcutorture/Makefile
+++ b/tools/testing/selftests/rcutorture/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0+
 all:
-	( cd ../../../..; tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
+	( cd ../../../..; $(CONFIG_SHELL) tools/testing/selftests/rcutorture/bin/kvm.sh --duration 10 --configs TREE01 )
diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 2af9d39a9716..6b0ae924cc7e 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -17,7 +17,7 @@ TEST_GEN_PROGS = basic_test basic_percpu_ops_test param_test \
 
 TEST_GEN_PROGS_EXTENDED = librseq.so
 
-TEST_PROGS = run_param_test.sh
+TEST_PROGS = $(CONFIG_SHELL) run_param_test.sh
 
 TEST_FILES := settings
 
diff --git a/tools/testing/selftests/vm/Makefile b/tools/testing/selftests/vm/Makefile
index 30873b19d04b..a67a19a36cde 100644
--- a/tools/testing/selftests/vm/Makefile
+++ b/tools/testing/selftests/vm/Makefile
@@ -40,9 +40,9 @@ TEST_GEN_FILES += userfaultfd
 TEST_GEN_FILES += khugepaged
 
 ifeq ($(ARCH),x86_64)
-CAN_BUILD_I386 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
-CAN_BUILD_X86_64 := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
-CAN_BUILD_WITH_NOPIE := $(shell ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
+CAN_BUILD_I386 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_32bit_program.c -m32)
+CAN_BUILD_X86_64 := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_64bit_program.c)
+CAN_BUILD_WITH_NOPIE := $(shell $(CONFIG_SHELL) ./../x86/check_cc.sh $(CC) ../x86/trivial_program.c -no-pie)
 
 TARGETS := protection_keys
 BINARIES_32 := $(TARGETS:%=%_32)
diff --git a/tools/testing/selftests/wireguard/qemu/Makefile b/tools/testing/selftests/wireguard/qemu/Makefile
index 4bdd6c1a19d3..d24f3efb2633 100644
--- a/tools/testing/selftests/wireguard/qemu/Makefile
+++ b/tools/testing/selftests/wireguard/qemu/Makefile
@@ -255,8 +255,8 @@ $(KERNEL_BUILD_PATH)/.config: kernel.config arch/$(ARCH).config
 	printf 'CONFIG_NR_CPUS=$(NR_CPUS)\nCONFIG_INITRAMFS_SOURCE="$(BUILD_PATH)/init-cpio-spec.txt"\n' >> $(KERNEL_BUILD_PATH)/minimal.config
 	cat arch/$(ARCH).config >> $(KERNEL_BUILD_PATH)/minimal.config
 	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) allnoconfig
-	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
-	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
+	cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config $(KERNEL_BUILD_PATH)/minimal.config
+	$(if $(findstring yes,$(DEBUG_KERNEL)),cp debug.config $(KERNEL_BUILD_PATH) && cd $(KERNEL_BUILD_PATH) && ARCH=$(KERNEL_ARCH) $(CONFIG_SHELL) $(KERNEL_PATH)/scripts/kconfig/merge_config.sh -n $(KERNEL_BUILD_PATH)/.config debug.config,)
 
 $(KERNEL_BZIMAGE): $(KERNEL_BUILD_PATH)/.config $(BUILD_PATH)/init-cpio-spec.txt $(MUSL_PATH)/lib/libc.so $(IPERF_PATH)/src/iperf3 $(IPUTILS_PATH)/ping $(BASH_PATH)/bash $(IPROUTE2_PATH)/misc/ss $(IPROUTE2_PATH)/ip/ip $(IPTABLES_PATH)/iptables/xtables-legacy-multi $(NMAP_PATH)/ncat/ncat $(WIREGUARD_TOOLS_PATH)/src/wg $(BUILD_PATH)/init ../netns.sh $(WIREGUARD_SOURCES)
 	$(MAKE) -C $(KERNEL_PATH) O=$(KERNEL_BUILD_PATH) ARCH=$(KERNEL_ARCH) CROSS_COMPILE=$(CROSS_COMPILE)
diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 6703c7906b71..eb2c1025def0 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -6,9 +6,9 @@ include ../lib.mk
 .PHONY: all all_32 all_64 warn_32bit_failure clean
 
 UNAME_M := $(shell uname -m)
-CAN_BUILD_I386 := $(shell ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
-CAN_BUILD_X86_64 := $(shell ./check_cc.sh $(CC) trivial_64bit_program.c)
-CAN_BUILD_WITH_NOPIE := $(shell ./check_cc.sh $(CC) trivial_program.c -no-pie)
+CAN_BUILD_I386 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_32bit_program.c -m32)
+CAN_BUILD_X86_64 := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_64bit_program.c)
+CAN_BUILD_WITH_NOPIE := $(shell $(SHELL) ./check_cc.sh $(CC) trivial_program.c -no-pie)
 
 TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap_vdso \
 			check_initial_reg_state sigreturn iopl ioperm \
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
