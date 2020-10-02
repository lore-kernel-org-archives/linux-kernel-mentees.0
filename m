Return-Path: <SRS0=/4fU=DJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D19C4363D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 07:10:58 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B394206DD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Oct 2020 07:10:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDo0e4qP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B394206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE390872FC;
	Fri,  2 Oct 2020 07:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Hevv8xJHDiE; Fri,  2 Oct 2020 07:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 399F1872E8;
	Fri,  2 Oct 2020 07:10:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26321C016F;
	Fri,  2 Oct 2020 07:10:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB7FBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 07:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7B005204EB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 07:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8b-3lkXFQL2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 07:10:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 753E4204E9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Oct 2020 07:10:51 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l126so627223pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 02 Oct 2020 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K9E/KhcVkGDbrTe0qhdrF1Fjf3jcgJVTpPUCQ8YCemU=;
 b=VDo0e4qPKkYcvaUVi+PC5KUbItfsg1LPrpZd7ptJAnTpj+nJpplxFU38Y1tdNW8o/P
 EFjTRUws1p45iWi+lRAb6zuHqE1IhmBdkVbm8cfg5eJrY2qO8u7GXy8cZ2WMU0GO9+2V
 LusHnbruEj2yIpN5S6fLOUzA/3QxuwjFaplOKg4gZx/tYkP7+3/xYuFvgzi+80wseW84
 msOqQThBvnQ7cdqJ0TDWNVcbrjPTuYQGHVx/+JTrvUsDp6XZnIHs41YE6FTI87Ns58y4
 bRnF6aTGUpNmGPZO5Dtqmc6eWZdZ1rqnYCJTvyMlKFwhj8hq2RzpLMfIEk0AqnV7zwb0
 oRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K9E/KhcVkGDbrTe0qhdrF1Fjf3jcgJVTpPUCQ8YCemU=;
 b=hB4afKCdW6M78nBvZb+LkatuZuDWBWJCK3tJ31b0zXCuy/WFAODyp3Ni7YnXE5NbXU
 32/DWONflmRou9YsgvoshIAKDB1nqNcjKDosFL2pkjsaA2hNFFYiHtrED032JpN9QRf+
 PWMzRwdlfyMzIzGjf6+7XXT83pqftGRc7euhEwApXZ0wEOnn6W+o9O6R5DH7m5nkNIdh
 KlrUNaId8AuSsCH43NmmiLrn1xG0v1DXPnj8H5OCRDSS7+YA4Fca/L01tXOpmBqI2KRx
 JjUnSfTT8HeMu8uBIBEAFbs60jYdZ73Y5QLCqph67zch4AphvrunKdU+RtAT6VnlPufa
 cdyQ==
X-Gm-Message-State: AOAM530L5THf/a1cIJ4SXZE4+PR5sTWpMTvFJOSZcBwW4d/cWS2o78Ou
 vvZs78GOgl1A1DFn45WwPkhO1mUdmIGbTw==
X-Google-Smtp-Source: ABdhPJwYRGlJYHVRvrodTlDqd7FBnxrX+8y9w8YyX5bj4Ki/WacHNYwXtWzrUFKdcTpn/aOl08Go6A==
X-Received: by 2002:a63:34c5:: with SMTP id b188mr823054pga.219.1601622650503; 
 Fri, 02 Oct 2020 00:10:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id j19sm793832pfi.51.2020.10.02.00.10.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Oct 2020 00:10:49 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <ef1681fc-1123-15e7-0f93-2cc8b70354e7@gmail.com>
 <alpine.DEB.2.21.2010020544590.7067@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <3ae58bf3-3725-f7c8-0ab5-ae7a2d8d28df@gmail.com>
Date: Fri, 2 Oct 2020 12:40:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010020544590.7067@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kconfig: use interpreters to
	invoke scripts
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

On 02/10/20 9:20 am, Lukas Bulwahn wrote:
> 
> 
> On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
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
> 
> 
> Ujjwal, you have nicely split the patches. I suggest you send out this 
> patch and the patch "kbuild: use interpreters to incoke scripts" together 
> as one patch series.
> 
> You just need to write a cover letter and explain there which steps you 
> did to find this being wrong before and what you did to test that it is 
> now corrected.
> 
> Also, can you please share on this list to whom/which lists you would send 
> this patch series?Running 'get_maintainer.pl' script I get the following list.

kconfig: use interpreters to invoke scripts-

Nathan Chancellor <natechancellor@gmail.com>
Nick Desaulniers <ndesaulniers@google.com>
Masahiro Yamada <masahiroy@kernel.org>
"Steven Rostedt (VMware)" <rostedt@goodmis.org>
Masami Hiramatsu <mhiramat@kernel.org>
Daniel Borkmann <daniel@iogearbox.net>
Andrew Morton <akpm@linux-foundation.org>
Krzysztof Kozlowski <krzk@kernel.org>
Valentin Schneider <valentin.schneider@arm.com>
Nick Terrell <terrelln@fb.com>
"Eric W. Biederman" <ebiederm@xmission.com>
Johannes Weiner <hannes@cmpxchg.org>
linux-kernel@vger.kernel.org
clang-built-linux@googlegroups.com


kbuild: use interpreters to invoke scripts-

Masahiro Yamada <masahiroy@kernel.org>
Michal Marek <michal.lkml@markovi.net>
Catalin Marinas <catalin.marinas@arm.com>
Will Deacon <will@kernel.org>
Tony Luck <tony.luck@intel.com>
Fenghua Yu <fenghua.yu@intel.com>
Nick Hu <nickhu@andestech.com>
Greentime Hu <green.hu@gmail.com>
Vincent Chen <deanbo422@gmail.com>
Vincenzo Frascino <vincenzo.frascino@arm.com>
Kees Cook <keescook@chromium.org>
Nick Desaulniers <ndesaulniers@google.com>
Alexander Popov <alex.popov@linux.com>
Mark Brown <broonie@kernel.org>
Sami Tolvanen <samitolvanen@google.com>
Nathan Chancellor <natechancellor@gmail.com>
Denis Efremov <efremov@linux.com>
linux-kbuild@vger.kernel.org
linux-kernel@vger.kernel.org
linux-arm-kernel@lists.infradead.org
linux-ia64@vger.kernel.org

> 
> Then we check that we did not miss anyone important for these two patches.
> 
> Please resend the two mentioned patches again as patch series with a cover 
> letter.
> 
> We are getting close now to sending this to the larger group of kernel 
> developers.
> 
> Good progress so far.
> 
> Lukas
> 
>> ---
>>  init/Kconfig | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 91456ac0ef20..335c8fcb99af 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -30,12 +30,12 @@ config CC_IS_GCC
>>  
>>  config GCC_VERSION
>>  	int
>> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>>  	default 0
>>  
>>  config LD_VERSION
>>  	int
>> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>> +	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
>>  
>>  config CC_IS_CLANG
>>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
>> @@ -45,20 +45,20 @@ config LD_IS_LLD
>>  
>>  config CLANG_VERSION
>>  	int
>> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
>>  
>>  config CC_CAN_LINK
>>  	bool
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>>  
>>  config CC_CAN_LINK_STATIC
>>  	bool
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>>  
>>  config CC_HAS_ASM_GOTO
>> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>> +	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
>>  
>>  config CC_HAS_ASM_GOTO_OUTPUT
>>  	depends on CC_HAS_ASM_GOTO
>> -- 
>> 2.26.2
>>
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
