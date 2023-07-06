Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F6FEB64D9
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  6 Jul 2023 18:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62C596112C;
	Thu,  6 Jul 2023 18:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62C596112C
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=AGeirDjq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hilaasdLEBP; Thu,  6 Jul 2023 18:10:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2646760F30;
	Thu,  6 Jul 2023 18:10:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2646760F30
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E20DC0071;
	Thu,  6 Jul 2023 18:10:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC64EC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7858F40250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7858F40250
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=AGeirDjq
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyrHwWM6WHI4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:09:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78FB64024C
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 78FB64024C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  6 Jul 2023 18:09:58 +0000 (UTC)
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1b8902f02a1so10109525ad.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 06 Jul 2023 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1688666998; x=1691258998;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=lJ63wvLyvqO6GZByAZoS5h4tDwkI077edGPkoK9X3Oc=;
 b=AGeirDjqFk8O+u8PU5EwhSx2Itp97lyqlROfCcRt953Ngx1fi5BtSYytJJIvNTkP0r
 V4ypYaYMZLBVaop+oEL2HPYpenbRjGzqNz3aZasx2PS8JVNFALKdQDUqTK0rw18AMN5X
 IUw8EMIo5ok//JOtI9bsou1K9FGES64kuDFptXOn8UTIwtOT8AO3Qqmnd64FJHUCTyWf
 Weo8wCGCBLGxEql/J9D0ywmCny+JVcuECXJhhJy3mtX4sUKIY8NQMf6jdY23UVfSygPS
 3ZDSn2vzjRWXBeCvsCGBymRp77MBNcwiQBrp+b2dzCcaCPyylt+GfoqcRcRbasTlYlXz
 To2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688666998; x=1691258998;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJ63wvLyvqO6GZByAZoS5h4tDwkI077edGPkoK9X3Oc=;
 b=SyvxAsxGmBd/+vbObOUJe45U13CSxfSTcrDCEX/mGk402RMwd/DWndPbLJEFJsVqsJ
 lVLfJs9p59qfWubRKXWHkj+5RCE/tDLm6rSKj+/6FYfVAv9DxB8rhZvXkLJ7sL5EYNKG
 etoIAv65C8Sk0fToE8urV9m/gZ1FqbjBZZkVI3RbEtzNpPFAjT1/z0dhxMecJCEKot4q
 c27GQt07lNajkR+OsrzdUoFJoypNIsDqLkZz3Xyg170NMX5HntDPoLrpDJTnz6w++g3I
 uNvJXzn3b++/uuTVX7WNZ2xXVg9Tvbpt+VUOgTpVDtCS6AevwSxvzSM2nAhXV85NMFL2
 2nXQ==
X-Gm-Message-State: ABy/qLa9zwscKlXZvOekwrWXv2dsvNn2rWEK+s5Jw+kypIJ1j/oXCBv2
 IHuFjCLY+V2w7wv7g2KZTlMQLG8=
X-Google-Smtp-Source: APBJJlG5TTlBvKSRC8RZNPmvckDrPxmKqvij30wDaGD63GSrkjyJwvvLwQylLUlY68hy0EITKPOtssY=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a17:902:d2cd:b0:1b8:929f:1990 with SMTP id
 n13-20020a170902d2cd00b001b8929f1990mr2319922plc.6.1688666997851; Thu, 06 Jul
 2023 11:09:57 -0700 (PDT)
Date: Thu, 6 Jul 2023 11:09:56 -0700
In-Reply-To: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
Mime-Version: 1.0
References: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
Message-ID: <ZKcDdIYOUQuPP5Px@google.com>
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

On 07/06, Anh Tuan Phan wrote:
> This commit fixes a few compilation issues when building out of source
> tree. The command that I used to build samples/bpf:
> 
> export KBUILD_OUTPUT=/tmp
> make V=1 M=samples/bpf
> 
> The compilation failed since it tried to find the header files in the
> wrong places between output directory and source tree directory
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
>  samples/bpf/Makefile        | 8 ++++----
>  samples/bpf/Makefile.target | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
> index 615f24ebc49c..32469aaa82d5 100644
> --- a/samples/bpf/Makefile
> +++ b/samples/bpf/Makefile
> @@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
>  # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
>  # TPROGS_CFLAGS causes conflicts
>  XDP_SAMPLE_CFLAGS += -Wall -O2 \
> -		     -I$(src)/../../tools/include \
> +		     -I$(srctree)/tools/include \

[..]

>  		     -I$(src)/../../tools/include/uapi \

Does this $(src) need to be changed as well?


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

This parts seems to be copy-pasted all over the place in its 'ifeq'
form. What is it doing and why is it needed?

>  ifdef building_out_of_srctree
>  _tprogc_flags   += -I $(objtree)/$(obj)
>  endif
> -- 
> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
