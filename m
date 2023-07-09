Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F7FEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Jul 2023 05:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BB860BE7;
	Sun,  9 Jul 2023 05:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2BB860BE7
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fVEyg/oJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5KNyTVLyD8O; Sun,  9 Jul 2023 05:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4164760BA9;
	Sun,  9 Jul 2023 05:12:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4164760BA9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27002C0072;
	Sun,  9 Jul 2023 05:12:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D6A7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 05:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1318581E1B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 05:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1318581E1B
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fVEyg/oJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZgGChLPqTP3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 05:12:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE9581E15
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AE9581E15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 05:12:36 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-517bdc9e81dso1159812a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 08 Jul 2023 22:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688879555; x=1691471555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TNF19ZMVxPJxD4f7WudQdS1jVPLGXr8B+mLMhECWzsc=;
 b=fVEyg/oJHqCRwBhmhCApjYwZfoaRWvciDV6nxC13Y/vHNGEQnv6wugFL+KG8RUVRC9
 S9QxOG8IxuaP/GNjV2mGeNngwn364pSSi+y00HgLoJyYMQmmyFRAk4fhNXSkdg3/eA/A
 7f65lzv5Px5CZuMmup/pitzuwrakBakRygoDBSyb2xqFnJK15NEHxtlf/Bd8z8FHDXND
 OXfMt8yqbjXcoPw6RCRmKO+EckIGUWpN0HRK9n9NSgWDNMpQvq9R0vBDKN3HlEmc7bPe
 YmwzySw1/yh0a0P/GzFqL68nMXxgaDjkzhuqn0hv1sAwnXZbnqudoESUzu50tlQLhOrN
 0Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688879555; x=1691471555;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TNF19ZMVxPJxD4f7WudQdS1jVPLGXr8B+mLMhECWzsc=;
 b=W7XvDFLlttohYI1rCWDkSlJVED8aHYhQLdqbJ3nyLE8Hhx4KF4VX6J3etSoOvIe0H1
 3DOi/c+wQPlraiFTGpnnw4l7Wpm9sKKhxiHFZYX02UiTZKByvpiugc0lCSGvLAgp2Lzu
 Gc6MlFDNaHHq+KPydhJkfiacDILtjLIci0tL7TjOZGWCjDEHVoonuAhwxYy6utrWDRJ0
 uw7iIZ0S4os6hO2/bIIlPcEQF5zV6uxTnaNuxUrt/yySlSbqH8Lof4iNoiRoblhD4nQ5
 qD9XB4YPhpDnM3OOJQ1GZ+mb53ikkKDkvew9/OVMXRd9qIAJQBh1RnTf/XnrbIB9eLx8
 ahVQ==
X-Gm-Message-State: ABy/qLbjlNGB4DKa4J/wCTuHh+AV4ek25b1uyDzErjI2UIdavKOz+RD+
 L0AEMfLfBb3gKiq7NZ22CJ0=
X-Google-Smtp-Source: APBJJlEqXwMw0x/zBgTyLTWou0rNKbY1GbIW53YQpZ05waizLgLQmHoAwMEXgp/OD5B9czGx3ieG1g==
X-Received: by 2002:a17:903:260e:b0:1b8:7483:d488 with SMTP id
 jd14-20020a170903260e00b001b87483d488mr6624432plb.57.1688879555469; 
 Sat, 08 Jul 2023 22:12:35 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a17090acc0600b00263b4b1255esm3752018pju.51.2023.07.08.22.12.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Jul 2023 22:12:35 -0700 (PDT)
Message-ID: <38ff5cf8-0f71-a156-d88b-e3ec74897790@gmail.com>
Date: Sun, 9 Jul 2023 12:12:31 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1] samples/bpf: Fix build out of source tree
To: Stanislav Fomichev <sdf@google.com>
References: <67bec6a9-af59-d6f9-2630-17280479a1f7@gmail.com>
 <ZKcDdIYOUQuPP5Px@google.com>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <ZKcDdIYOUQuPP5Px@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Adding one more discussion around your previous question that I missed.

On 7/7/23 01:09, Stanislav Fomichev wrote:
> On 07/06, Anh Tuan Phan wrote:
>> This commit fixes a few compilation issues when building out of source
>> tree. The command that I used to build samples/bpf:
>>
>> export KBUILD_OUTPUT=/tmp
>> make V=1 M=samples/bpf
>>
>> The compilation failed since it tried to find the header files in the
>> wrong places between output directory and source tree directory
>>
>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>> ---
>>  samples/bpf/Makefile        | 8 ++++----
>>  samples/bpf/Makefile.target | 2 +-
>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
>> index 615f24ebc49c..32469aaa82d5 100644
>> --- a/samples/bpf/Makefile
>> +++ b/samples/bpf/Makefile
>> @@ -341,10 +341,10 @@ $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
>>  # Override includes for xdp_sample_user.o because $(srctree)/usr/include in
>>  # TPROGS_CFLAGS causes conflicts
>>  XDP_SAMPLE_CFLAGS += -Wall -O2 \
>> -		     -I$(src)/../../tools/include \
>> +		     -I$(srctree)/tools/include \
> 
> [..]
> 
>>  		     -I$(src)/../../tools/include/uapi \
> 
> Does this $(src) need to be changed as well?
> 
> 
>>  		     -I$(LIBBPF_INCLUDE) \
>> -		     -I$(src)/../../tools/testing/selftests/bpf
>> +		     -I$(srctree)/tools/testing/selftests/bpf
>>
>>  $(obj)/$(XDP_SAMPLE): TPROGS_CFLAGS = $(XDP_SAMPLE_CFLAGS)
>>  $(obj)/$(XDP_SAMPLE): $(src)/xdp_sample_user.h $(src)/xdp_sample_shared.h
>> @@ -393,7 +393,7 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
>>  $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h
>> $(src)/xdp_sample_shared.h
>>  	@echo "  CLANG-BPF " $@
>>  	$(Q)$(CLANG) -g -O2 -target bpf -D__TARGET_ARCH_$(SRCARCH) \
>> -		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
>> +		-Wno-compare-distinct-pointer-types -I$(obj) -I$(srctree)/include \
>>  		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
>>  		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
>>  		-c $(filter %.bpf.c,$^) -o $@
>> @@ -412,7 +412,7 @@ xdp_router_ipv4.skel.h-deps := xdp_router_ipv4.bpf.o
>> xdp_sample.bpf.o
>>
>>  LINKED_BPF_SRCS := $(patsubst %.bpf.o,%.bpf.c,$(foreach
>> skel,$(LINKED_SKELS),$($(skel)-deps)))
>>
>> -BPF_SRCS_LINKED := $(notdir $(wildcard $(src)/*.bpf.c))
>> +BPF_SRCS_LINKED := $(notdir $(wildcard $(srctree)/$(src)/*.bpf.c))
>>  BPF_OBJS_LINKED := $(patsubst %.bpf.c,$(obj)/%.bpf.o, $(BPF_SRCS_LINKED))
>>  BPF_SKELS_LINKED := $(addprefix $(obj)/,$(LINKED_SKELS))
>>
>> diff --git a/samples/bpf/Makefile.target b/samples/bpf/Makefile.target
>> index 7621f55e2947..86a454cfb080 100644
>> --- a/samples/bpf/Makefile.target
>> +++ b/samples/bpf/Makefile.target
>> @@ -41,7 +41,7 @@ _tprogc_flags   = $(TPROGS_CFLAGS) \
>>                   $(TPROGCFLAGS_$(basetarget).o)
>>
>>  # $(objtree)/$(obj) for including generated headers from checkin source
>> files
> 
> [..]
> 
>> -ifeq ($(KBUILD_EXTMOD),)
>> +ifneq ($(KBUILD_EXTMOD),)
> 
> This parts seems to be copy-pasted all over the place in its 'ifeq'
> form. What is it doing and why is it needed?

Sorry for missing this question. As I understand KBUILD_EXTMOD
corresponding to external module. In my case, it's $M=samples/bpf. I
don't really know why it's needed here.

> 
>>  ifdef building_out_of_srctree
>>  _tprogc_flags   += -I $(objtree)/$(obj)
>>  endif
>> -- 
>> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
