Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F896C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 10:24:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035F9238E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 10:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6VRdwmP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 035F9238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A60C086B31;
	Sat, 26 Sep 2020 10:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmQ_G9B62rqe; Sat, 26 Sep 2020 10:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D099E86B2C;
	Sat, 26 Sep 2020 10:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9BEFC0890;
	Sat, 26 Sep 2020 10:24:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0DCCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 10:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AA4D787509
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 10:24:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u6dIucOPLBa9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 10:24:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6ED6287508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 10:24:15 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id l126so5428697pfd.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Qvvd13Tm9yW1oOLLeofJN4caLb3gKPXtNBQyX/PW7KQ=;
 b=j6VRdwmPccH2i8DiqKqJIuV3uyJd3PK2Msqv+amu+EM2JexnZKnwnJcKDn4HCccWwu
 uSAKVAIWMVFr/98/eYw8aX1XnW1LJ8NTGzMmfiGcIc5J+V6nzMJsfCc9M41m08wH1A4I
 5qvDxe5/nKcpUutLY6hfkc4Y2XhT9FJaZR8eRzFAnTJOQ/qrUKVCvxvYwT71r+bWrBqU
 gCiTIWH7ZCBD0gIm43zZKwqs0DhRoWWk0QiobZ/f7cZEEimBIiLI89Cd1RoDlVftdPup
 MN8P+dsW43psZGxfdfJDwNVCvK5JOFN07VMhxcXvHdsVGjSFzPnlhsEiv6f0khPlvacf
 7xqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Qvvd13Tm9yW1oOLLeofJN4caLb3gKPXtNBQyX/PW7KQ=;
 b=M5CrvzorZbyEszqW4qLG43emosBr40kXw9CZkRWfOAgcG8cUSx1kCyIMFQdXMxy6tP
 OE51SCRgyj+qG3WV4y2t2BJoul0Fce07M4gOUwxreoIvZ7ZfR7oKw3fKSJ4QoKq/u5J0
 jEqBzlUcx8lqekbuZOJalPLtwysvLDgFX6KncsBAjuxyQ7wkbL4fHxPlcBNHYoszFXl2
 PKYY1FIuAegZKoTTgKomf9TEn4L8VDkAdWI6ihKlYRBCgvzRMHVkeYdms/RMwvvpJSHA
 T7vLNo2qs7A96Kcj4mxjHMq7Hls0l9DSxcSE8RRCOgUi8DaIANwGDV017qhORDhsAlVQ
 7I6w==
X-Gm-Message-State: AOAM531Y2zs+2g8PQeEZwfjfBQZn7ryDKtn4xPPYKROBdPps2rwZAwAq
 f0+ElCLO66B5+9cil+FnqmGrKiY69vIvKA==
X-Google-Smtp-Source: ABdhPJzXYY+yYTsg5ImUOE1txNR88cC8whxoskGQY7olj8bD0kiTi8QfTxWJw/sPhU8fkNHfu7qT+g==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr2470622pgp.61.1601115854319;
 Sat, 26 Sep 2020 03:24:14 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:2085:4633:7001:2dd8:81bf])
 by smtp.gmail.com with ESMTPSA id d6sm1585147pjw.0.2020.09.26.03.24.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 03:24:13 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2009260754430.4734@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <b3d49d82-1990-0359-c3d2-2eaeae71d8a6@gmail.com>
Date: Sat, 26 Sep 2020 15:54:10 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009260754430.4734@felia>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
	when calling scripts
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

On 26/09/20 11:42 am, Lukas Bulwahn wrote:
> 
> Basically the diff is okay; already start writing the commit message.
> 
> On Sat, 26 Sep 2020, Ujjwal Kumar wrote:
> 
>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>> ---
>>  init/Kconfig | 16 ++++++++--------
>>  1 file changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 91456ac0ef20..9f6ec575e3d1 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -30,12 +30,12 @@ config CC_IS_GCC
>>  
>>  config GCC_VERSION
>>  	int
>> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
>> +	default $(shell,sh $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> 
> in the top-level Makefile, (./Makefile), you will find a section:
> 
> # SHELL used by kbuild
> CONFIG_SHELL := sh
> 
> I think that is what is supposed to be used here.
> 
>>  	default 0
>>  
>>  config LD_VERSION
>>  	int
>> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
>> +	default $(shell,$(LD) --version | awk -f $(srctree)/scripts/ld-version.sh)
>>
> 
> Further you find:
> 
> # Make variables (CC, etc...)
> 
> This section defines variables for each interpreter, in case someone wants
> to modify/override the default interpreters.
> 
> You can find there:
> 
> AWK             = awk
> 
> Use that.
> 
>>  config CC_IS_CLANG
>>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
>> @@ -45,20 +45,20 @@ config LD_IS_LLD
>>  
>>  config CLANG_VERSION
>>  	int
>> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>> +	default $(shell,sh $(srctree)/scripts/clang-version.sh $(CC))
>>
> 
> I think CONFIG_SHELL is right here.
>   
>>  config CC_CAN_LINK
>>  	bool
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
>> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
>>
> 
> Same here.
>   
>>  config CC_CAN_LINK_STATIC
>>  	bool
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
>> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
>>
> 
> Same here.
>   
>>  config CC_HAS_ASM_GOTO
>> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
>> +	def_bool $(success,sh $(srctree)/scripts/gcc-goto.sh $(CC))
>>
> 
> Same here.
> 
> I think this is already a good size for the patch, it solves one problem 
> to have the basic Configuration targets in kbuild work without the need 
> for any executable flag on repository files.
> 
> Fix it up, write an appropriate commit message, we will review here on the 

How is the following for a commit message?
kconfig: use interpreters and not rely on x-bit to invoke scripts

Having the execute bits set wasn't something that we could depend on.
Any portion of the kernel that invokes such files provides the interpreter 
explicitly.

Additionally, relying on x-bit is not recommended for following reasons:

  - An official guidance is currently unavailable to decide whether 
    it is mandatory to have the x-bit set.

  - It is possible that the x-bit will be erased/ignored when handling 
    patches (for example, using patch(1)).

I am wondering who should I include for 'Suggested-by:' tag?

> linux-kernel-mentees list and then it can go out into the wild wild west 
> of the kernel mailing list.
> 

Yes I will make the changes.

Also, some Makefile(s) do not use '$(CONFIG_SHELL)' and instead use 'sh'.
For instance,
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/Makefile.lib?h=next-20200925#n422
AND
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/s390/boot/Makefile?h=next-20200925#n74

I wonder if they should be improved to maintain the consistency or left 
at their current state.

> 
> Lukas
> 
>>  config CC_HAS_ASM_GOTO_OUTPUT
>>  	depends on CC_HAS_ASM_GOTO
>> -- 
>> 2.26.2
>>
>>

On looking at Makefile(s), I found some places where we miss specifying the 
interpreter and so we are relying on executable bit again.
here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/nds32/kernel/vdso/Makefile?h=next-20200925#n42

I wonder if it should go as a separate patch, simply because its Makefile now.

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
