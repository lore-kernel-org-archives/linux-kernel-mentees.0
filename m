Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861E8C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2CB60F94
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D2CB60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD31B40524;
	Tue,  3 Aug 2021 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tEtTpVJ3lWFl; Tue,  3 Aug 2021 18:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F3688404A2;
	Tue,  3 Aug 2021 18:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DCC66C0010;
	Tue,  3 Aug 2021 18:14:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33C1BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16060404A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6LBrgKvEoge
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55417404A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:14:10 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id j3so60359plx.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 11:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HTQvX2B0hxqOHoFrZlxOVAvC+y6XCFvZ0LQPt4/HB3Q=;
 b=RqFVC6mUxlmWQJ2P6k6vGw21ns7dv3n8Wn3D3y0+wwtUrX7o7SgKchQ1QObVtcxTA2
 PT21PQ2/u+SiBiKfuotn2FDpG7FgJCJM1igutexqB0STED7YO0UEwCJZLeAA55NVKxyd
 Kjjdt85oXzstsI5u73TYCO26AbDqiOcbD92x4pvD5uBhj1k2VtMenggY/RL7O37GO9nb
 CTE8opT3dlatxvXUzvjvtf+k9yAiVynazsky69+yve1vPywfMDtEKiqChfbTPYo0nx+w
 3e8bhOo/xd56+j/ez+LMlYv2K2HBA1vDYks2U2N8s1xBWeXMKmP71YQnFRk8uTV+w4J9
 jNPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTQvX2B0hxqOHoFrZlxOVAvC+y6XCFvZ0LQPt4/HB3Q=;
 b=XEPR6pNhmvylZbJYoKftrfyiCdda1+mQmsg7nh7lieR1GiaBm+mqcZMD21qYcHShXs
 Q2unqHWXNHnjbs0xfdLIV8PqPjyJdQcZ0dHP5Z01qCgGIX3HF8sqQdkVlYgUXaNuRqTz
 JTEXnvdK76TYg+HU2+g50nUzrP1t8aeehVVsMO5AOmxrY/CqisTw6m5XGFmkRiEGPn9u
 vf3dX1paKnCET0+SUecKCCKP4AWc9P2LnkDLfTfcntImf80cppt3cLJeGOLBqE7dcIUs
 HrVByPF1lIWxnx8fL4ZSvt2B9SiFGY8IKbpRjrrl8dkR16i2PefmNxWu/HIZYm15WeTb
 ys/g==
X-Gm-Message-State: AOAM533X/j7GlZkM+PFsZo1Es+P496u09R+ac2Js+eyIbxFo/C/P29pm
 mxrDEqvglyojH62isnHLxCw=
X-Google-Smtp-Source: ABdhPJw8mPFpn3OnsIBVc9A0a7+6sMt+RBjXS71iklrhnp3Vto++rU+l3E0oHhK3q7NpiIu/ZlYpIQ==
X-Received: by 2002:a17:903:1243:b029:107:eca4:d5bf with SMTP id
 u3-20020a1709031243b0290107eca4d5bfmr19371681plh.15.1628014449570; 
 Tue, 03 Aug 2021 11:14:09 -0700 (PDT)
Received: from uver-laptop ([2409:4063:4e9f:d030:6444:e218:6d0b:ae0a])
 by smtp.gmail.com with ESMTPSA id 20sm17069502pfi.170.2021.08.03.11.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 11:14:09 -0700 (PDT)
Date: Tue, 3 Aug 2021 23:43:57 +0530
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: Re: [PATCH] Documentation: checkpatch: Add SPLIT_STRING message
Message-ID: <20210803181357.GA2736@uver-laptop>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803141751.16893-1-utkarshverma294@gmail.com>
 <CABJPP5B90d_wsEjcG=agKO8KAHaB11Bjh-mgtZtdmrkfooWcYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABJPP5B90d_wsEjcG=agKO8KAHaB11Bjh-mgtZtdmrkfooWcYg@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Aug 03, 2021 at 08:22:39PM +0530, Dwaipayan Ray wrote:
> On Tue, Aug 3, 2021 at 7:49 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
> >
> > Add a new message type SPLIT_STRING under the 'Indentation and Line
> > Breaks' subsection. Checkpatch documentation for the splitting of
> > quoted strings that appear in userspace, across multiple lines.
> >
> > Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> > Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> >  Documentation/dev-tools/checkpatch.rst | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> > index f0956e9ea..32a26a800 100644
> > --- a/Documentation/dev-tools/checkpatch.rst
> > +++ b/Documentation/dev-tools/checkpatch.rst
> > @@ -710,6 +710,10 @@ Indentation and Line Breaks
> >
> >      See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
> >
> > +  **SPLIT_STRING**
> > +    Quoted strings that appear as messages in userspace and can be
> > +    grepped, should not be split across multiple lines.
> > +
> 
> Is there any reference you can point to for this?
> Usually LKML links are okay. So you can try adding some discussion
> link which helps know more about why this message is important.
>

Is this reference fine:
https://linux-kernel.vger.kernel.narkive.com/vc8OoIUF/patch-checkpatch-check-for-quoted-strings-broken-across-lines

Should I include these references in the commit description or the
documentation file?

> >    **TRAILING_STATEMENTS**
> >      Trailing statements (for example after any conditional) should be
> >      on the next line.
> > --
> > 2.17.1
> >
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
