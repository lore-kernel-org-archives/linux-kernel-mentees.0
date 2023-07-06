Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D487EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 15:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE99060F6E;
	Thu,  6 Jul 2023 15:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE99060F6E
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=hT0Hir0i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sTe1tVTVfYGY; Thu,  6 Jul 2023 15:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 76AAF60A4F;
	Thu,  6 Jul 2023 15:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76AAF60A4F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52C21C0072;
	Thu,  6 Jul 2023 15:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E511C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0909440012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:26:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0909440012
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hT0Hir0i
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4c5SW5eq6M-B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:26:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6324440A76
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6324440A76
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 15:26:03 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-55be1ce1669so496524a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 08:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688657163; x=1691249163;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=naq3nXH3JnI0iCRMysYX4z2gUezeFgxv5TLSzOREpHo=;
 b=hT0Hir0ihbJbkAxVAiZkTCGWQRr1oVvRH8qwo0fc9hcBbCsC9i+bYM2rfu+eoIjDPP
 2U9IKhnIur5G2BIPFKPrZjX7zFWM4NE6Xvy+ajOoR/p6eYL/zHbsSIyaN/ihgs82eEih
 bVgkw0Y1kOYdg3VXQMJz/O9fQE9ZWIiDABPBw0KNRVLD9l4RTHrplgPFeAJh4WRXTXKb
 u56qTayTALvfhbcDvVVQeasp70iAuBgQfEaPEwvfW0YZlMOP9fQBg2VTgRjYd0u6jKUM
 1/SxoqU8o0ehFCalFirLTcSgZyBsJQ36K7yMsx8Q1K3lS74URqLw5aN2KiTQl91Ag7F7
 h7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688657163; x=1691249163;
 h=content-transfer-encoding:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=naq3nXH3JnI0iCRMysYX4z2gUezeFgxv5TLSzOREpHo=;
 b=AcoALOYCYfZZp0J1xMoBGSG6pBfFvF6Q1SU5FL30UR6D0Ve27BYFUZ5Wg7OP/rsZ0v
 pSU8JBUbcaDtyaEhhan7xmxB55UpRHTb4MqhP6VLiHiz2OnwfqJj1l8MjUWUpouaJMcJ
 1okTz1aTKOcwLcmniZ7JUT4XP4ym9kMoUJOLjP/pcomdOBujULmFHMprd4GdqQXbYssR
 7lumkmshdnCBGtp4WCmaK2raFU+z/QjeTR+IRDP+zQQFdRD4BAnby+3fvpsbyrX1stk6
 xJpvtSUhqNP8H7itL8df8dUXx/+LQRV53r2GcXfbsAWR9I9AkyXdgvHmuUyGDAmZomaf
 qrVA==
X-Gm-Message-State: ABy/qLaGVJ8rLniCDph7OXtPKKh8nKCQu16oUQ87ZJ3WOYUKAs45qVdd
 K9/esm5Z9IlgywNSlm3uGO0=
X-Google-Smtp-Source: APBJJlGv0ZAt5DVFFDjDjatFYonNjvshPg4oV9Pm7JqRungl0a78MrsHHUmiqYRYZOuJ+X8nQXiHjA==
X-Received: by 2002:a05:6a20:1050:b0:12e:ba2:7283 with SMTP id
 gt16-20020a056a20105000b0012e0ba27283mr1483332pzc.24.1688657162429; 
 Thu, 06 Jul 2023 08:26:02 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 z15-20020a65610f000000b0052871962579sm1315340pgu.63.2023.07.06.08.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:26:02 -0700 (PDT)
Message-ID: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
Date: Thu, 6 Jul 2023 22:25:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: [PATCH v1] samples/bpf: Fix build out of source tree
To: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev,
 linux-kernel-mentees@lists.linuxfoundation.org
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

This commit fixes a few compilation issues when building out of source
tree. The command that I used to build samples/bpf:

export KBUILD_OUTPUT=/tmp
make V=1 M=samples/bpf

The compilation failed since it tried to find the header files in the
wrong places between output directory and source tree directory

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 samples/bpf/Makefile        | 8 ++++----
 samples/bpf/Makefile.target | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 615f24ebc49c..32469aaa82d5 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
 # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
 # TPROGS_CFLAGS causes conflicts
 XDP_SAMPLE_CFLAGS += -Wall -O2 \
-		     -I$(src)/../../tools/include \
+		     -I$(srctree)/tools/include \
 		     -I$(src)/../../tools/include/uapi \
 		     -I$(LIBBPF_INCLUDE) \
-		     -I$(src)/../../tools/testing/selftests/bpf
+		     -I$(srctree)/tools/testing/selftests/bpf

 $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
 $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
@@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
 $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h
$(src)/xdp_sample_shared.h
 	@echo "  CLANG-BPF " $@
 	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
-		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
+		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
 		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
 		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
 		-c $(filter %.bpf.c,$^) -o $@
@@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o
xdp_sample.bpf.o

 LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach
skel,$(LINKED_SKELS),$($(skel)-deps)))

-BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
+BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
 BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
 BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))

diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
index 7621f55e2947..86a454cfb080 100644
--- a/samples/bpf/Makefile.target
+++ b/samples/bpf/Makefile.target
@@ -41,7 +41,7 @@ _tprogc_flags   = $(TPROGS_CFLAGS) \
                  $(TPROGCFLAGS_$(basetarget).o)

 # $(objtree)/$(obj) for including generated headers from checkin source
files
-ifeq ($(KBUILD_EXTMOD),)
+ifneq ($(KBUILD_EXTMOD),)
 ifdef building_out_of_srctree
 _tprogc_flags   += -I $(objtree)/$(obj)
 endif
-- 
2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
