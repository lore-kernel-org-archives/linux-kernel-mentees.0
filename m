Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BF0EB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Jul 2023 16:53:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03EEA611DF;
	Fri,  7 Jul 2023 16:53:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03EEA611DF
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=O8UmPecX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rfu1Nc01ShW3; Fri,  7 Jul 2023 16:53:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CC80611E2;
	Fri,  7 Jul 2023 16:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CC80611E2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09976C0071;
	Fri,  7 Jul 2023 16:53:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A6CDC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F0CC82340
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F0CC82340
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=O8UmPecX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RRkj0Xvs5C3L
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:53:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 888AF8231C
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com
 [IPv6:2607:f8b0:4864:20::449])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 888AF8231C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 16:53:11 +0000 (UTC)
Received: by mail-pf1-x449.google.com with SMTP id
 d2e1a72fcca58-66700a28586so2763277b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688748791; x=1691340791;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=2q8/qxAfJs780ejd6xqOPrO4yijvMPBYqgkTx/lzTcw=;
 b=O8UmPecXiXz0zygYzf2d4/8hvCqdldGdkXuYbM71gC+Py+Tj+Q35pHzNuJp2azP8cs
 PaRokKXR6ETTiMRJh4F2+AcpFS1MWcP4DKxaTEpBZh3uZMonvmR1HUcDgbGXc+F1dxUy
 sAeMz08iFiVyqOMUgF5Nrf48XPvQ8WXOqanl9levQ43dbkEiG+TlM7zkaYdRAGHzpnXR
 ZIoo22vTYYwzHiRfAsXtLo0OTrzjxF77mSbP2Oygs8dDQuK1osKusCOdgLVspAfjAsgp
 Jpm7VhV3LDGXh5YmAW1IfFh4AJ3WUpmXzm8pbphsqeBbFdIGhIz3Yw1dRWhhxL5iEKTZ
 F11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688748791; x=1691340791;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2q8/qxAfJs780ejd6xqOPrO4yijvMPBYqgkTx/lzTcw=;
 b=ibXARADJpoogUT2WgjlkTwlykmWFcPlmNHCpe9cETBF3GQYjZAC5TU9I+McJv8CEFM
 6Zfa/BaHhEh9UM9pJaqSkHBK6pO3W5yU2KRuctDGA73CzGlQGueKR0A7NSW/MGJT7WCU
 9745v5BlqrXr8JIRhiMLyzjY456+v7bzZlSVdPZNGn6jtVvxGHkTpGjrEJVA2vYd04Q1
 dbycouQCjTzgUp7LlHlc1WKDD8WfAj9RRHv6foZ2Y8K60ObfJXCcOI/f4mb9EVlSofOD
 4beAII9aQSUXTm0VKr/bEAxrtLcHpqe5dcFLLZhDE4Jo1HO/vzdYcKsoSDQTJn2Uq7f3
 3bhA==
X-Gm-Message-State: ABy/qLZ9xHVqO6ck/O+ku4tAGknNQROgPl0ZYC5pptrBUOPSzvdliMLo
 aim10QyooTzijgWLkGZUrmy8ilg=
X-Google-Smtp-Source: APBJJlGEz+37vt3/DBhesdBi7M9Pd/WaAD/cNAuzlwzM5JkqIEz2y2g0In7UV55sePaDDVS2ZGXg+DM=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a05:6a00:2da0:b0:675:70d7:1eb0 with SMTP id
 fb32-20020a056a002da000b0067570d71eb0mr7563533pfb.6.1688748790731; Fri, 07
 Jul 2023 09:53:10 -0700 (PDT)
Date: Fri, 7 Jul 2023 09:53:08 -0700
In-Reply-To: <51aa1dd7-86d0-ed08-1142-f229513ad316@gmail.com>
Mime-Version: 1.0
References: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
 <ZKcDdIYOUQuPP5Px@google.com> <51aa1dd7-86d0-ed08-1142-f229513ad316@gmail.com>
Message-ID: <ZKhC9G5ouGOviSOG@google.com>
Subject: Re: [PATCH v1] samples/bpf: Fix build out of source tree
To: Anh Tuan Phan <tuananhlfc@gmail.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
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
From: Stanislav Fomichev via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 07/07, Anh Tuan Phan wrote:
> 
> 
> On 7/7/23 01:09, Stanislav Fomichev wrote:
> > On 07/06, Anh Tuan Phan wrote:
> >> This commit fixes a few compilation issues when building out of source
> >> tree. The command that I used to build samples/bpf:
> >>
> >> export KBUILD_OUTPUT=/tmp
> >> make V=1 M=samples/bpf
> >>
> >> The compilation failed since it tried to find the header files in the
> >> wrong places between output directory and source tree directory
> >>
> >> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> >> ---
> >>  samples/bpf/Makefile        | 8 ++++----
> >>  samples/bpf/Makefile.target | 2 +-
> >>  2 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> >> index 615f24ebc49c..32469aaa82d5 100644
> >> --- a/samples/bpf/Makefile
> >> +++ b/samples/bpf/Makefile
> >> @@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
> >>  # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
> >>  # TPROGS_CFLAGS causes conflicts
> >>  XDP_SAMPLE_CFLAGS += -Wall -O2 \
> >> -		     -I$(src)/../../tools/include \
> >> +		     -I$(srctree)/tools/include \
> > 
> > [..]
> > 
> >>  		     -I$(src)/../../tools/include/uapi \
> > 
> > Does this $(src) need to be changed as well?
> 
> I think this line doesn't affect the build. I removed it and it still
> compiles (after "make -C samples/bpf clean"). I guess xdp_sample_user.c
> doesn't include any file in tools/include/uapi. Am I missing something
> or should I remove this line?

You might have these headers installed on your system already if
it compiles without this part. So I'd keep this part but do
s/src/srctree/ (and remove ../..).

> > 
> > 
> >>  		     -I$(LIBBPF_INCLUDE) \
> >> -		     -I$(src)/../../tools/testing/selftests/bpf
> >> +		     -I$(srctree)/tools/testing/selftests/bpf
> >>
> >>  $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
> >>  $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
> >> @@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
> >>  $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h
> >> $(src)/xdp_sample_shared.h
> >>  	@echo "  CLANG-BPF " $@
> >>  	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
> >> -		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
> >> +		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
> >>  		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
> >>  		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
> >>  		-c $(filter %.bpf.c,$^) -o $@
> >> @@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o
> >> xdp_sample.bpf.o
> >>
> >>  LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach
> >> skel,$(LINKED_SKELS),$($(skel)-deps)))
> >>
> >> -BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
> >> +BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
> >>  BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
> >>  BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))
> >>
> >> diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
> >> index 7621f55e2947..86a454cfb080 100644
> >> --- a/samples/bpf/Makefile.target
> >> +++ b/samples/bpf/Makefile.target
> >> @@ -41,7 +41,7 @@ _tprogc_flags   = $(TPROGS_CFLAGS) \
> >>                   $(TPROGCFLAGS_$(basetarget).o)
> >>
> >>  # $(objtree)/$(obj) for including generated headers from checkin source
> >> files
> > 
> > [..]
> > 
> >> -ifeq ($(KBUILD_EXTMOD),)
> >> +ifneq ($(KBUILD_EXTMOD),)
> > 
> > This parts seems to be copy-pasted all over the place in its 'ifeq'
> > form. What is it doing and why is it needed?
> > 
> >>  ifdef building_out_of_srctree
> >>  _tprogc_flags   += -I $(objtree)/$(obj)
> >>  endif
> >> -- 
> >> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
