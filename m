Return-Path: <SRS0=9pg8=FE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45867C63777
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:57:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B32E82067C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Nov 2020 16:57:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bEqlOa1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B32E82067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DA3586B39;
	Mon, 30 Nov 2020 16:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OY7kJNnRNWpx; Mon, 30 Nov 2020 16:57:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4631C86A6A;
	Mon, 30 Nov 2020 16:57:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BD07C163C;
	Mon, 30 Nov 2020 16:57:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8AF9FC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7230287252
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZwiQt651mTJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:57:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CD0C87250
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 16:57:18 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id t8so12463891iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 08:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m39cck9CFNxHEsl7P8Qbnbpx+el4IoSL+iTsiiX2Q6E=;
 b=bEqlOa1PwA0NKKYcau6rgFBYU/+BWUDjrpr0v6PMCFbsZkyv6jT79ONTeXeGvPt0Z0
 xpY3NMc2LPo8gkHLMQ2Y+lyQUJXLrZGwt2r8qW4Q5HzqjA3iwEl4NtZmDQciGNEVf+VD
 hfTi/ALHQaVg4Et4qFlmMOivPLI5Ws76sXOaNK+B6vYZIxGe9mswlA3h3ATIWUuMGlId
 hq5z7/mWuueogdZyA/hSQsoCYjHL4WSTVWQm0c3go9M8D4XT78m7IcyT+bsiyL/KDCNX
 MLQDkUvyh4IiW8Z8ke/yNXA2CNl+bpp2hLLgmBui3g+kHivZQcXinWFU9bVGqUPxIkGw
 VdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m39cck9CFNxHEsl7P8Qbnbpx+el4IoSL+iTsiiX2Q6E=;
 b=kPB9J6R/niO57UEfICTCWKMmNSrmEvg7hRzQ9KESN1GjPruoL4KgQSpx0/xlP5GGzP
 SYlicN9jkQ3D3YTS78owbH+FBF6tUIRLcuni6n+Mvt8ha9JcxsNaMlKiR6etyDTFCeYQ
 GDICnzohvLStzTYlmXpQl4ag65qCPkujkJyifmeLD8cWKWCEGUwkBalyULi+n3GSqzHX
 8oWkOyQz6k3oPtO+atGVKE6y6Jbgnm043m0ubTCBUHVhsdDWGB3wPW2HmbSA5i/n0gSt
 Upr8pE475CuBYaZBH4d9cO+src8kpAFxqGEGT1TYMcL/U6P3eIzyi6NHcBHulPz2+1KR
 Rjag==
X-Gm-Message-State: AOAM5330wo0OK6if5r7kX19KDRsZYGHEyCMcoOQn5PVqujfXNi9ibD+0
 Wk+ip00JK6wAs8XVN1WvRxA2M27sHTEHsvc5e3s=
X-Google-Smtp-Source: ABdhPJxsMDadfAbFkoMURRzlBqmBxU6gNKDkx/ICEetTv/IRWFI2pByUzaaiCcpcG8t50jy8iFg9wqYdpzGVbyAp4Vw=
X-Received: by 2002:a02:ba90:: with SMTP id g16mr19892033jao.96.1606755437631; 
 Mon, 30 Nov 2020 08:57:17 -0800 (PST)
MIME-Version: 1.0
References: <357371d0-a445-181a-3565-a3ec0debc622@gmail.com>
 <20201118173950.32660-1-yashsri421@gmail.com>
 <CAKXUXMw=NnO4pU01bmTH+pkLckcJzByPktGJPuLf9st+x4VbXQ@mail.gmail.com>
 <30d4ab51-41e7-d535-7cb2-5ae9d02cf58b@gmail.com>
 <CAKXUXMx9J4uJcjsUXQS0heV80qf6d0OgzJ-0kHtimW7nd3dXKw@mail.gmail.com>
 <b2d1808d-1657-67c8-507e-b317b1ad86e8@gmail.com>
 <CAKXUXMxA9jR00-qv7ng748hCx5GVN6zvR9uHfYQTdf0D35ju8Q@mail.gmail.com>
 <CAKXUXMy-S8VpR4-aTQcx-zg_4SXsb4Dj6qRS2ACi1TrgYjNa6g@mail.gmail.com>
 <cfff5784-9ca3-07f8-c51c-f1c82b2871e3@gmail.com>
 <CAKXUXMxmLmdj8wXsAfjGX3Kc8OgU7M78P6jruGAKM9iRA3PbOA@mail.gmail.com>
 <d785e5c6-99d5-40d1-4eae-c7209ec86380@gmail.com>
In-Reply-To: <d785e5c6-99d5-40d1-4eae-c7209ec86380@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 30 Nov 2020 17:57:06 +0100
Message-ID: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option
	for NETWORKING_BLOCK_COMMENT_STYLE
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

On Mon, Nov 30, 2020 at 5:47 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 30/11/20 3:40 pm, Lukas Bulwahn wrote:
> > On Sun, Nov 29, 2020 at 3:58 PM Aditya <yashsri421@gmail.com> wrote:
> >>
> >> On 25/11/20 6:08 pm, Lukas Bulwahn wrote:
> >>> On Wed, Nov 25, 2020 at 8:19 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >>>>
> >>>> On Wed, Nov 25, 2020 at 8:02 AM Aditya <yashsri421@gmail.com> wrote:
> >>>>>
> >>>>> On 22/11/20 12:22 pm, Lukas Bulwahn wrote:
> >>>>>> On Thu, Nov 19, 2020 at 11:44 AM Aditya <yashsri421@gmail.com> wrote:
> >>>>>>>
> >>>>>>> On 19/11/20 12:30 am, Lukas Bulwahn wrote:
> >>>>>>>> On Mi., 18. Nov. 2020 at 18:40, Aditya Srivastava <yashsri421@gmail.com>
> >>>>>>>> wrote:
> >>>>>>>>
> >>>>>>>>> Currently, checkpatch warns us for files in 'net/' and 'drivers/net',
> >>>>>>>>> if we use an empty '/*' line for comment and contents of comments are
> >>>>>>>>> in next line
> >>>>>>>>>
> >>>>>>>>> E.g., running checkpatch on commit 0d52497ac8ee ("iwlwifi: pcie: remove
> >>>>>>>>> the refs / unrefs from the transport") reports this warning:
> >>>>>>>>>
> >>>>>>>>> WARNING: networking block comments don't use an empty /* line, use /*
> >>>>>>>>> Comment...
> >>>>>>>>> +               /*
> >>>>>>>>> +                * If the TXQ is active, then set the timer, if not,
> >>>>>>>>>
> >>>>>>>>> Provide a fix by appending the current line contents to previous line
> >>>>>>>>> and removing the current line
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Patch generally looks good.
> >>>>>>>>
> >>>>>>>> Can you check how many comments in net actually follow that style and how
> >>>>>>>> many follow another style?
> >>>>>>>>
> >>>>>>>>
> >>>>>>>
> >>>>>>> In drivers/net:
> >>>>>>> Wrong style: 14695 lines
> >>>>>>> Correct style: 147961 lines (ie around 10 times)
> >>>>>>>
> >>>>>>> In net/:
> >>>>>>> Wrong style: 5090 lines
> >>>>>>> Correct style: 30485 lines
> >>>>>>>
> >>>>>>
> >>>>>> Can you find out where the wrong style is used?
> >>>>>>
> >>>>>> Maybe the documentation is a bit outdated.
> >>>>>>
> >>>>>> For example, some drivers and some subdirectories might have settled
> >>>>>> for another commenting style.
> >>>>>>
> >>>>>> I guess you can submit the fix option, but it could be that the whole
> >>>>>> rule/feature is broken anyway... so I do not know if that fix is of
> >>>>>> any good...
> >>>>>>
> >>>>>> I think it is better to actually understand, document and encode the
> >>>>>> current rule that applies.
> >>>>>>
> >>>>>> Can you provide an evaluation where the different styles for
> >>>>>> commenting are aggregated in a good way?
> >>>>>> E.g., consistently within a file with style XYZ; mixed style but
> >>>>>> 80-90% are of style ABC; consistent within a directory.
> >>>>>>
> >>>>>> If you think some cases are in the wrong style for some specific
> >>>>>> files, simply send a patch correcting the commenting style and see.
> >>>>>>
> >>>>> Hi Lukas
> >>>>> I have generated the reports regarding the comments used in various
> >>>>> files at net/ and drivers/net.
> >>>>> Directory wise reports:
> >>>>>
> >>>>> net/:
> >>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative.txt
> >>>>>
> >>>>> drivers/net:
> >>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative.txt
> >>>>>
> >>>>
> >>>> Can you sort that by the overall number of comments per directory?
> >>>>
> >>>>> File wise reports:
> >>>>>
> >>>>> net/:
> >>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_file.txt
> >>>>>
> >>>>> drivers/net:
> >>>>> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_file.txt
> >>>>>
> >>>>> Some files in 'net/' follow the accepted syntax, such as:
> >>>>> 'net/batman-adv => 985    0'.
> >>>>>
> >>>>> However, some completely not, such as:
> >>>>> 'net/ax25 => 0    103'.
> >>>>>
> >>>>> Some even follow mixed syntax such as:
> >>>>> 'net/netfilter => 87    125'.
> >>>>>
> >>>>> Similarly for drivers/net:
> >>>>> drivers/net/ethernet/mellanox/mlxsw => 1071    0
> >>>>> completely follow accepted syntax.
> >>>>>
> >>>>> drivers/net/wireless/ralink/rt2x00 => 98, 2082
> >>>>> follow unaccepted syntax largely.
> >>>>>
> >>>>> whereas files such as drivers/net/wireless/ath/ath5k => 304, 486
> >>>>> follow mixed syntax.
> >>>>>
> >>>>> It seems to me as the documentation might be outdated, as you had also
> >>>>> suggested earlier, or maybe users are unaware of the documentation and
> >>>>>  just use the syntax for conserving consistency of the code.
> >>>>>
> >>>>> What do you think?
> >>>>>
> >>>>
> >>>> I think it largely depends on the history of the code and developers
> >>>> that take care...
> >>>>
> >>>> We might just start to ask the larger areas to modify the rule for
> >>>> their directory.
> >>>>
> >>>
> >>> I suggest we start with looking at the (let us say 10) "largest"
> >>> directories with respect to number of comment blocks and then decide
> >>> on a refinement of the rule for those subdirectories:
> >>>
> >>> A. Directory follows NETWORKING COMMENT STYLE; checkpatch shall warn
> >>> to follow NETWORKING COMMENT STYLE.
> >>> B. Directory follows GENERAL KERNEL COMMENT STYLE; checkpatch shall
> >>> warn to follow GENERAL KERNEL COMMENT STYLE.
> >>> C. Directory is too mixed; checkpatch shall not warn on any comment style.
> >>>
> >>> We can then start the discussion with the appropriate maintainer (and
> >>> check what else this maintainer might maintain and if that is
> >>> consistent) if they agree or disagree on that.
> >>>
> >>
> >> Hi Lukas
> >> Here is the list I have generated with the directories sorted on the
> >> basis of comment count and labelled the top 10 directories as
> >> following NETWORKING, GENERIC or MIXED comment style(s):
> >>
> >> At "drivers/net":
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/drivers_net/cumulative_sorted.txt
> >>
> >> At "net":
> >> https://github.com/AdityaSrivast/kernel-tasks/blob/master/random/networking_block_comments/net/cumulative_sorted.txt
> >>
> >> What do you think?
> >>
> >
> > Obviously, this existing rule needs to be refined.
> >
> > Do you have a proposal? Probably, you would like to have each
> > maintainer state which comment style is preferred or so.
> >
> > How could this be technically done?
> >
>
> We can probably Cc all the corresponding maintainers checking from the
> MAINTAINERS file.
> Since we are considering only the top 10 directories, this probably
> shouldn't be much time consuming.
>
> Or we can probably mail any central maintainer(s) for all net and
> drivers/net directories (for eg, someone who decided the comment rule
> in the beginning for both the directories) and discuss.
>

It makes sense to identify the names of those people to start with; I
would suggest NOT to contact them until we have a first good patch set
to provide some technical solution.

I was asking more about how a maintainer can state their preference in
the repository and how will checkpatch then use this information?

Did you think about a technical solution for that?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
