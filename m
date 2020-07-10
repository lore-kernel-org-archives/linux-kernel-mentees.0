Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DDDC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 20:46:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9142078B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 20:46:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O4IoUek+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9142078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 620C389BEE;
	Fri, 10 Jul 2020 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqNYDY8SW1ES; Fri, 10 Jul 2020 20:46:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5D54E89BEA;
	Fri, 10 Jul 2020 20:46:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 35D9AC077B;
	Fri, 10 Jul 2020 20:46:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45E93C016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 20:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 15F552DDA2
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 20:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEgMyNQLRwqr
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 20:46:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 9EE972DAE6
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 20:46:39 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id l63so5837364oih.13
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 13:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=L6BDPgT01JqwuzKtHyowMTMOS1mtEyV+yHjWbqswd44=;
 b=O4IoUek+0JOTdlnJrkT0iym9++tqRwSn7KMyxo4OgHSiFGiKGlSjpSwckCYfTX0aYw
 QCA5rxdtcHhLURperaJo/kZ61XuilrkXVpb0kGhdVW2RS9Iy/ObyiNEaPkrRCirb1cDV
 7JyAJEaqaWhun6Ez1Bm8XxrYX4XMVBwjZVhmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L6BDPgT01JqwuzKtHyowMTMOS1mtEyV+yHjWbqswd44=;
 b=lT+vOj/7uJh78QDkIx4LlH5LR94jCwUs6wWmSfpfDcg379VSK55cAhNFrkx7euRZMt
 2cldsvZU3Mvw36z/RvHlZF4QYYdUPmV99W1EoH6UKsd0871ktAqueLceyZhNXBlCHyjk
 xOeP6wS/cGgWrxA2zHjC0okqL0GVJW6oiDLGUpwwsBDo9qL3FrB1SuIkK/0teH087bdL
 RJdmx/NeYEgVl9+lVZK0FqWOwnQ0fqeuU1+Pr3Z7WIHxN8xZSSV14n5oap/njZJLhRn5
 +e22K43h5rFi/gzWthy+zLaEyBxPkjPgqucq5ezafOHSBY/pyPo1DcMmVQb/Ousi5Q2H
 AVbw==
X-Gm-Message-State: AOAM531XKNjdOjX6EwP6711fm5MTKQJIzAdpeH7nDe8VBSl6HI5vPC6S
 8S6Xsa1fF1e2x9Obmuy+dfKlkyHD
X-Google-Smtp-Source: ABdhPJzB1o58O1u0GYa44/SRhuVULu1yNMc64Rz8h2ZFCYiDBZOJJj4asG1x6asgjgkRlDfLO8dC6g==
X-Received: by 2002:aca:e0d6:: with SMTP id x205mr5637653oig.176.1594413998678; 
 Fri, 10 Jul 2020 13:46:38 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id j16sm1294553otl.0.2020.07.10.13.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 13:46:37 -0700 (PDT)
To: Mrinal Pandey <mrinalmni@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Linux-kernel-mentees@lists.linuxfoundation.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <844f8a74-0a95-216b-3785-79ab161a00e7@linuxfoundation.org>
Date: Fri, 10 Jul 2020 14:46:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/10/20 5:26 AM, Mrinal Pandey wrote:
> On Thu, Jul 9, 2020 at 10:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com 
> <mailto:lukas.bulwahn@gmail.com>> wrote:
> 
>     On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey <mrinalmni@gmail.com
>     <mailto:mrinalmni@gmail.com>> wrote:
>      >
>      > On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn
>     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
>      >>
>      >> On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey
>     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
>      >> >
>      >> >
>      >> >
>      >> > On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn
>     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
>      >> >>
>      >> >> On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey
>     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
>      >> >> >
>      >> >> > checkpatch.pl <http://checkpatch.pl> issues warnings on the
>     commits
>      >> >> > made to scripts/spelling.txt for new entries
>      >> >> > of typos and their fixes. This commit adjusts
>      >> >> > checkpatch not to complain about the same.
>      >> >> >
>      >> >> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com
>     <mailto:mrinalmni@gmail.com>>
>      >> >> > ---
>      >> >>
>      >> >> How often does that issue appear? Can you use your checkpatch
>      >> >> evaluation to show that it is relevant?
>      >> >
>      >>
>      >> How many commits to spelling.txt happened within the last year?
>      >
>      >
>      > Sir,
>      >
>      > I could find only commit to the file in the range 5.7 to 5.8.rc-1.
>      >>
>      >>
>      >> The patch might be accepted, but the reason is not that convincing.
>      >
>      >
>      > What do you suggest? Should I send it or not?
>      >
> 
>     Let us keep that in the backlog for now, but not send it. If it is
>     only one single case among hundreds false positives, it is maybe not
>     the best to start with.
>     We might get to that one case here eventually, but let us start with
>     the more important and critical cases first.
> 
> 
>      >> Maybe you can find another class of false positives that happen more
>      >> often?
>      >
>      >
>      > Yes, I have a few other suggestions that I found occurring often
>     and I'm still evaluating to find more:
>      > 1. In `.h` files, when we write a function prototype, the name of
>     the function parameters are
>      > not required, only the data type is enough, checkpatch says to
>     define the name of the parameters too.
>      > Issues a warning like - function definition argument '<arg>'
>     should also have an identifier name
>      >
> 
>     Okay, we need to discuss if that is a convention that developers care
>     about or not.
> 
> 
>      > 2. A very common warning is - Macros with complex values should
>     be enclosed in parentheses
>      > which is correct sometimes but a false positive many times, for
>     macros ending with `)` or
>      > macros like `#define var value` we probably don't need another
>     pair of `()`
>      >
> 
>     Agree, this might be worth refining in checkpatch as you described.
> 
>      > 3. checkpatch complains about breaking a quoted string across
>     lines but this is many a time
>      > necessary for readability and in most of the patches I saw the
>     strings broken.
>      >
> 
>     Tricky to really know what the best solution is here. It is a tradeoff
>     in both directions.
>     Let us put that aside for now.
> 
>      > 4. There are many patches where checkpatch issues false positives
>     regarding spaces before
>      > and after lines.
>      >
>     Why are they false positives?
> 
> 
> Sir,
> 
> The warning by checkpatch says - please, no spaces at the start of a line
> but there are indeed no spaces before the line where this warning is issued.
> There are multiple commits having this issue, two of them are 
> `acaab7335bd6` and `372b38ea5911`.
> 
> 
>      > 5. The warning - EXPORT_SYMBOL(foo); should immediately follow
>     its function/variable
>      > is falsely positive in many cases where the statement is correct
>     but the script fails to identify it.
>      >
> 
>     If the script does not detect that, it sounds like a bug.
>     This can be improved for checkpatch.pl <http://checkpatch.pl>.
> 
>      > 6. While running checkpatch on a patch the following error was
>     thrown to the console -
>      > Use of uninitialized value $1 in regexp compilation at
>     ./scripts/checkpatch.pl <http://checkpatch.pl> line 2653.
>      > This could be fixed.
>      >
> 
>     That looks pretty sure like a bug.
> 
>      > Please let me know your views on these ideas.
> 
>     I suggest we look into issue 5 and 6.
> 
>     For Issue 5: Can you provide me (and the CC: the list) the list of
>     false positives (the commit hashes) you found for issue 5 on
>     EXPORT_SYMBOL?
> 
> 
> Here are the commit hashes for which the warning is issued:
> 54505a1e2083
> 75d75b7a4d54
> 8084c99b9af6
> bfdaf029c9c9
> dfd402a4c4ba
> 
>     Can you also provide a short rationale/explanation for
>     each case that you considered a false positive?
> 
> 
> In each case the `EXPORT_SYMBOL()` is correctly written and the 
> variable/function to be exported
> is also inside the parentheses, still, we get the warning. Please let me 
> know if I am wrong here.
> 
> 
>     For Issue 6: Can you provide me the commit hash that caused this
>     checkpatch.pl <http://checkpatch.pl> error? Then, we can reproduce
>     and confirm that issue
>     probably simply with `git format-patch -1 $SHA |
>     ./scripts/checkpatch.pl <http://checkpatch.pl>` and observe the bug
>     and crash ourselves?
> 
> 
> These are the commit hashes that crashed the checkpatch:
> 6b3e0e2e0461
> 19ce2321739d
> 059c6d68cfc5
> 
> 
>     (I added linux-kernel-mentees@lists.linuxfoundation.org
>     <mailto:linux-kernel-mentees@lists.linuxfoundation.org> back to the
>     recipient list.)
>     Also, on sending emails: you started the thread on
>     linux-kernel-mentees@lists.linuxfoundation.org
>     <mailto:linux-kernel-mentees@lists.linuxfoundation.org>. All further
>     replies
>     shall always include that list in To or CC, so that the email thread
>     is complete on the list.
> 
>     At some point in this mail thread, you only replied to me but did not
>     have the list in the recipient list (in To or CC). That was wrong;
>     Please follow the rule stated above. I hope this point was already
>     taught on the LF Kernel Development Introduction course. Maybe you can
>     check the material once again and see if and where that was pointed
>     out in the course material?
> 
> 
> Sir, I apologize for not including the list in my previous replies. 
> Unfortunately, it slipped out of my mind.
> I assure you it would not happen again. Also, Linux Kernel Mentorship 
> wiki says to CC the overall
> program mentor Shuah Khan Ma'am on each contribution. Should I do it 
> only on the final patches or on
> every mail I send?
> 

No worries. You are new and this is a learning process.

Please cc me on emails. You have to reply to the list when you respond
to patch reviews.

Please run get_maintainers.pl and include everybody get_maintainers.pl
suggests. Without doing so will add more work for you when you send
it to the community.

Please review LFD103 sections that talk about submitting patches and
also refer to the kernel documentation.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
