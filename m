Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997F2C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 10:20:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40AC22201
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 10:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWgT9OHb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40AC22201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5518886D53;
	Thu, 12 Nov 2020 10:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzHW7sYtCux5; Thu, 12 Nov 2020 10:20:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F65686D4E;
	Thu, 12 Nov 2020 10:20:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD1DC0889;
	Thu, 12 Nov 2020 10:20:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F3AAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 10:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8561F87674
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 10:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Vce4POm2a-M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 10:20:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DEB598766F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 10:20:04 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id z2so4722939ilh.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 02:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7sm+phFRvZCbUquFuFHN42KCKK8HzxTUhR1OG32Rz2k=;
 b=NWgT9OHb9HKPzkH+J+Yz4r2djJ2GzdkSetX0UFmWJKCyO+smVXQYfQJAaZUsnIPmG7
 E8b7u2vE0bDtJgLTZDqVSg6Me8v81auZ7k72JjLCUZY9D3je9GsiAaEl3HbesIr4N/4V
 UZc3pu1P9NzxymPvJZurIZI8p6BDH9ReGREkf4cIVF6uxjAj/RXK9RHksikUoYsywS7D
 wuoUzqMFdKXWLgkLGJd4ql17uC2J+NkxvYq+u3vBq0kUijCx+kM4Cpa1lw3yKTMN1Dvl
 GJjM1e2QUwqxkODQWOfR3MyC4bJp8kPOuO+zrs3dDIlihFyLZBgRbIdMZzGfaq2UjTbP
 Ls/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7sm+phFRvZCbUquFuFHN42KCKK8HzxTUhR1OG32Rz2k=;
 b=BNqW440tHKIyulxW7sh+U+sttpwyDeAB+CAgSYuDr3kbvCSpxiylc59ymXgICAtbPf
 T/YABxEvqE/Z2iD6OcEwi8B0xT3pgYNCST8D9ehy2wzRVpHE9NCL22nyBAzmbCyJ9orn
 6ajTOnv+qjgpju2CTxFn9lWosnIBir+iFL2Kap7IOaHyve0XR1uFcQHosaxQaqVBiXKd
 1D8CDqpHJBeKNA2e+Rv7GM6szBA+2jCz1qStMvQSd1fQh4aX46NB87QPz1Cqy4wIHPJN
 MqePJmYyPDztPBgg050EM8EZbguqL8JYNe5LeaFiB70VUZp48cozY2CyFDcg3MwRjvtd
 NVKg==
X-Gm-Message-State: AOAM530yiPPDXZsCwtYoQe/u41O6CbVqu4xNFZrMC/eIYAKKDJ6A9+En
 fdks3DPdNUU2mlYHH1ZszHBIrqaD89wTJSCAWpk=
X-Google-Smtp-Source: ABdhPJwO02DPCURbSzWAPL/6FSpuCZymOTrJ1p3qRsmWpzblgsc9XdpnU316iAu0iVBWSF6aXCorNowg5B3hjDFRZyA=
X-Received: by 2002:a92:cb51:: with SMTP id f17mr21527915ilq.64.1605176404114; 
 Thu, 12 Nov 2020 02:20:04 -0800 (PST)
MIME-Version: 1.0
References: <20201111191954.398-1-yashsri421@gmail.com>
 <CAKXUXMyxx=ncsSU1aTVo4bYrYf0hVr8195OU-MUKMT1Zv1K5jw@mail.gmail.com>
 <c93472a8-2fc1-5a74-dbe3-dc85c92175b5@gmail.com>
 <CAKXUXMzLOZYsptUUVQK0CF-FGPhHfJJwEepvA-0eBrL45HhMcw@mail.gmail.com>
 <262974f5-c839-d80c-a94b-dc8f8a93c82f@gmail.com>
In-Reply-To: <262974f5-c839-d80c-a94b-dc8f8a93c82f@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 12 Nov 2020 11:19:53 +0100
Message-ID: <CAKXUXMy8C56L1ja2DL_krEDdvjoUkOg3-K+qHYg7aT8VvB_8dA@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: avoid
 COMMIT_LOG_LONG_LINE warning for signature tags
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

On Thu, Nov 12, 2020 at 10:39 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 12/11/20 1:24 am, Lukas Bulwahn wrote:
> > On Wed, Nov 11, 2020 at 8:35 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 12/11/20 12:56 am, Lukas Bulwahn wrote:
> >>> On Wed, Nov 11, 2020 at 8:20 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
> >>>>
> >>>> Currently checkpatch warns us for long lines in commits even for
> >>>> signature tag lines.
> >>>>
> >>>> E.g., running checkpatch on commit 4bbdfe25600c ("IB/opa_vnic: Properly
> >>>> clear Mac Table Digest") reports this warning:
> >>>>
> >>>> WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
> >>>> Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> >>>>
> >>>> This is an example of false positive. Provide a fix by excluding
> >>>> signature tag lines from this class of warning.
> >>>>
> >>>> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> >>>> ---
> >>>>  scripts/checkpatch.pl | 2 ++
> >>>>  1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> >>>> index ac7e5ac80b58..1d257b1f4a4f 100755
> >>>> --- a/scripts/checkpatch.pl
> >>>> +++ b/scripts/checkpatch.pl
> >>>> @@ -2963,6 +2963,8 @@ sub process {
> >>>>                                         # filename then :
> >>>>                       $line =~ /^\s*(?:Fixes:|Link:)/i ||
> >>>>                                         # A Fixes: or Link: line
> >>>> +                     $line =~ /^\s*(?:$signature_tags)/ ||
> >>>> +                                       # signature tag line
> >>>
> >>> Can you simply add this check to the expression above?
> >>>
> >> Yes, we can do it. But then the match will become case insensitive
> >> (because of presence of '/i'). Should I do it irrespective?
> >>
> >
> > I see. Then keep it as is and start the evaluation.
> >
>
> I evaluated this patch on v5.6..v5.8 and generated the list of dropped
> warnings for commit_log_long_line here:
> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/dropped/summary.txt
>
> The difference in frequency is 17 (ie from 1896 to 1879)
>

Thanks, let us add this summary to the commit message;

Also I think we can drop the specific example and simply summarize why
the 17 cases are beyond 75 characters.

- Long names and long email addresses
- some comments on scoped review and acknowledgement, i.e., for a
dedicated pointer on what was reported by the identity in Reported-by:
- some additional comments on CC: stable@vger.kernel.org tags

You can also shorten this:

 This is an example of false positive. Provide a fix by excluding
signature tag lines from this class of warning.

to:

Exclude signature tag lines from this class of warning.


Send a reworked v2 for a quick review; then, you can probably send it
to Joe and lkml; as follow-up reply to your patch, you can direct add
the link to

 https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/signature_tags/dropped/summary.txt

Joe Perches can then quickly cross-check that evaluation as well.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
