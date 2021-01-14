Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE96C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 14:21:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D99B23A69
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 14:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D99B23A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08AD686BD3;
	Thu, 14 Jan 2021 14:21:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LlF3eplGpqKn; Thu, 14 Jan 2021 14:21:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8DC486BA2;
	Thu, 14 Jan 2021 14:21:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A890AC0893;
	Thu, 14 Jan 2021 14:21:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8304C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB6212048C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:21:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Glppb2K-pebX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:21:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 13F882042E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 14:21:45 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id c22so3852785pgg.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 06:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jV1t/u5EPauRtoTZMBLFnOtjaG/RlRRgHMlhw/Bt+3c=;
 b=kN/ac0sYHK4SprjHE3yv0x5065egnQCcKax/QpE21vqwPdPjNA16uolRHseQtGS6xW
 5CzylJG8pLZJqEqfqpXjv4r/uD2XswhJWN/uAup1QsyF++z/fAPpSoKXTytgTgB6vezS
 Q/W6yxtU4RGB9TQHp3bKFURcAes+2A5vG9ufUJq+5RSuAVByfSrHb7nR5KlLR8Froq5c
 Oi/oTrAmExmgDnjw0qX6BEuZxAx3qpSyGa/RZAStpxef4kN5txWmgjbfakvnPgUzTPpj
 H2cDoW1VmmjBmdxSLoDRB6SZ5trK1TgX5lY8d86MO200bMZD2y2LU1f9x72oGn6+BigA
 yckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jV1t/u5EPauRtoTZMBLFnOtjaG/RlRRgHMlhw/Bt+3c=;
 b=dhxVgW69nJ1Ak2JxvyOLVigHm9krx25uCbX9BEpww0ejaEqWaHNUw2dntBlXeDJl+t
 SjfRTnW5I2MXX/HkDHhmBdsbAamK8zvywofH2JcFTeutGYL/0Fblgqrd46E/OTQDAZQo
 JzKhHoJg8uQ57LyQSpIExKwj1PrvjV7vg6ScYVUCoXKOxFQUhEyyt4njnVApGsFRbo2j
 Ws5GJ0n3loza59r9G9Btnu65hIX/GzVopknHrcj5dP6ISGje8+Db8zmshpc5mR1GedzW
 PmxgSLElsQ+oOfNrnQ5dtnf0UZv9t9TjEOnSvJFIJl03BIYeG82QtEoj/N+NczzuYwan
 VEDw==
X-Gm-Message-State: AOAM530TiVz3ii+sCZLH5B03RkJC/e8isPtCG4zoImxPj1CoQLZjtgWx
 702jjC8dl9QxxcB3nELV82w=
X-Google-Smtp-Source: ABdhPJz6akHo4bMW5dHy3UIp9d+dM+RJ3GzsBPMeIOUeW0pQXbeTYWjTLO/Gv1aY8RPcIUETVW/SiQ==
X-Received: by 2002:a63:ef14:: with SMTP id u20mr7845224pgh.93.1610634104425; 
 Thu, 14 Jan 2021 06:21:44 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:b1fd:acc0:2bb9:df96?
 ([2405:201:600d:a089:b1fd:acc0:2bb9:df96])
 by smtp.gmail.com with ESMTPSA id w18sm5452454pfj.120.2021.01.14.06.21.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 06:21:44 -0800 (PST)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>
References: <20210112115421.GB13086@zn.tnic>
 <20210112194625.4181814-1-ndesaulniers@google.com>
 <20210112210154.GI4646@sirena.org.uk>
 <CAKXUXMwoY+__Xrg3uKtz3AzgDorVTKtgtQnisoSWO8Wh0tmDNQ@mail.gmail.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <43a325aa-aa8a-7170-46ab-3353f1ac86a8@gmail.com>
Date: Thu, 14 Jan 2021 19:51:38 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKXUXMwoY+__Xrg3uKtz3AzgDorVTKtgtQnisoSWO8Wh0tmDNQ@mail.gmail.com>
Content-Language: en-US
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fwd: [PATCH v4] x86/entry: emit a symbol
 for register restoring thunk
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

On 14/1/21 5:19 pm, Lukas Bulwahn wrote:
> Dwaipayan and Aditya, here is another candidate for a checkpatch rule.
> 
> Lukas
> 
> ---------- Forwarded message ---------
> From: Mark Brown <broonie@kernel.org>
> Date: Tue, Jan 12, 2021 at 10:02 PM
> Subject: Re: [PATCH v4] x86/entry: emit a symbol for register restoring thunk
> To: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner
> <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
> <bp@alien8.de>, Fangrui Song <maskray@google.com>, Arnd Bergmann
> <arnd@arndb.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Jonathan Corbet
> <corbet@lwn.net>, <x86@kernel.org>, H. Peter Anvin <hpa@zytor.com>,
> Nathan Chancellor <natechancellor@gmail.com>, Miguel Ojeda
> <ojeda@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Joe Perches
> <joe@perches.com>, <linux-doc@vger.kernel.org>,
> <linux-kernel@vger.kernel.org>, <clang-built-linux@googlegroups.com>
> 
> 
> On Tue, Jan 12, 2021 at 11:46:24AM -0800, Nick Desaulniers wrote:
> 
> This:
> 
>> when building with LLVM_IAS=1 (Clang's integrated assembler). Josh
>> notes:
> 
>>   So basically, you can use an .L symbol *inside* a function or a code
>>   segment, you just can't use the .L symbol to contain the code using a
>>   SYM_*_START/END annotation pair.
> 
> is a stronger statement than this:
> 
>> +  Developers should avoid using local symbol names that are prefixed with
>> +  ``.L``, as this has special meaning for the assembler; a symbol entry will
>> +  not be emitted into the symbol table. This can prevent ``objtool`` from
>> +  generating correct unwind info. Symbols with STB_LOCAL binding may still be
>> +  used, and ``.L`` prefixed local symbol names are still generally useable
>> +  within a function, but ``.L`` prefixed local symbol names should not be used
>> +  to denote the beginning or end of code regions via
>> +  ``SYM_CODE_START_LOCAL``/``SYM_CODE_END``.
> 
> and seems more what I'd expect - SYM_FUNC* is also affected for example.
> Even though other usages are probably not very likely it seems better to
> keep the stronger statement in case someone comes up with one, and to
> stop anyone spending time wondering why only SYM_CODE_START_LOCAL is
> affected.
> 
> This also looks like a good candiate for a checkpatch rule, but that can
> be done separately of course.
> 

Thanks Lukas!
I'd like to take a shot at it. This is what I have understood from the
discussion:
Introduce a new warning rule for .S files, where ".L" prefixes are
used in the code, if it is occurring between any kind of START/END pair.
This is what I am planning to do:
- Check if the file is ".S" file.
- If the line contains ".L" prefixed symbol, give user a
warning/check, so that they can ensure that the line is not inside
START/END block. (As we may not be able to make sure about the same,
if the START/END line is not in the patch; otherwise we could run a
while loop)

What do you think?

Thanks
Aditya
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
