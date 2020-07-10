Return-Path: <SRS0=4Ypl=AV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB92C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:16:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DFAB20748
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jul 2020 21:16:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnIY2fSB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DFAB20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C41489B02;
	Fri, 10 Jul 2020 21:16:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4kSF0l9hbYx; Fri, 10 Jul 2020 21:16:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C79CC89B0E;
	Fri, 10 Jul 2020 21:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA966C0890;
	Fri, 10 Jul 2020 21:16:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8589BC016F
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5039187FBF
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKsEyie-WIjZ
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5687787D57
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 21:16:09 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y2so7483599ioy.3
 for <Linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jul 2020 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9y7WfAQnvgTaLJ1Cq87za+9W2T6c6fmGFJIh1pgYrQE=;
 b=bnIY2fSBDRxFoNqja3th8/wPXzJgw65QZwOYAljTVhiPHGTkPisod0EGlvV6XHSP21
 fgs0m5xudp3E0Hny2vhgrC3BbzBqMqWXJUkx2BWLMxgxhRc6Kf/IfMhlNtGTJZtjp5/w
 fUsK4ONal/yEq/51f3Fgx0XdTeMnqDMUR+RCykz+I0npLXmI1KoQW/209hGoSSScwNGA
 shUjF4sz6uH5LvtFzhmo95Ijcy9W5gEbbwhArxD0xpEmLPaZqCMs4EFtrM/QLXW4L4wl
 AHXz/Ncltk45hhX6/iI8batsXFmB7EI/rZ0yE4727ik5x2C66yGgEdRoTMygH1o7kIgh
 HaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9y7WfAQnvgTaLJ1Cq87za+9W2T6c6fmGFJIh1pgYrQE=;
 b=QSLIiB5eGwhRowgzne/iibYwCOmKkCmEFQor2uwByXuY/6LBgZ8nQWAur58kFd/6QQ
 4qsb4STbujDa0TlRC7TfDn0L2JjOSCLuTftL0NILg+PZwuJiLK2ahwLEXvnGEqP7K+0R
 gyFj79NkSS46rYNsYXjuE4iHhJTkGro0tuLjii9fNTUAMTw26/fKvCpfkG+hx56adD1x
 H34ddx3MPNLNoZLNl8SaWQM852wyifIPJUhuYW3Kw6cAE2lajaqCm72y387h3HbQc1r7
 U6vobMdox1w53B7Q7DPM2518rv9Clt3B4uV4WhMrHc/aZaTnPO/L6ATJLngDX0F48hmR
 shzw==
X-Gm-Message-State: AOAM530zxbKS4t7qpGy/8eAFMxVQ8jsZG5No7pnPZRw64/6yIy2l+ld1
 hfE4m74UTo3FfXggqtXPI4iYOp9nAK0tg/ALnQg=
X-Google-Smtp-Source: ABdhPJzYfTR3RaeycL/NhBmiH36qU0FoZ0EdL6YgK51hBWXgQxZXBj8/2kKZYFZLSRW/S4YiP2X31Yli5z3GgVnv5ns=
X-Received: by 2002:a6b:5c07:: with SMTP id z7mr50700919ioh.140.1594415768440; 
 Fri, 10 Jul 2020 14:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200706080814.of3oftqsbp32nwge@mrinalpandey>
 <CAKXUXMzUGMVEWxBmrsPWvtBTuM=7W1uZWRp4OUN4ZPeqX8=VHA@mail.gmail.com>
 <CAD1=X6m06KWb3=VEGkFWpmmV=UC09ZYbj2qpAOyg6OPFM=8KqA@mail.gmail.com>
 <CAKXUXMy_KAHn+FNWviazVcEqK213uLVksq8_8HhjXAW+_OBrzQ@mail.gmail.com>
 <CAD1=X6==MgT6jaNZ9PsPUqV1QTRFKguq9zvV+TtFSHyajFMjUg@mail.gmail.com>
 <CAKXUXMwU21sUTA6vSm19oFF42eX3dxuBEG-cgSoUQBWcYJDOiQ@mail.gmail.com>
 <CAD1=X6mM0cA-8aVO4YaLiUbSnkw0EKCijL12bDWxNfUCaCh87g@mail.gmail.com>
 <844f8a74-0a95-216b-3785-79ab161a00e7@linuxfoundation.org>
In-Reply-To: <844f8a74-0a95-216b-3785-79ab161a00e7@linuxfoundation.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 10 Jul 2020 23:15:57 +0200
Message-ID: <CAKXUXMyXnch8EHoEvm=1MbEREfpNv-r_QPTD6=h3HKWkQj5v=w@mail.gmail.com>
To: Shuah Khan <skhan@linuxfoundation.org>
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

On Fri, Jul 10, 2020 at 10:46 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 7/10/20 5:26 AM, Mrinal Pandey wrote:
> > On Thu, Jul 9, 2020 at 10:33 AM Lukas Bulwahn <lukas.bulwahn@gmail.com
> > <mailto:lukas.bulwahn@gmail.com>> wrote:
> >
> >     On Thu, Jul 9, 2020 at 6:31 AM Mrinal Pandey <mrinalmni@gmail.com
> >     <mailto:mrinalmni@gmail.com>> wrote:
> >      >
> >      > On Tue, Jul 7, 2020 at 10:24 PM Lukas Bulwahn
> >     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
> >      >>
> >      >> On Tue, Jul 7, 2020 at 10:22 AM Mrinal Pandey
> >     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
> >      >> >
> >      >> >
> >      >> >
> >      >> > On Tue, Jul 7, 2020 at 1:20 AM Lukas Bulwahn
> >     <lukas.bulwahn@gmail.com <mailto:lukas.bulwahn@gmail.com>> wrote:
> >      >> >>
> >      >> >> On Mon, Jul 6, 2020 at 10:08 AM Mrinal Pandey
> >     <mrinalmni@gmail.com <mailto:mrinalmni@gmail.com>> wrote:
> >      >> >> >
> >      >> >> > checkpatch.pl <http://checkpatch.pl> issues warnings on the
> >     commits
> >      >> >> > made to scripts/spelling.txt for new entries
> >      >> >> > of typos and their fixes. This commit adjusts
> >      >> >> > checkpatch not to complain about the same.
> >      >> >> >
> >      >> >> > Signed-off-by: Mrinal Pandey <mrinalmni@gmail.com
> >     <mailto:mrinalmni@gmail.com>>
> >      >> >> > ---
> >      >> >>
> >      >> >> How often does that issue appear? Can you use your checkpatch
> >      >> >> evaluation to show that it is relevant?
> >      >> >
> >      >>
> >      >> How many commits to spelling.txt happened within the last year?
> >      >
> >      >
> >      > Sir,
> >      >
> >      > I could find only commit to the file in the range 5.7 to 5.8.rc-1.
> >      >>
> >      >>
> >      >> The patch might be accepted, but the reason is not that convincing.
> >      >
> >      >
> >      > What do you suggest? Should I send it or not?
> >      >
> >
> >     Let us keep that in the backlog for now, but not send it. If it is
> >     only one single case among hundreds false positives, it is maybe not
> >     the best to start with.
> >     We might get to that one case here eventually, but let us start with
> >     the more important and critical cases first.
> >
> >
> >      >> Maybe you can find another class of false positives that happen more
> >      >> often?
> >      >
> >      >
> >      > Yes, I have a few other suggestions that I found occurring often
> >     and I'm still evaluating to find more:
> >      > 1. In `.h` files, when we write a function prototype, the name of
> >     the function parameters are
> >      > not required, only the data type is enough, checkpatch says to
> >     define the name of the parameters too.
> >      > Issues a warning like - function definition argument '<arg>'
> >     should also have an identifier name
> >      >
> >
> >     Okay, we need to discuss if that is a convention that developers care
> >     about or not.
> >
> >
> >      > 2. A very common warning is - Macros with complex values should
> >     be enclosed in parentheses
> >      > which is correct sometimes but a false positive many times, for
> >     macros ending with `)` or
> >      > macros like `#define var value` we probably don't need another
> >     pair of `()`
> >      >
> >
> >     Agree, this might be worth refining in checkpatch as you described.
> >
> >      > 3. checkpatch complains about breaking a quoted string across
> >     lines but this is many a time
> >      > necessary for readability and in most of the patches I saw the
> >     strings broken.
> >      >
> >
> >     Tricky to really know what the best solution is here. It is a tradeoff
> >     in both directions.
> >     Let us put that aside for now.
> >
> >      > 4. There are many patches where checkpatch issues false positives
> >     regarding spaces before
> >      > and after lines.
> >      >
> >     Why are they false positives?
> >
> >
> > Sir,
> >
> > The warning by checkpatch says - please, no spaces at the start of a line
> > but there are indeed no spaces before the line where this warning is issued.
> > There are multiple commits having this issue, two of them are
> > `acaab7335bd6` and `372b38ea5911`.
> >
> >
> >      > 5. The warning - EXPORT_SYMBOL(foo); should immediately follow
> >     its function/variable
> >      > is falsely positive in many cases where the statement is correct
> >     but the script fails to identify it.
> >      >
> >
> >     If the script does not detect that, it sounds like a bug.
> >     This can be improved for checkpatch.pl <http://checkpatch.pl>.
> >
> >      > 6. While running checkpatch on a patch the following error was
> >     thrown to the console -
> >      > Use of uninitialized value $1 in regexp compilation at
> >     ./scripts/checkpatch.pl <http://checkpatch.pl> line 2653.
> >      > This could be fixed.
> >      >
> >
> >     That looks pretty sure like a bug.
> >
> >      > Please let me know your views on these ideas.
> >
> >     I suggest we look into issue 5 and 6.
> >
> >     For Issue 5: Can you provide me (and the CC: the list) the list of
> >     false positives (the commit hashes) you found for issue 5 on
> >     EXPORT_SYMBOL?
> >
> >
> > Here are the commit hashes for which the warning is issued:
> > 54505a1e2083
> > 75d75b7a4d54
> > 8084c99b9af6
> > bfdaf029c9c9
> > dfd402a4c4ba
> >
> >     Can you also provide a short rationale/explanation for
> >     each case that you considered a false positive?
> >
> >
> > In each case the `EXPORT_SYMBOL()` is correctly written and the
> > variable/function to be exported
> > is also inside the parentheses, still, we get the warning. Please let me
> > know if I am wrong here.
> >
> >
> >     For Issue 6: Can you provide me the commit hash that caused this
> >     checkpatch.pl <http://checkpatch.pl> error? Then, we can reproduce
> >     and confirm that issue
> >     probably simply with `git format-patch -1 $SHA |
> >     ./scripts/checkpatch.pl <http://checkpatch.pl>` and observe the bug
> >     and crash ourselves?
> >
> >
> > These are the commit hashes that crashed the checkpatch:
> > 6b3e0e2e0461
> > 19ce2321739d
> > 059c6d68cfc5
> >
> >
> >     (I added linux-kernel-mentees@lists.linuxfoundation.org
> >     <mailto:linux-kernel-mentees@lists.linuxfoundation.org> back to the
> >     recipient list.)
> >     Also, on sending emails: you started the thread on
> >     linux-kernel-mentees@lists.linuxfoundation.org
> >     <mailto:linux-kernel-mentees@lists.linuxfoundation.org>. All further
> >     replies
> >     shall always include that list in To or CC, so that the email thread
> >     is complete on the list.
> >
> >     At some point in this mail thread, you only replied to me but did not
> >     have the list in the recipient list (in To or CC). That was wrong;
> >     Please follow the rule stated above. I hope this point was already
> >     taught on the LF Kernel Development Introduction course. Maybe you can
> >     check the material once again and see if and where that was pointed
> >     out in the course material?
> >
> >
> > Sir, I apologize for not including the list in my previous replies.
> > Unfortunately, it slipped out of my mind.
> > I assure you it would not happen again. Also, Linux Kernel Mentorship
> > wiki says to CC the overall
> > program mentor Shuah Khan Ma'am on each contribution. Should I do it
> > only on the final patches or on
> > every mail I send?
> >
>
> No worries. You are new and this is a learning process.
>
> Please cc me on emails. You have to reply to the list when you respond
> to patch reviews.
>
> Please run get_maintainers.pl and include everybody get_maintainers.pl
> suggests. Without doing so will add more work for you when you send
> it to the community.
>

Mrinal, please first send these suggested patches only to me, Shuah
and the linux-kernel-mentees list for reviewing.

If I am okay with a specific patch, I will let you know to then send
the patch to everybody get_maintainers.pl suggest, which will be for
the patches we discuss:

Andy Whitcroft <apw@canonical.com> (maintainer:CHECKPATCH)
Joe Perches <joe@perches.com> (maintainer:CHECKPATCH)
linux-kernel@vger.kernel.org (open list)

I want to make sure that I agree with the patch before sending it to
Andy and Joe.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
