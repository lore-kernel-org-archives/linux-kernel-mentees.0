Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030D1C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 10:03:18 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67AB206FB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 10:03:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="e67f5vWv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67AB206FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EF2248795C;
	Tue, 13 Oct 2020 10:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrRAPR5QFi2U; Tue, 13 Oct 2020 10:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D705E8745F;
	Tue, 13 Oct 2020 10:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAA87C0052;
	Tue, 13 Oct 2020 10:03:14 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D00D1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 10:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BE551873F1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 10:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wux2NLMsHy_Q
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 10:03:10 +0000 (UTC)
X-Greylist: delayed 00:08:01 by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 358BB8746F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 10:03:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id e23so13326308wme.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YKvSNZR9ptBFcO/UUrxR/7or/yI++iP0x0q1ZQ9abEs=;
 b=e67f5vWv4SyTTBTEAc0A4DjwfBj/qCC2NMYqNap0zrsSrh++RjL7CBlWcy79R6Dvx7
 oLkmyRmfA7dTIPOVyYizGts/ef0Q9mHcqm5TJiCzbyVTlnTpFTojo6gHmtYJtQ9TJ5C8
 KCQDUIw9lQTXo+i39SCWIoYhBI32fzZwGg3/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YKvSNZR9ptBFcO/UUrxR/7or/yI++iP0x0q1ZQ9abEs=;
 b=HRSXeTNWPd6QCU/TF99vVbnuP21Bx4W27HkqQ4DKRHM7ThpN8UcTC9Y+DsXHtfCgJx
 pfg0Y3tn4TMVVk98fENo4GQZPYov/MAUtHcnKBWmO3/nykDNbHr2LGVSn87rYxNeIjlj
 rVHoYkDCe6OTKyhJvQW6XqK/HGY35tmBWScjoKC88hZ8+m/M3BkwM/n7njvmRh/Lcjiv
 XvnCeB1uzL0ADKZfLLE+okS24inLuDkBn2uWb67HmMGTP79fdM56Q6zHUGlur97aRgsc
 q7a6LYR/228AsnsneSwW+en6P5qaAcElCH0O68ExDm6fimVYsK40Xm7s+IpC2MPvLH6g
 Tbmw==
X-Gm-Message-State: AOAM533cRDkAAK4rPiaryRLRmYTbA4ItoPf5tEBc6CNLZ4rb00/R9wBr
 ntQnONjDgLs2gOy4a8VXZnNDHBR4kODI9g0YspY=
X-Google-Smtp-Source: ABdhPJwNzHOzFBFSlEaLslgNSlVhrb2Hfm4ARc29+Fg45XaZhkHoBe0aLO3suD+2MxFxFgKOty4nLQ==
X-Received: by 2002:a1c:6643:: with SMTP id a64mr15174306wmc.142.1602582906104; 
 Tue, 13 Oct 2020 02:55:06 -0700 (PDT)
Received: from [172.16.11.132] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id o194sm25490462wme.24.2020.10.13.02.55.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 02:55:05 -0700 (PDT)
To: Brendan Higgins <brendanhiggins@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200817043028.76502-1-98.arpi@gmail.com>
 <f408efbd-10f7-f1dd-9baa-0f1233cafffc@rasmusvillemoes.dk>
 <20200821113710.GA26290@alley> <20200821122849.GS1891694@smile.fi.intel.com>
 <20201012204625.GA56597@google.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <876cc862-56f1-7330-f988-0248bec2fbad@rasmusvillemoes.dk>
Date: Tue, 13 Oct 2020 11:55:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012204625.GA56597@google.com>
Content-Language: en-US
Cc: Petr Mladek <pmladek@suse.com>, Arpitha Raghunandan <98.arpi@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
 linux-kselftest@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org, kunit-dev@googlegroups.com
Subject: Re: [Linux-kernel-mentees] [PATCH] lib: Convert test_printf.c to
	KUnit
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
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 12/10/2020 22.46, Brendan Higgins wrote:
> On Fri, Aug 21, 2020 at 03:28:49PM +0300, Andy Shevchenko wrote:
>> On Fri, Aug 21, 2020 at 01:37:10PM +0200, Petr Mladek wrote:
>>> On Mon 2020-08-17 09:06:32, Rasmus Villemoes wrote:
>>>> On 17/08/2020 06.30, Arpitha Raghunandan wrote:
>>>>> Converts test lib/test_printf.c to KUnit.
>>>>> More information about KUnit can be found at
>>>>> https://www.kernel.org/doc/html/latest/dev-tools/kunit/index.html.
>>>>> KUnit provides a common framework for unit tests in the kernel.
>>>>
>>>> So I can continue to build a kernel with some appropriate CONFIG set to
>>>> y, boot it under virt-me, run dmesg and see if I broke printf? That's
>>>> what I do now, and I don't want to have to start using some enterprisy
>>>> framework.
>>>
>>> I had the same concern. I have tried it.
> =

> Sorry you feel that way. Do you have any suggestions on how we can make
> it seem less enterprisy? Seems like there are people here who are not a
> fan of the output format, so of which we can fix here, some of which is
> part of KTAP[1].

I'm fine with machine-readable TAP, but I most defintely also want
human-readable, which means all the excessive and pointless lines need
to go away.

>> Which raises an obvious question: did the people who convert this test t=
his
>> themselves? Looks like a janitor work in the area without understanding =
the
>> area good enough.
> =

> Looks to me like Arpitha ran it, but you are right, we don't have a lot
> of familiarity with this area; we were treating it as "janitor work" as
> you say.
> =

> Our intention was just to take some existing tests and as non-invasively
> as possible, get them to report using a common format, and maybe even
> get some of the tests to follow a common pattern.
> =

>> Probably I will NAK all those patches from now on, until it will be good=
 commit
>> messages and cover of risen aspects, including reference to before and a=
fter
>> outcome for passed and failed test cases.
> =

> Fair enough, hopefully we can address these issues in the next revision.
> =

> One issue though, with the "before and after outcome" you are
> referencing; are you referring to the issue that Petr pointed out in how
> they are inconsistent:
> =

> =A0 =A0+ original code: vsnprintf(buf, 6, "%pi4|%pI4", ...) wrote '127.0'=
, expected '127-0'
> =A0 =A0+ kunit code: vsnprintf(buf, 20, "%pi4|%pI4", ...) wrote '127.000.=
000.001|127', expected '127-000.000.001|127' =A0
> =

> (I think Rasmus addressed this.) Or are your referring to something
> else?

Yeah, that change is fine and expected, can we stop bringing that up.

It's all the explicit "memcmp() =3D=3D 0 failed" gunk at least I am
concerned with. If you can get rid of that (basically, stop stringifying
the code, that's completely irrelevant) and just get the messages from
the test itself that explains what went wrong. I'm fine with
interspersing that with a few TAP-readable lines. But things like

 Expected memcmp(test_buffer, expect, written) =3D=3D 0, but
                       memcmp(test_buffer, expect, written) =3D=3D 1
                       0 =3D=3D 0

are utterly useless. We're not _testing_ memcmp, we're _using_ it to
know if vsprintf() did as we expected. So just mechanically changing
"memcmp() =3D=3D 0" into "SOME_MACRO(memcmp(), 0)" is never going to work,
at least when SOME_MACRO does the stringify and ends up producing the
above. But if you can end up producing

[   56.795433]     # selftest: EXPECTATION FAILED at lib/printf_kunit.c:76
               vsnprintf(buf, 20, "%pi4|%pI4", ...) wrote
'127.000.000.001|127', expected '127-000.000.001|127'

that's fine; that's basically just prepending an EXPECTATION FAILED line
to the existing output.

So doing it properly would probably be either

- change the existing pr_warn()s to use some KUNIT macro that generates
whatever extra info is needed by TAP, in addition to the current
human-readable message, and/or
- just add a few lines of TAP-suitable FAIL/PASS lines here and there

but let me repeat that the control flow (early returns) in do_test()
cannot be modified.

Rasmus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
