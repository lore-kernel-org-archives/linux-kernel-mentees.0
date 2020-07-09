Return-Path: <SRS0=poiC=AU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9231BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 05:03:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 383B820708
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  9 Jul 2020 05:03:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mupW5nRg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 383B820708
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 135F2871ED;
	Thu,  9 Jul 2020 05:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DdP51AnVuSOL; Thu,  9 Jul 2020 05:03:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 46D4F86EB9;
	Thu,  9 Jul 2020 05:03:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32930C0865;
	Thu,  9 Jul 2020 05:03:17 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25731C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ABCFA869EA
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id prA_Hvb5mSMc
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:03:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C814E86999
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Jul 2020 05:03:12 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t27so940157ill.9
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 08 Jul 2020 22:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HD7VxqMxAG6r3z7A/f8og0hiGVztT2/jHEc3ea8REuM=;
 b=mupW5nRgaEkyO3O6JWgyM6+zw3/DAOVY6Ylhe8NLpr7NC6b2/MAIXyBvgV7eh5UcMo
 EyAAy8DIjKOWATeaF00WUzwq1CEVbAqkuEDQivmol7TU+WnN82Ejv64ZyKyka2IRHNkQ
 6l+8vR9aM9Z9z4WHjh56N3WRkZ8bWnhsyPQ8xXqHG7ThLX6gV6WH4EUAAszlC+8FDPtT
 KQGOSEW4DZEjxESKz1qPQqECXLcgJy0QmaY8gR/HEiCtLlp2W7oZPmdIQgr33slXA9Kq
 CI0NQ90b23V2EvM8fYzxYSSCBQII5NKZzGwisapUOtgAJY6NnVr3oebl1qTiFCz7C2yZ
 coTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HD7VxqMxAG6r3z7A/f8og0hiGVztT2/jHEc3ea8REuM=;
 b=MEMeeKnRfUHkSrqgqkI+ozvvuYnEosDE1U7rfIue5jlII7XLxdVT8tluSVHr1CWM0r
 /KwCd92QngfywWPf1uVOmyBC8+rzWtzr3Pfc5y3rPx5p6SMAQSF8ouOiArOHiVv1Wc14
 UBQGccbLSNKYvC4dlLnyuJIOFUPqomXZLGd0jZC0NMcyPD8Qr4J0K3z0KsnW0BNW3LVv
 tQ8urgAigBIEK392/FFBtAcUw76a6ANxxnrNQZ2IHYAaInpzsHyxXn5nTgTdpDiXWpCK
 ybqQg1kwF2TKLfofbjQIKNgn3fUoekWwt/dR6CGcxgZ+Oj9b9f+hOh017jdgtcn8RnND
 vgnA==
X-Gm-Message-State: AOAM532A8q79mSnqrkK31WgfSsWsrMlYrpdbGHocMrYTIblD99OXGjW4
 SSWxCLpNSnpX2eGitzuw7PFM1EaweQfnKUvPzns=
X-Google-Smtp-Source: ABdhPJx/d16j9OpMmzdSvo6EgBtwxlm/Kr3J3sYZd5zFwOU/adwcyCfiEti381WtAWlbMFwEOnXuukac1nI3JZyBlmg=
X-Received: by 2002:a05:6e02:11a6:: with SMTP id
 6mr27114799ilj.64.1594270991908; 
 Wed, 08 Jul 2020 22:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
In-Reply-To: <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 9 Jul 2020 07:03:00 +0200
Message-ID: <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
To: Mrinal Pandey <mrinalmni@gmail.com>
Cc: Linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: Adjust spelling
	check false positive
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

On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>
> On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>>
>> On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>> >
>> >
>> >
>> > On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>> >>
>> >> On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey <mrinalmni@gmail.com> wrote:
>> >> >
>> >> > checkpatch.pl issues warnings on the commits
>> >> > made to scripts/spelling.txt for new entries
>> >> > of typos and their fixes. This commit adjusts
>> >> > checkpatch not to complain about the same.
>> >> >
>> >> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com>
>> >> > ---
>> >>
>> >> How often does that issue appear? Can you use your checkpatch
>> >> evaluation to show that it is relevant?
>> >
>>
>> How many commits to spelling.txt happened within the last year?
>
>
> Sir,
>
> I could find only commit to the file in the range 5.7 to 5.8.rc-1.
>>
>>
>> The patch might be accepted, but the reason is not that convincing.
>
>
> What do you suggest? Should I send it or not?
>

Let us keep that in the backlog for now, but not send it. If it is
only one single case among hundreds false positives, it is maybe not
the best to start with.
We might get to that one case here eventually, but let us start with
the more important and critical cases first.

>> Maybe you can find another class of false positives that happen more
>> often?
>
>
> Yes, I have a few other suggestions that I found occurring often and I'm still evaluating to find more:
> 1. In `.h` files, when we write a function prototype, the name of the function parameters are
> not required, only the data type is enough, checkpatch says to define the name of the parameters too.
> Issues a warning like - function definition argument '<arg>' should also have an identifier name
>

Okay, we need to discuss if that is a convention that developers care
about or not.

> 2. A very common warning is - Macros with complex values should be enclosed in parentheses
> which is correct sometimes but a false positive many times, for macros ending with `)` or
> macros like `#define var value` we probably don't need another pair of `()`
>

Agree, this might be worth refining in checkpatch as you described.

> 3. checkpatch complains about breaking a quoted string across lines but this is many a time
> necessary for readability and in most of the patches I saw the strings broken.
>

Tricky to really know what the best solution is here. It is a tradeoff
in both directions.
Let us put that aside for now.

> 4. There are many patches where checkpatch issues false positives regarding spaces before
> and after lines.
>
Why are they false positives?

> 5. The warning - EXPORT_SYMBOL(foo); should immediately follow its function/variable
> is falsely positive in many cases where the statement is correct but the script fails to identify it.
>

If the script does not detect that, it sounds like a bug.
This can be improved for checkpatch.pl.

> 6. While running checkpatch on a patch the following error was thrown to the console -
> Use of uninitialized value $1 in regexp compilation at ./scripts/checkpatch.pl line 2653.
> This could be fixed.
>

That looks pretty sure like a bug.

> Please let me know your views on these ideas.

I suggest we look into issue 5 and 6.

For Issue 5: Can you provide me (and the CC: the list) the list of
false positives (the commit hashes) you found for issue 5 on
EXPORT_SYMBOL? Can you also provide a short rationale/explanation for
each case that you considered a false positive?

For Issue 6: Can you provide me the commit hash that caused this
checkpatch.pl error? Then, we can reproduce and confirm that issue
probably simply with `git format-patch -1 $SHA |
./scripts/checkpatch.pl` and observe the bug and crash ourselves?

(I added linux-kernel-mentees@lists.linuxfoundation.org back to the
recipient list.)
Also, on sending emails: you started the thread on
linux-kernel-mentees@lists.linuxfoundation.org. All further replies
shall always include that list in To or CC, so that the email thread
is complete on the list.

At some point in this mail thread, you only replied to me but did not
have the list in the recipient list (in To or CC). That was wrong;
Please follow the rule stated above. I hope this point was already
taught on the LF Kernel Development Introduction course. Maybe you can
check the material once again and see if and where that was pointed
out in the course material?

Thanks, waiting for response,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
