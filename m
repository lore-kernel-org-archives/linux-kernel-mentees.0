Return-Path: <SRS0=/60u=EZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1933DC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 05:53:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 630E122363
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 19 Nov 2020 05:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jH2gyH96"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 630E122363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BECE98736A;
	Thu, 19 Nov 2020 05:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q9hF1+S3JV9i; Thu, 19 Nov 2020 05:53:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F19C387346;
	Thu, 19 Nov 2020 05:53:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9579C0800;
	Thu, 19 Nov 2020 05:53:39 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C55AC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 05:53:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E41D286943
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 05:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Eof6ZSbOV_s5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 05:53:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E941486942
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 19 Nov 2020 05:53:35 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id j23so4707996iog.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 18 Nov 2020 21:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uT3dsrmLRIP0PLmH8JCODUhIJBcvDW3VUAGF//MsSaE=;
 b=jH2gyH96hPJ81LuRvfCe1u/e6QSRvC6lIK2KNoThFvEzTLp1B8S90BBYDFEyxtpeC0
 3W04n0KwuEb3wc92GD+vcL+sz5YWLavAn4tkJNZzliCIHw+9rfmv9SpHJG18geuz4oMG
 mKRxdNRPqZMmO+Hqo1+j+H2ee7vGbeFckcKWRU8VSV/NmRbG5MkLBCqGsOieDJ21w6IZ
 CXVBX3dFJkMwjwnuoxE8WGOXMZattWBFzN8XpJze42+K8neJedRHerg/MGWgAC4ba0QQ
 e/tjLCH/rXlA3EdGZ3R1WnAaPWKbYTOYGopVNIsTsJ++P0VWNytdiqXQVNEjwcuDGHeW
 VrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uT3dsrmLRIP0PLmH8JCODUhIJBcvDW3VUAGF//MsSaE=;
 b=KfwBCCxCxxaC6GQ1oJXX6yDAbPwX2pinhbHB4acZJ25IJ0mW575Fh6KVR4xl0oZOAI
 YpjNcDdn2zGJubW4SJ1jeTh/5MmxqxaNyY1gZVb984nPObtg785eR5pYoc13MSMXToOm
 7/0iQ/gLLEptRFnsdVkP6sd5Oics73ExIAfJX01usDAKyjJdWHjldHlcrZlV+kmsYQZ3
 aX9VoMxrQ/At9ELuson32kfrq+2qbHdrEmImQcuQdu/kLPpBN1uu3uG4Sy79Bh0YqgJa
 UMfa7kR0CnHslh1W68OJJ3aNTrZwiCdrT/R7+3kyVYzk8oxlGL0HEgrWPP65wg5jiayG
 uiKQ==
X-Gm-Message-State: AOAM533Clkna4rGACMAxFVeNCUGoJski2AZeNAYLbI8X8gxIBL5NDs1f
 eoEeUXp67t5RL1dbXmFvAy1nDopgZuRhiYAuGsw=
X-Google-Smtp-Source: ABdhPJzj0KPd9txjFAdFwNORpIWZ3zgNA5u0P7FlrO+JL8rPGuUrAQVK6vRRE6mZwWtKhSJiOKphpceBVy03gfGOMLk=
X-Received: by 2002:a05:6638:41a:: with SMTP id
 q26mr12880569jap.27.1605765215036; 
 Wed, 18 Nov 2020 21:53:35 -0800 (PST)
MIME-Version: 1.0
References: <50c8be3c-fceb-255b-43ba-1ce8284ab410@gmail.com>
 <CAKXUXMw2=4E8XpZFx04pkBmvwDSpcCedxE2ndX4DX5DTek_06g@mail.gmail.com>
 <ed152561-0932-65e2-fc86-3540fc456b09@gmail.com>
 <483df3b1-219c-129e-2c88-5411e012a9e1@gmail.com>
 <CAKXUXMx4-2-=XkXkvUcx6GuNmwfkSyYbOWc04uXkFgnHxsNNvQ@mail.gmail.com>
 <31eeb998-0f1a-5ae2-fd0a-62fd1cf3349b@gmail.com>
 <bde0d09e-39fb-234c-c7b3-42d859414794@gmail.com>
 <CAKXUXMwsUYgg+oOADM3wrryr2Vob_Yo1YX-ms5eKCeCAx7HTpw@mail.gmail.com>
 <050ddb53-33ff-83bc-7f91-b7c2874211f6@gmail.com>
 <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
In-Reply-To: <056fae30-efa1-7758-c4bb-04bb90a03f8a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 19 Nov 2020 06:53:24 +0100
Message-ID: <CAKXUXMwX5=+ri9uCMbqa6HNyt7JRN=048zo7GaXt1PAVRPzizQ@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Fix for BAD_SIGN_OFF: non-standard
	signature
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

> >> Goal 1: Try to map all the non-default signatures to their "standard"
> >> counterpart as much as possible.
> >>
> >> Goal 2: Introduce a few very little signatures to handle those cases
> >> that really cannot be mapped to a non-default signature.
> >>
> >> Provide good rationales that you can defend and provide documentation
> >> for when checkpatch shall explain the fix it proposes.
> >>
> >> Here an example for the first ten cases:
> >>
> >> 1)Debugged-by: 61 -> Codeveloped-by:
> >>
> >> Rationale: Debugging is part of Software Development; so
> >> Codeveloped-by is perfectly fine, even if the contributor did not
> >> create code.
> >>
> >> (alternatively: maybe a new Assisted-by would do here.)
> >>
> >> 2)Requested-by: 48 -> Suggested-by:
> >>
> >> Rationale: In an open-source project, there are "no requests", just
> >> "suggestions" to convince a maintainer to accept your patch.
> >>
> >> 3)Co-authored-by: 43 -> Codeveloped-by:
> >>
> >> Rationale: clear. Codeveloped-by and Co-authored-by are synonyms.
> >>
> >> 4)Originally-by: 39
> >>
> >> Maybe something like this deserves to be a new tag. There is a
> >> significant difference to codeveloped-by. But that needs discussion.
> >>
> >> 5)Analyzed-by: 22
> >>
> >> Rationale: Analyzing is part of Software Development; so
> >> Codeveloped-by is perfectly fine, even if the contributor did not
> >> create code.
> >> (alternatively: maybe a new Assisted-by would do here.)
> >>
> >> 6)Bisected-by: 20
> >>
> >> Difficult...
> >> (maybe a new Assisted-by would do here.)
> >>
> >> 7)Improvements-by: 19 -> Codeveloped-by:
> >>
> >> 8)Generated-by: 17 -> Reported-by: ?
> >>
> >> What does generated-by actually mean?
> >>
> >> 9)Noticed-by: 11 -> Reported-by:
> >>
> >> 10)Inspired-by: 11 -> Suggested-by:
> >>
> >> Maybe you can come up with a list for the next twenty and then we
> >> discuss them with Joe Perches and then a larger group?
> >>
>
> This is the list for next 20:
>
> 11)Original-patch-by: 11 -> co-developed-by / Originally-by (a new
> signoff)
> Rationale: I checked mailing list for one of these signoffs.
> Link1:
> https://lore.kernel.org/linux-perf-users/20190221122306.1511-1-jonas.rabenstein@studium.uni-erlangen.de/
> Link2:
> https://lore.kernel.org/linux-perf-users/20190307174433.28819-32-acme@kernel.org/
>
> Here it seems like someone who started working on the patch but
> couldn't complete it, but still has
> significant contribution in the patch.
> Maybe signing off as codeveloper suffices the purpose. I'm not sure though
>

Agree, that is up for discussion. Either co-developed-by or one new tag.

> 12)Diagnosed-by: 11 -> Maybe 'Reviewed-by' or 'Acked-by'
> Rationale: Observed a few mailing lists, eg here:
> https://lore.kernel.org/lkml/20190609164128.000227333@linuxfoundation.org/
> But could not decide as the user is not adding it along the mails, but
> seems like a maintainer.
>

I do not think Acked-by, maybe co-developed-by or reviewed-by.

> 13)Based-on-a-patch-by: 8 -> Similar to 'Originally-by'
>
> 14)Verified-by: 8 -> Tested-by
> Rationale: Used by a single user. On reading, mailing list, it seems
> that 'Tested-by' tag might be a suitable alternative.
> Link:
> https://lore.kernel.org/lkml/CA+jURcugFhSt9GGRZELQUCnupOf2Ns96Ao5ZruWfVtq=z_7ytw@mail.gmail.com/
>

Agree.

> 15)Okay-ished-by: 8 -> Acked-by
> Rationale: Used by a single user. On reading, mailing list, it seems
> that 'Acked-by' tag might be a suitable alternative.
> Link:
> https://lore.kernel.org/lkml/f06e74e9a38b83ec273196bce727295b828c5870.1507769413.git.rgb@redhat.com/
>

Agree.

> 16)Based-on-patch-by: 7 -> Similar to (13) Based-on-a-patch-by
>

Agree.

> 17)Root-caused-by: 6 -> Maybe 'Fixes:' followed by the commit it is
> fixing.
> Rationale: Going through mailing list, it comes up added with the
> patch. So I couldn't be sure
>

Hmm... you need to show me the cases where this tag is used.

If the tag is not followed by an identity (name + email), it should
not be a signature tag anyway.

> 18)Original-by: 6 -> Similar to '(4)Originally-by'
>

Agree.

> 19)Acked-for-MFD-by: 6 -> Acked-by:
>

Agree.

> 20)Reviewed-off-by: 5 -> Reviewed-by:
>

Agree.

> 21)Based-on-patches-by: 5 -> Similar to (13)
>

Agree.

> 22)Analysed-by: 5 -> Co-developed-by/Reviewed-by
> Rationale: Similar to '(5)Analyzed-by'
>

Agree.

> 23)Based-on-work-by: 5 -> Not sure. Maybe 'Suggested-by'
>

Or similar to 13?

> 24)Proposed-by: 5 -> Maybe 'Suggested-by'
> Rationale: The tag comes up added with the patch,and the user is also
> given the tag 'Signed-off-by', but does not seem to participate in the
> conversation.
> Maybe he is a maintainer, who suggested the patch.
> mailing list:
> https://lore.kernel.org/linux-nvme/20200501212545.21856-3-sagi@grimberg.me/
>

Agree.

> 25)Reported-and-bisected-by: 4 -> Two different tags: 'Reported-by:'
> and 'Bisected-by'
>

Agree.

> 26)Fixed-by: 3 -> Co-developed-by
> Rationale: I observed one of these commit conservations here:
> https://lore.kernel.org/lkml/1b45ffd1-99bb-4ac1-fb65-0de3e42c1c0a@amd.com/
> It seems like there was some bug with this patch, which was fixed by
> the user. I guess Co-developed-by should go well as alternative.
>

Agree.

> 27)Pointed-out-by: 3 -> Suggested-by
> Rationale: For commit 87bd4c26a6c8 ("clocksource/drivers/tegra: Lower
> clocksource rating for some Tegra's"), this warning occurs, where
> the patch is also 'Acked-by' Peter De Schrijver. So, it seems like he
> is a maintainer who must have suggested these changes
>

Agree.

> 28)Suggestions-by: 3 -> Suggested-by
>

Agree.

> 29)Celebrated-by: 3 -> Might be suggested to remove
> Rationale: This tag is used for a single commit 3 times, seems like a
> tag used for celebration of a particular patch
> Link:
> https://lore.kernel.org/lkml/CANRm+CyonYOzGdXo+D8gr8n04=f=S92QH-HxETKnoGGxhMFREA@mail.gmail.com/
>

Agree. Let us suggest deleting such tags.

> 30)Pointed-at-by: 2 -> Suggested-by
> Rationale: One of these tags is named for Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>, who is probably a maintainer.
> Here, the user might just want to acknowledge him for his suggestion,
> so 'Suggested-by' seems appropriate.
>

Agree.

> What do you think?
>

Can you start to implement a patch that creates the basic logic to let
checkpatch.pl suggest the alternatives for those 30 cases above.

Also, it might be good if checkpatch.pl also provides the explanation
why that alternative is proposed (when it is not totally obvious).

Can you also summarize which of the 30 cases need a further discussion with Joe?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
