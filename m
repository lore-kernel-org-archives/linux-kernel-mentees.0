Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8705C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:42:55 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4848A20838
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 18:42:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie6zixgX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4848A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5ABE872E8;
	Mon, 12 Oct 2020 18:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjiBZ3inaTGD; Mon, 12 Oct 2020 18:42:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E79087231;
	Mon, 12 Oct 2020 18:42:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04599C0052;
	Mon, 12 Oct 2020 18:42:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04C28C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E0DAB8623F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_qzqd6dP1Td
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:42:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 75BAC8623E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 18:42:51 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id w21so14332494pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 11:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c68FH0ayGziDihZ9IYbZBNMjx/y2IsXlW9Ldybbm4jU=;
 b=ie6zixgXJeTa6LHBerbXDBYBBNXGY2lUgcJxg3YweIzpWPNzPLKMhG+gD+ewRcglrM
 Sjvtw/TFUr2XUNjqd6rgulNzpTG226xhPwQ57kxnnMeyvscqWT523AIK9kYUDgIqkYj9
 k4ONBw4T1knBe+YoImKNG3lUzqrUrEeXO7C/dlyWjk1AS4OUR6xnKieDS3an+omlvd+x
 uFIiDJqWi4gKKoIWde0kfX1sqZqidYDU/WV9tn7EdCFLb00DXf3P/vPaotpMdZE+G9sC
 u/AqAL/+oTVh/3LdoRX8VFkB/hJP1UuenBgwYAyKYM6Q/XBCf2DsBKZSXL8V02RmP6tM
 elcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c68FH0ayGziDihZ9IYbZBNMjx/y2IsXlW9Ldybbm4jU=;
 b=eGXadCq8V2rIhjTcskQy7HejixBKK5EaOEY3LH9LEBzq/CCZl+2yxSCzKWbiZZLbNU
 Ry6BiKe1KBpTg2GgSQ+zqMYfMqa9yJ0q0wdZs1EsZ6wZoYDcDdnvvzrOkxbsLlXgz7EU
 gfuewpExIZtoCNgYzcXlGSsdMiXNCconYTpsE03ccF17IY6nL7da7KRkrNc1t2CEWbGb
 ctZMdRaJ9QyRrVCHFQjkZfvMUKJIrXmSoUnvcD2/7yvIjmtkNLkwKCYmhxzonJE7Mo60
 KKcG+oubijw59+adsay7IA77chQ6YZgrDqalssx9fnggX5oJUK9uT9oQMSB+NfRN8Zwo
 P8zw==
X-Gm-Message-State: AOAM530N2xiZM2wMhhsNSdrm6NqNCJLde7hlInOU+ns+5kB96ykhpM67
 SmdeEafJ11NNe9I732l3WuX6jXcYQz9zyi90
X-Google-Smtp-Source: ABdhPJxUl9gci4/N41y7sONJDgGFBjycbw30Mwd3jwVk5l13YuKgeIkuPnhxJyNVL46QE57cXsBv2w==
X-Received: by 2002:a17:90a:b64:: with SMTP id
 91mr21130861pjq.93.1602528170431; 
 Mon, 12 Oct 2020 11:42:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id f1sm19566915pfe.145.2020.10.12.11.42.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 11:42:49 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20201012170631.1241502-1-ujjwalkumar0501@gmail.com>
 <20201012170631.1241502-3-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2010122019410.17866@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <b4fdc7c5-8edf-3895-69fc-1bcf9efb5d4a@gmail.com>
Date: Tue, 13 Oct 2020 00:12:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010122019410.17866@felia>
Content-Language: en-US
Cc: Michal Marek <michal.lkml@markovi.net>, linux-ia64@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2 2/2] kbuild: use interpreters
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

On 12/10/20 11:50 pm, Lukas Bulwahn wrote:
> 
> 
> On Mon, 12 Oct 2020, Ujjwal Kumar wrote:
> 
>> We cannot rely on execute bits to be set on files in the repository.
>> The build script should use the explicit interpreter when invoking any
>> script from the repository.
>>
>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>
>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>> Suggested-by: Kees Cook <keescook@chromium.org>
>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>> ---
>>  Makefile                          | 4 ++--
>>  arch/arm64/kernel/vdso/Makefile   | 2 +-
>>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>>  arch/ia64/Makefile                | 4 ++--
>>  arch/nds32/kernel/vdso/Makefile   | 2 +-
>>  scripts/Makefile.build            | 2 +-
>>  scripts/Makefile.package          | 4 ++--
>>  7 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 0af7945caa61..df20e71dd7c8 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1256,7 +1256,7 @@ include/generated/utsrelease.h: include/config/kernel.release FORCE
>>  PHONY += headerdep
>>  headerdep:
>>  	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
>> -	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
>> +	$(PERL) $(srctree)/scripts/headerdep.pl -I$(srctree)/include
>>
>>  # ---------------------------------------------------------------------------
>>  # Kernel headers
>> @@ -1312,7 +1312,7 @@ PHONY += kselftest-merge
>>  kselftest-merge:
>>  	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
>>  	$(Q)find $(srctree)/tools/testing/selftests -name config | \
>> -		xargs $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>> +		xargs $(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(objtree)/.config
>>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>>
>>  # ---------------------------------------------------------------------------
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index edccdb77c53e..fb07804b7fc1 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -65,7 +65,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>  # Generate VDSO offsets using helper script
>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>
>>  include/generated/vdso-offsets.h: $(obj)/vdso.so.dbg FORCE
>>  	$(call if_changed,vdsosym)
>> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
>> index 7f96a1a9f68c..617c9ac58156 100644
>> --- a/arch/arm64/kernel/vdso32/Makefile
>> +++ b/arch/arm64/kernel/vdso32/Makefile
>> @@ -205,7 +205,7 @@ quiet_cmd_vdsomunge = MUNGE   $@
>>  gen-vdsosym := $(srctree)/$(src)/../vdso/gen_vdso_offsets.sh
>>  quiet_cmd_vdsosym = VDSOSYM $@
>>  # The AArch64 nm should be able to read an AArch32 binary
>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>
>>  # Install commands for the unstripped file
>>  quiet_cmd_vdso_install = INSTALL32 $@
>> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
>> index 703b1c4f6d12..86d42a2d09cb 100644
>> --- a/arch/ia64/Makefile
>> +++ b/arch/ia64/Makefile
>> @@ -27,8 +27,8 @@ cflags-y	:= -pipe $(EXTRA) -ffixed-r13 -mfixed-range=f12-f15,f32-f127 \
>>  		   -falign-functions=32 -frename-registers -fno-optimize-sibling-calls
>>  KBUILD_CFLAGS_KERNEL := -mconstant-gp
>>
>> -GAS_STATUS	= $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>> +GAS_STATUS	= $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> +KBUILD_CPPFLAGS += $(shell $(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> 
> Here is an instance of what Masahiro-san pointed out being wrong.
> 
> Ujjwal, will you send a v3?

Following is the quoted text from the reply mail from Masahiro

>> -GAS_STATUS     = $(shell $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> -KBUILD_CPPFLAGS += $(shell $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
>> +GAS_STATUS     = $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/check-gas "$(CC)" "$(OBJDUMP)")
>> +KBUILD_CPPFLAGS += $($(CONFIG_SHELL) $(srctree)/arch/ia64/scripts/toolchain-flags "$(CC)" "$(OBJDUMP)" "$(READELF)")
> 
> 
> 
> These changes look wrong to me.
> 
> $($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)
> 

From the above text, I understand as follows:

That my proposed change:
$(shell $(src...)    ->  $($(CONFIG_SHELL) $(src...)

is WRONG

and in the next line he suggested the required correction.
That being:
$($(CONFIG_SHELL)    ->  $(shell $(CONFIG_SHELL)

Which is in v2 of the patch series.

Lukas, please correct me if I'm wrong so that I can work on v3
if required.

Also, Nathan reviewed both the patches in v1 of this series. So,
should I be the one who adds his tag in next iterations?


Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
