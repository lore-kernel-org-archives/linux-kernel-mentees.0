Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181E6C001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 13:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72A164021D;
	Sun, 30 Jul 2023 13:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72A164021D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NipgZv6P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Txt4hcPFnbPK; Sun, 30 Jul 2023 13:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 13106401E1;
	Sun, 30 Jul 2023 13:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13106401E1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFDF3C0072;
	Sun, 30 Jul 2023 13:18:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B75F0C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 792F58184F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792F58184F
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=NipgZv6P
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8AxkFJltPHr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:18:09 +0000 (UTC)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82D3F8183D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 13:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82D3F8183D
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-686efb9ee3cso3534584b3a.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690723089; x=1691327889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DoKJbbiWl8hUg0Dy6YLVM9iQokjVlJ3D8prlTQfzCzg=;
 b=NipgZv6PiVltkSLreFuviTiDabA7maZ6wrCQ8AActBCPMzoNsHRKcJuD98lVWSDg/G
 1GqLvQo5oSPgaof8RVK+SvP2qhVfeQo8PGCdk/mKqcV7bjw91nPcqInkz1VKDvSIXcHG
 LlEv3jk1LQDLXoX3GyGduUm4ZRTrcybzDADzfO3d6pch3YrWXGzoyjEtiKjp+d/mcnPO
 xyEgZARbZlQhB4fkDcTJmTyvcB6L+GtgXRpGtA0eeCKGiy5hNuwF/7YmODZfI88PzKzY
 VYUqTSysDTDZqoTeNLJPEQeC+/B862LSm8LuGmvO9Ek8I0m9XK9IidFNbwZaJaqlIdwA
 cm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690723089; x=1691327889;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DoKJbbiWl8hUg0Dy6YLVM9iQokjVlJ3D8prlTQfzCzg=;
 b=XqXt0LY1x1hHPYHr13TYcesO5XyBvoYiVevuCr2UEqnj3qyzubL9iK8ZVS1xxsuXMx
 7xN4CvtetE3+qeaA63fU7+D8RqcMRxOMNTdsJGFoQ94It4xZ47xZ0lZWbNRbhT0ilS63
 SuTyP1KmVlyMXkrFvAbh78z2CkSJRTKLUFM5mWI78yphzxUaqxYFKKsYAwHxeC6QoW1z
 OZBdtN2QTJNDunqWujqAccndgthLfVy4vY/9JGh+N+l3DtArY7wDZVAqIPyXh+BaRK32
 GNaJ+I2oqLVQaZaemr+VQ+52BwVUdMm+nEh7j7HCrV/w5u8iLOdUfbRX/Ugnrn/D8S9i
 ny9Q==
X-Gm-Message-State: ABy/qLY/8F09zjryhUUS/8cOl5iASvSpGshR2/P8JdN30JJApCjD8JLy
 HZdO9CQX9Qq9kEXiDrTQh3k=
X-Google-Smtp-Source: APBJJlGxWL7Q6ft5ubK3ML9kE6ZI8AqfCONOxLIrr78jTbF4pjdiSSPx1VgbgZwRSVHQLa72iYD0Wg==
X-Received: by 2002:a05:6a00:23c8:b0:668:81c5:2f8d with SMTP id
 g8-20020a056a0023c800b0066881c52f8dmr8427462pfc.3.1690723088736; 
 Sun, 30 Jul 2023 06:18:08 -0700 (PDT)
Received: from pop-os.. ([222.252.65.171]) by smtp.gmail.com with ESMTPSA id
 2-20020aa79142000000b0067ab572c72fsm434727pfi.84.2023.07.30.06.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 06:18:08 -0700 (PDT)
From: Anh Tuan Phan <tuananhlfc@gmail.com>
To: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, sdf@google.com
Subject: [PATCH v3] samples/bpf: Fix build out of source tree
Date: Sun, 30 Jul 2023 20:17:50 +0700
Message-Id: <20230730131750.16552-1-tuananhlfc@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: bpf@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Anh Tuan Phan <tuananhlfc@gmail.com>
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
Changes from v1:
- Unconditionally add "-I $(objtree)/$(obj)" to _tprogc_flags and drop unnecessary part
Reference:
- v1: https://lore.kernel.org/all/67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com/
- v2: https://lore.kernel.org/all/2ba1c076-f5bf-432f-50c1-72c845403167@gmail.com/
---
 samples/bpf/Makefile        | 10 +++++-----
 samples/bpf/Makefile.target |  9 +--------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 615f24ebc49c..cfc960b3713a 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
 # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
 # TPROGS_CFLAGS causes conflicts
 XDP_SAMPLE_CFLAGS += -Wall -O2 \
-		     -I$(src)/../../tools/include \
-		     -I$(src)/../../tools/include/uapi \
+		     -I$(srctree)/tools/include \
+		     -I$(srctree)/tools/include/uapi \
 		     -I$(LIBBPF_INCLUDE) \
-		     -I$(src)/../../tools/testing/selftests/bpf
+		     -I$(srctree)/tools/testing/selftests/bpf
 
 $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
 $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
@@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
 $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h $(src)/xdp_sample_shared.h
 	@echo "  CLANG-BPF " $@
 	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
-		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
+		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
 		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
 		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
 		-c $(filter %.bpf.c,$^) -o $@
@@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o xdp_sample.bpf.o
 
 LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach skel,$(LINKED_SKELS),$($(skel)-deps)))
 
-BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
+BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
 BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
 BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))
 
diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
index 7621f55e2947..d2fab959652e 100644
--- a/samples/bpf/Makefile.target
+++ b/samples/bpf/Makefile.target
@@ -38,14 +38,7 @@ tprog-cobjs	:= $(addprefix $(obj)/,$(tprog-cobjs))
 # Handle options to gcc. Support building with separate output directory
 
 _tprogc_flags   = $(TPROGS_CFLAGS) \
-                 $(TPROGCFLAGS_$(basetarget).o)
-
-# $(objtree)/$(obj) for including generated headers from checkin source files
-ifeq ($(KBUILD_EXTMOD),)
-ifdef building_out_of_srctree
-_tprogc_flags   += -I $(objtree)/$(obj)
-endif
-endif
+                 -I $(objtree)/$(obj)
 
 tprogc_flags    = -Wp,-MD,$(depfile) $(_tprogc_flags)
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
