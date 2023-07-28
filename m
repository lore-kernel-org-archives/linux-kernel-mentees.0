Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A17C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 28 Jul 2023 00:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2D8241FC5;
	Fri, 28 Jul 2023 00:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2D8241FC5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=REo0Il8U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mp0G72iGd1yK; Fri, 28 Jul 2023 00:43:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5245D41F7C;
	Fri, 28 Jul 2023 00:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5245D41F7C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38A96C0072;
	Fri, 28 Jul 2023 00:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CB61C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A7E24019D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A7E24019D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=REo0Il8U
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DrhTTbrZBRoD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:43:51 +0000 (UTC)
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CF5E4015A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 28 Jul 2023 00:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CF5E4015A
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-3460815fde5so6590645ab.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Jul 2023 17:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690505030; x=1691109830;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y32l4Yp6o/svzuu2S4wlIEwwbL+0m62Hx+SdOq+tyJg=;
 b=REo0Il8UUkeLZKfo1guIi8uAcDiwqksio9C9/MayFrie4HZhBnsiD4WKHC+Y8prXOj
 cnc3jk/dKAXtzhrMVBeY4AnjfDlObg08DvgnLFjjkCySP5R21FqJ4HbJZnppxBryDh3i
 Lh8wB6rQk17nwxnpBB+UFpB5tLF3iF6nUiAZb6jdjXZOwDeRxQNurYR/mm/xkdIUvp5h
 UvfziVVrJ/kxbnKjeA8xV/BBFHjA2bFBVUXdqlbzojRTaaN2HGs6bq0UVQuPUkvKkXSK
 wOPzvj2gMcr+AA9TlwqIoa9BpwiphX87fY+4okjoAcxJDI5D4lgLL6d5vY533HoNXZEv
 Na5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690505030; x=1691109830;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Y32l4Yp6o/svzuu2S4wlIEwwbL+0m62Hx+SdOq+tyJg=;
 b=QWk/DfGV1VKHkuXH/6Ux9a3vxZjy9cFzU4SJ3nCtdE+D4Ln+R02zAQoRtqqmqKhqgw
 Hv+SIivlFy1Ie95o0fF+xCYpP8cDb2aDz+21TrwXwJR7qMAyyb0sz4Jtvst8leob30FY
 SerxKgtu/hejugC/UiJh4GS6q0CkiVJwe+wWvuwJjXWyPCPlukOA4m223i725fHGR/kd
 W0P+py7+/GNViXVSM2RVcrrNPLkWDvH2W5jBsdf7nBTelur+Ok+NywDxKuXAxlzBnZEj
 /JGZscoSQZu7eo66EPU2gdtA98m6eGGU35kzYM3gHO4XFMZEhrm/itsike8+x3KWNqRU
 +OKA==
X-Gm-Message-State: ABy/qLbRQbfZK2EOdgwvLBbl6CLZgdmgaZMj9UoNh4Hrir2fHDGCA/4H
 /tL/jkzm9c1VVn+N34MbwrE=
X-Google-Smtp-Source: APBJJlERbUurb1xofj6Y+TRIiqdjmEszz5BPXqdlVcxQWyZOK1JKo3y+20C3ypefHiLOQ+sJSA/tqw==
X-Received: by 2002:a05:6e02:1a05:b0:348:d52a:8f8 with SMTP id
 s5-20020a056e021a0500b00348d52a08f8mr1329011ild.25.1690505030234; 
 Thu, 27 Jul 2023 17:43:50 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a62e110000000b00686eeaab7ecsm2011029pfh.215.2023.07.27.17.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 17:43:49 -0700 (PDT)
Message-ID: <2ba1c076-f5bf-432f-50c1-72c845403167@gmail.com>
Date: Fri, 28 Jul 2023 07:43:46 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>, ast <ast@kernel.org>,
 daniel <daniel@iogearbox.net>, andrii <andrii@kernel.org>,
 "martin.lau" <martin.lau@linux.dev>
From: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: [PATCH v2] samples/bpf: Fix build out of source tree
Cc: bpf <bpf@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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
- Unconditionally add "-I $(objtree)/$(obj)" to _tprogc_flags and drop
  unnecessary part
Reference:
- v1:
https://lore.kernel.org/all/67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com/
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
index 7621f55e2947..d2fab959652e 100644
--- a/samples/bpf/Makefile.target
+++ b/samples/bpf/Makefile.target
@@ -38,14 +38,7 @@ tprog-cobjs	:= $(addprefix $(obj)/,$(tprog-cobjs))
 # Handle options to gcc. Support building with separate output directory

 _tprogc_flags   = $(TPROGS_CFLAGS) \
-                 $(TPROGCFLAGS_$(basetarget).o)
-
-# $(objtree)/$(obj) for including generated headers from checkin source
files
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
