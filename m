Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F7EEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 10 Jul 2023 17:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5465281FE7;
	Mon, 10 Jul 2023 17:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5465281FE7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HZHn1KNn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7vdepGnim1ZG; Mon, 10 Jul 2023 17:18:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E5E3E81FC4;
	Mon, 10 Jul 2023 17:18:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E5E3E81FC4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC004C0071;
	Mon, 10 Jul 2023 17:18:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1848DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFFEF60D8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFFEF60D8E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=HZHn1KNn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0VF40JKZe6j
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:18:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D6B60701
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D6B60701
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 17:18:23 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1b8b310553bso78123525ad.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 10 Jul 2023 10:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689009503; x=1691601503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=fd/jFas9/ddzumuFsCZwyFQrGgcdAN+2PgNZn7yYwbs=;
 b=HZHn1KNnwtlwZlFd6Ii4kJHwRN+NGBxoXT1n1dT81haL6YarEviPWZbKtjhzZSnjN7
 erHlPXj+HCaoPSzrPsj9vsQMctRr4jEIpDf1CjgVEwXsX5fwNiH2UBQohG3NM8PEZBqh
 EHEJMv9zTh0sOz9A7pTORVZx/Alp3jGIFoH22wRA33EKvfXSlBWCWxL5RIR4el5h/PFV
 l3C+nQO67xAIUmEj9H4JuCm4LRw284EI70aORw3vvNVoQZmRSGjIZkkWXCsQ2HyZyZRn
 bpO+jJxinv3Ud4CMSG4Dc90Prq4l81iqk1l5SNrtNghxI2KD8ORmcWFHjBUB/pKToEwM
 XfFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689009503; x=1691601503;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fd/jFas9/ddzumuFsCZwyFQrGgcdAN+2PgNZn7yYwbs=;
 b=RXddOeEFaekDacOtaqJc/gb2LAwEHFER0yXYD4vgaRZYoPe0eAbartv25SKcroeCZg
 ECAv37C+89Ofj4Sbu2iN2n/hrsf/QjVzyZQUhl5a3uzGyUShhBWTrkFjdswycXC2M6Y9
 2Gmex+uM7jnlPmtNyo4BhBp9OmeVaWsnTbGynbUYQL7JCJ+6Py6tPaVDRSIm3uE+2oOp
 Pb5Dbky8ihvcdvPzwuurZs4NNI84yBK1P1kPgkQeb125UizhaSoAUTCzcEGrt+y63EAH
 lr8pR6YXlrxSvGlmPZ+ExGSfouUmcb2Kcq8tD2j6eUGkh95m/Tvm/mBc3k0iJSvTUN1z
 U8DQ==
X-Gm-Message-State: ABy/qLZie99cEe5TjmX9t94AX9Vy06efMNtloQOTIfVvo7vD6/5jy12Q
 2vFLnuki0YT0akbETDwCnkSw18U=
X-Google-Smtp-Source: APBJJlHvVrDz1g2oRDm9FKijVnJKD+Wp8/adNeEDp2lT19t1t4+ySQ4RmAmWW2rMUH0hpqVW5eLRl4Y=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:e9d4:b0:1a2:3436:4119 with SMTP id
 20-20020a170902e9d400b001a234364119mr12697223plk.8.1689009503485; Mon, 10 Jul
 2023 10:18:23 -0700 (PDT)
Date: Mon, 10 Jul 2023 10:18:21 -0700
In-Reply-To: <2b48be65-5f63-4658-38cb-03c00c10fdf3@gmail.com>
Mime-Version: 1.0
References: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
 <ZKcDdIYOUQuPP5Px@google.com> <51aa1dd7-86d0-ed08-1142-f229513ad316@gmail.com>
 <ZKhC9G5ouGOviSOG@google.com> <2b48be65-5f63-4658-38cb-03c00c10fdf3@gmail.com>
Message-ID: <ZKw9XQGOza6qGDLf@google.com>
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

On 07/09, Anh Tuan Phan wrote:
> I updated the patch to reflect your suggestion. Thank you!

In the future, can you please post a new one with v+1 instead of replying
to the old one? Thx!

> On 7/7/23 23:53, Stanislav Fomichev wrote:
> > On 07/07, Anh Tuan Phan wrote:
> >>
> >>
> >> On 7/7/23 01:09, Stanislav Fomichev wrote:
> >>> On 07/06, Anh Tuan Phan wrote:
> >>>> This commit fixes a few compilation issues when building out of source
> >>>> tree. The command that I used to build samples/bpf:
> >>>>
> >>>> export KBUILD_OUTPUT=/tmp
> >>>> make V=1 M=samples/bpf
> >>>>
> >>>> The compilation failed since it tried to find the header files in the
> >>>> wrong places between output directory and source tree directory
> >>>>
> >>>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> >>>> ---
> >>>>  samples/bpf/Makefile        | 8 ++++----
> >>>>  samples/bpf/Makefile.target | 2 +-
> >>>>  2 files changed, 5 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> >>>> index 615f24ebc49c..32469aaa82d5 100644
> >>>> --- a/samples/bpf/Makefile
> >>>> +++ b/samples/bpf/Makefile
> >>>> @@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
> >>>>  # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
> >>>>  # TPROGS_CFLAGS causes conflicts
> >>>>  XDP_SAMPLE_CFLAGS += -Wall -O2 \
> >>>> -		     -I$(src)/../../tools/include \
> >>>> +		     -I$(srctree)/tools/include \
> >>>
> >>> [..]
> >>>
> >>>>  		     -I$(src)/../../tools/include/uapi \
> >>>
> >>> Does this $(src) need to be changed as well?
> >>
> >> I think this line doesn't affect the build. I removed it and it still
> >> compiles (after "make -C samples/bpf clean"). I guess xdp_sample_user.c
> >> doesn't include any file in tools/include/uapi. Am I missing something
> >> or should I remove this line?
> > 
> > You might have these headers installed on your system already if
> > it compiles without this part. So I'd keep this part but do
> > s/src/srctree/ (and remove ../..).
> > 
> >>>
> >>>
> >>>>  		     -I$(LIBBPF_INCLUDE) \
> >>>> -		     -I$(src)/../../tools/testing/selftests/bpf
> >>>> +		     -I$(srctree)/tools/testing/selftests/bpf
> >>>>
> >>>>  $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
> >>>>  $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
> >>>> @@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
> >>>>  $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h
> >>>> $(src)/xdp_sample_shared.h
> >>>>  	@echo "  CLANG-BPF " $@
> >>>>  	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
> >>>> -		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
> >>>> +		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
> >>>>  		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
> >>>>  		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
> >>>>  		-c $(filter %.bpf.c,$^) -o $@
> >>>> @@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o
> >>>> xdp_sample.bpf.o
> >>>>
> >>>>  LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach
> >>>> skel,$(LINKED_SKELS),$($(skel)-deps)))
> >>>>
> >>>> -BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
> >>>> +BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
> >>>>  BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
> >>>>  BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))
> >>>>
> >>>> diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
> >>>> index 7621f55e2947..86a454cfb080 100644
> >>>> --- a/samples/bpf/Makefile.target
> >>>> +++ b/samples/bpf/Makefile.target
> >>>> @@ -41,7 +41,7 @@ _tprogc_flags   = $(TPROGS_CFLAGS) \
> >>>>                   $(TPROGCFLAGS_$(basetarget).o)
> >>>>
> >>>>  # $(objtree)/$(obj) for including generated headers from checkin source
> >>>> files
> >>>
> >>> [..]
> >>>
> >>>> -ifeq ($(KBUILD_EXTMOD),)
> >>>> +ifneq ($(KBUILD_EXTMOD),)
> >>>
> >>> This parts seems to be copy-pasted all over the place in its 'ifeq'
> >>> form. What is it doing and why is it needed?
> >>>
> >>>>  ifdef building_out_of_srctree
> >>>>  _tprogc_flags   += -I $(objtree)/$(obj)
> >>>>  endif
> >>>> -- 
> >>>> 2.34.1
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
> 
> Change from the original patch
> 
> - Change "-I$(src)/../../tools/include/uapi" to
> "-I$(srctree)/tools/include/uapi"
> 
>  samples/bpf/Makefile        | 10 +++++-----
>  samples/bpf/Makefile.target |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 615f24ebc49c..cfc960b3713a 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
>  # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
>  # TPROGS_CFLAGS causes conflicts
>  XDP_SAMPLE_CFLAGS += -Wall -O2 \
> -		     -I$(src)/../../tools/include \
> -		     -I$(src)/../../tools/include/uapi \
> +		     -I$(srctree)/tools/include \
> +		     -I$(srctree)/tools/include/uapi \
>  		     -I$(LIBBPF_INCLUDE) \
> -		     -I$(src)/../../tools/testing/selftests/bpf
> +		     -I$(srctree)/tools/testing/selftests/bpf
> 
>  $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
>  $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
> @@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
>  $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h
> $(src)/xdp_sample_shared.h
>  	@echo "  CLANG-BPF " $@
>  	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
> -		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
> +		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
>  		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
>  		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
>  		-c $(filter %.bpf.c,$^) -o $@
> @@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o
> xdp_sample.bpf.o
> 
>  LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach
> skel,$(LINKED_SKELS),$($(skel)-deps)))
> 
> -BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
> +BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
>  BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
>  BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))
> 
> diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
> index 7621f55e2947..86a454cfb080 100644
> --- a/samples/bpf/Makefile.target
> +++ b/samples/bpf/Makefile.target
> @@ -41,7 +41,7 @@ _tprogc_flags   = $(TPROGS_CFLAGS) \
>                   $(TPROGCFLAGS_$(basetarget).o)
> 
>  # $(objtree)/$(obj) for including generated headers from checkin source
> files

[..]

> -ifeq ($(KBUILD_EXTMOD),)
> +ifneq ($(KBUILD_EXTMOD),)
>  ifdef building_out_of_srctree
>  _tprogc_flags   += -I $(objtree)/$(obj)
>  endif

This question left undressed. Can you share more on why this change
is needed? Because it looks like it's actually needed for M='' case.
IOW, maybe we should add $(objtree)/$(obj) somewhere else?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
