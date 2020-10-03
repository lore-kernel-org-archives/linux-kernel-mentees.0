Return-Path: <SRS0=1t5V=DK=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07072C41604
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:30:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BA2B2067C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  3 Oct 2020 14:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tpPRywG0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5BA2B2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E65EE85F82;
	Sat,  3 Oct 2020 14:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZZuwpIT1K0k; Sat,  3 Oct 2020 14:30:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 006B886121;
	Sat,  3 Oct 2020 14:30:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBE7EC016F;
	Sat,  3 Oct 2020 14:30:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4BD49C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 355A68682C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IxM+l0gPnw-l
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:30:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0E2C686791
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  3 Oct 2020 14:30:31 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 144so3510397pfb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 03 Oct 2020 07:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DBC2P4nzNIfjnem13eIgTY2CyumHT9Nn9M2D/OdGH4M=;
 b=tpPRywG05RJBlTSHzgSGAXg+gHOB+LcAndqWIrf3PD0frCHXYP+6N3Pm4pVfRmj9Yr
 cK2CeTBimFBW3zuRWKm9Sgttu+KoyfK8QZhymYH+2omb6KWMvWpGAqqX/sN0SjTJb7mV
 vbPTmnO00anMEuD3YSY74c7XOJHwkCek8MEs8DqP1Fr+itFuOiPoR4M1bOjPsUMg8196
 EbX78kssB65dC0NSCIgZueC1gfkJs4UJYqmz3L06BaipE75ZRgxaSuKHCXLShm3GDzJk
 UjBIZjolGAAKX716zIfz+/kidL44zopTN2sh4VRhrKvCK5PPPJautLOpVnGqg3QFKXTJ
 krtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DBC2P4nzNIfjnem13eIgTY2CyumHT9Nn9M2D/OdGH4M=;
 b=PFjrvKKGQ0pFjuTuug/4jq0sne1TGC4CJiyZpndqPdVhFDfkQMYDcwcuLHtAJAzsJM
 Fs7b2AtWyYze6TwB2HAuykKPK0a7UyRAU0eSOrDNOlLffW5vGtoshBGJ1k4FRgkSJ09S
 BpWG2PgKiWsofzlMoIwpLMeQdcbmNqQGZnVkxavsa4tPxwZfZL1rtPYyGSOYk15+wLUe
 +MwCboQtbQNh9i9NcNQvNuL1HqMDOX1FodCkOqmmjaB6WXpaqoA8ZRq6GsrsxzRGZmKZ
 XTKti5zN0yW5XXxKKVusywAx3RFiWuBZ0zLrcXJ95JlspDK4PYCO/85v5rWmrC3P20/N
 p0mg==
X-Gm-Message-State: AOAM531sZLyc3VRxzuuSWNW8hMXluQjXXUht2ltqrmr8cqVJ5e2ksSZn
 9AbE6RSuiXp2/BaMaSr57qw1Mdcs71lYOA==
X-Google-Smtp-Source: ABdhPJx4iER1aCvPUdaxcPvQJ81XHs0GpWyaY2o1uLk+93gwXIuXfQIxx6j5TRRDui4jyCThjB9x1g==
X-Received: by 2002:a62:bd0e:0:b029:142:2501:35e7 with SMTP id
 a14-20020a62bd0e0000b0290142250135e7mr7681280pff.71.1601735429967; 
 Sat, 03 Oct 2020 07:30:29 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id cf7sm4929183pjb.52.2020.10.03.07.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Oct 2020 07:30:29 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <ef1681fc-1123-15e7-0f93-2cc8b70354e7@gmail.com>
 <alpine.DEB.2.21.2010020544590.7067@felia>
 <3ae58bf3-3725-f7c8-0ab5-ae7a2d8d28df@gmail.com>
 <alpine.DEB.2.21.2010030859430.7503@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <5c95afeb-94b7-7be8-0e7d-e506124d4054@gmail.com>
Date: Sat, 3 Oct 2020 20:00:20 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010030859430.7503@felia>
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

On 03/10/20 12:35 pm, Lukas Bulwahn wrote:
> 
> 
> On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
> 
>> On 02/10/20 9:20 am, Lukas Bulwahn wrote:
>>>
>>>
>>> On Fri, 2 Oct 2020, Ujjwal Kumar wrote:
>>>
>>>> We cannot rely on execute bits to be set on files in the repository.
>>>> The build script should use the explicit interpreter when invoking any 
>>>> script from the repository.
>>>>
>>>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
>>>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>>>
>>>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>>>> Suggested-by: Kees Cook <keescook@chromium.org>
>>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>>>
>>>
>>> Ujjwal, you have nicely split the patches. I suggest you send out this 
>>> patch and the patch "kbuild: use interpreters to incoke scripts" together 
>>> as one patch series.
>>>
>>> You just need to write a cover letter and explain there which steps you 
>>> did to find this being wrong before and what you did to test that it is 
>>> now corrected.
>>>
>>> Also, can you please share on this list to whom/which lists you would send 
>>> this patch series?Running 'get_maintainer.pl' script I get the following list.
>>
>> kconfig: use interpreters to invoke scripts-
>>
> 
> Make those people explicitly to:
> 
>> Nathan Chancellor <natechancellor@gmail.com>
>> Nick Desaulniers <ndesaulniers@google.com>
> 
> Nathan and Nick were working on the multi-compier support.
> 
>> Masahiro Yamada <masahiroy@kernel.org>
> 
> Masahiro-san is the important maintainer here.
> also add Michal Marek.
> 
> I guess they are all optional:
> 
>> "Steven Rostedt (VMware)" <rostedt@goodmis.org>
>> Masami Hiramatsu <mhiramat@kernel.org>
>> Daniel Borkmann <daniel@iogearbox.net>
>> Andrew Morton <akpm@linux-foundation.org>
>> Krzysztof Kozlowski <krzk@kernel.org>
>> Valentin Schneider <valentin.schneider@arm.com>
>> Nick Terrell <terrelln@fb.com>
>> "Eric W. Biederman" <ebiederm@xmission.com>
>> Johannes Weiner <hannes@cmpxchg.org>
> 
> 
> Yes, the mailing lists should be added:
> 
>> linux-kernel@vger.kernel.org
>> clang-built-linux@googlegroups.com
>>
> 
> also add the linux-kbuild mailing list.
> 
>>
>> kbuild: use interpreters to invoke scripts-
>>
> 
> These are the important maintainers:
> 
>> Masahiro Yamada <masahiroy@kernel.org>
>> Michal Marek <michal.lkml@markovi.net>
> 
> 
> I think these are mainly developers that some of the lines;
> 
> maybe just put them CC:
> 
>> Catalin Marinas <catalin.marinas@arm.com>
>> Will Deacon <will@kernel.org>
>> Tony Luck <tony.luck@intel.com>
>> Fenghua Yu <fenghua.yu@intel.com>
>> Nick Hu <nickhu@andestech.com>
>> Greentime Hu <green.hu@gmail.com>
>> Vincent Chen <deanbo422@gmail.com>
>> Vincenzo Frascino <vincenzo.frascino@arm.com>
>> Kees Cook <keescook@chromium.org>
>> Nick Desaulniers <ndesaulniers@google.com>
>> Alexander Popov <alex.popov@linux.com>
>> Mark Brown <broonie@kernel.org>
>> Sami Tolvanen <samitolvanen@google.com>
>> Nathan Chancellor <natechancellor@gmail.com>
>> Denis Efremov <efremov@linux.com>
> 
> 
> Mailing lists looks good:
> 
>> linux-kbuild@vger.kernel.org
>> linux-kernel@vger.kernel.org
>> linux-arm-kernel@lists.infradead.org
>> linux-ia64@vger.kernel.org
>>
> 
> I think you have a good list.

For PATCH 1/2:
Nathan Chancellor <natechancellor@gmail.com>
Nick Desaulniers <ndesaulniers@google.com>
Masahiro Yamada <masahiroy@kernel.org>
Michal Marek <michal.lkml@markovi.net>
linux-kbuild@vger.kernel.org
linux-kernel@vger.kernel.org
clang-built-linux@googlegroups.com
linux-kernel-mentees@lists.linuxfoundation.org

For PATCH 2/2:
Nathan Chancellor <natechancellor@gmail.com>
Nick Desaulniers <ndesaulniers@google.com>
Masahiro Yamada <masahiroy@kernel.org>
Michal Marek <michal.lkml@markovi.net>
linux-kbuild@vger.kernel.org
linux-kernel@vger.kernel.org
linux-arm-kernel@lists.infradead.org
linux-ia64@vger.kernel.org
linux-kernel-mentees@lists.linuxfoundation.org

Is it okay to send one patch from the series to a recipient and skip 
the other patches?
Should I merge recipients for each patch into one to create a common list 
of recipients for all the patches (with cover letter) in the series?
And send all the patches (with cover letter) to that common list.

Thanks
Ujjwal Kumar

> 
> Lukas
>  
>>>
>>> Then we check that we did not miss anyone important for these two patches.
>>>
>>> Please resend the two mentioned patches again as patch series with a cover 
>>> letter.
>>>
>>> We are getting close now to sending this to the larger group of kernel 
>>> developers.
>>>
>>> Good progress so far.
>>>
>>> Lukas
>>>
>>>> ---
>>>>  init/Kconfig | 16 ++++++++--------
>>>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/init/Kconfig b/init/Kconfig
>>>> index 91456ac0ef20..335c8fcb99af 100644
>>>> --- a/init/Kconfig
>>>> +++ b/init/Kconfig
>>>> @@ -30,12 +30,12 @@ config CC_IS_GCC
>>>>  
>>>>  config GCC_VERSION
>>>>  	int
>>>> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>>>> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>>>>  	default 0
>>>>  
>>>>  config LD_VERSION
>>>>  	int
>>>> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>>>> +	default $(shell,$(LD) --version | $(AWK) -f $(srctree)/scripts/ld-version.sh)
>>>>  
>>>>  config CC_IS_CLANG
>>>>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
>>>> @@ -45,20 +45,20 @@ config LD_IS_LLD
>>>>  
>>>>  config CLANG_VERSION
>>>>  	int
>>>> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>>>> +	default $(shell,$(CONFIG_SHELL) $(srctree)/scripts/clang-version.sh $(CC))
>>>>  
>>>>  config CC_CAN_LINK
>>>>  	bool
>>>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>>>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>>>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>>>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>>>>  
>>>>  config CC_CAN_LINK_STATIC
>>>>  	bool
>>>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>>>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>>>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>>>> +	default $(success,$(CONFIG_SHELL) $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>>>>  
>>>>  config CC_HAS_ASM_GOTO
>>>> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>>>> +	def_bool $(success,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC))
>>>>  
>>>>  config CC_HAS_ASM_GOTO_OUTPUT
>>>>  	depends on CC_HAS_ASM_GOTO
>>>> -- 
>>>> 2.26.2
>>>>
>>>>
>>
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
