Return-Path: <SRS0=g3Jo=DM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2BDC47095
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 08:53:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCA7420781
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  5 Oct 2020 08:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PbSorY/w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCA7420781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42C28852F8;
	Mon,  5 Oct 2020 08:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K2qphYrXDCGV; Mon,  5 Oct 2020 08:52:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C07AE85277;
	Mon,  5 Oct 2020 08:52:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4644C016F;
	Mon,  5 Oct 2020 08:52:58 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CC26C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 08:52:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7165D860D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 08:52:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iE10EEnCVJI6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 08:52:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CF3C985EF5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  5 Oct 2020 08:52:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id m11so2264899otk.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 05 Oct 2020 01:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBv6kKM3dGEQmeeDgKUdUDXl4YNkEuWp7ZkHMGBjG2U=;
 b=PbSorY/wjjyVTk6RWJP+7cLPX10on36ynefRf8xyVUV5nAIJbPs+YkIvpcKyCD+P8Z
 78/fpujGqqB18pss8znR6iTX5WUiWstDXbwlKc+yAIvesg4wvZb8iICgRWWhT1lFPboh
 oF+4juoKRGnS3g9W0f6RRB+5Mzf71rLrN/5ruotfSWGEr8zLK4/klmym2TODYTum/xKb
 2gerYU+p4VjUx1vgWRjFfaLI23jZiZfjHtsl58jWkHLzNkjiRfhgiR6W/fy8gfxUoHY+
 Socntdc3fnENfynf+mdFXPPSH7XMXzWvArB8EwD688En2ndkzfFlWtRzMH1W9cS7kV3Q
 sszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBv6kKM3dGEQmeeDgKUdUDXl4YNkEuWp7ZkHMGBjG2U=;
 b=EPpCsA1cg0uPzWj1y93DSwc66tneOQYNlBzPv7deU1z43H3p6EryyGJlOFihbB2RZc
 mCg/SVeR62R9ZDsenTcFs8r70sAOFhiqg/VlYZ5I8iQjSguqMItltT/XsGIHRGQqKILm
 H9onZpyuUWf5J0bvnB4vw6kzhzQdAKa3H9ulbVa41QL5qtUjNNFJ0d8uUcMClQ1lrwBO
 jIPVXMLOXVdegjumP/P61xGgWKSKN9qlYin7BXcbwg8lZMojFZTZuSqswUPZ484xBgGz
 sHkruIjcZd+dM7fz+AhA2WGITPA0uYXuzgCuP5gISjyvV7x41X4txHfQFYsW6x+j9DjR
 1ntw==
X-Gm-Message-State: AOAM531i2LSuBfXJoJznex4pFjsJyeUiXahbMXFkYQEUyA8UdffQHKJ0
 ixCq/jRgsCQKJRfI7dnVYwidPvICHFJ6108XRcQ=
X-Google-Smtp-Source: ABdhPJxC6iKQENcB3w7OV28e3Th1vuHlgdW/e6/U6XO33nCwqKtHv/SsDDmYMV1XhbRBBEoNYlf2Ql4KjJ9TSY46q08=
X-Received: by 2002:a9d:4b18:: with SMTP id q24mr10631578otf.265.1601887975881; 
 Mon, 05 Oct 2020 01:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20201005064842.33495-1-dwaipayanray1@gmail.com>
 <a5cba9bb723626091f8790c794efe8de4ab184b8.camel@perches.com>
 <CABJPP5BwVmWiFcxHKdCYnN_mOE1G=eHUDq8yqqHFaO3cYhp+oA@mail.gmail.com>
 <c51588b4e8a2096c1453070b983da5ce8617a622.camel@perches.com>
 <CABJPP5CAY+qJU8wnGZ7JgugeN9CyFbdct6nAsxpY0NdyaNuWLQ@mail.gmail.com>
 <f1536dd1c1fbf53a848b27a2817a973fbf809719.camel@perches.com>
In-Reply-To: <f1536dd1c1fbf53a848b27a2817a973fbf809719.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 5 Oct 2020 14:22:33 +0530
Message-ID: <CABJPP5ASsEu5n3cwYxSB4PWYnW+gjXuL_+zSmrpivgHBE7fcnw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new warnings
	to author signoff checks.
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

On Mon, Oct 5, 2020 at 2:13 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-10-05 at 13:50 +0530, Dwaipayan Ray wrote:
> > On Mon, Oct 5, 2020 at 1:35 PM Joe Perches <joe@perches.com> wrote:
> > > On Mon, 2020-10-05 at 13:10 +0530, Dwaipayan Ray wrote:
> > > > On Mon, Oct 5, 2020 at 12:48 PM Joe Perches <joe@perches.com> wrote:
> > > > > On Mon, 2020-10-05 at 12:18 +0530, Dwaipayan Ray wrote:
> > > > > > The author signed-off-by checks are currently very vague.
> > > > > > Cases like same name or same address are not handled separately.
> > > []
> > > > > And for mismatches, it's really not known that
> > > > > it should be one way or the or the other is it?
> > > > >
> > > >
> > > > I think that's true. But since the mail in the
> > > > From: part is the one which with others are being
> > > > compared, I think maybe it should have the higher
> > > > priority, and be treated as the expected one.
> > >
> > > I rather expect it to be the other way around.
> > >
> > > The Signed-off-by: line should be authoritative
> > > as that is what is put in the commit log.
> > >
> > >
> > Yes that makes sense. So is it just better to point at
> > the difference?
> > Like:
> > Author email in From: (something) differs from
> > Signed-off-by: (something2).
>
> I think so yes.
>
> That's what I suggested when I replied to you
> with your first attempt.
>
> https://lore.kernel.org/lkml/7958ded756c895ca614ba900aae7b830a992475e.camel@perches.com/
>
>                         WARN("NO_AUTHOR_SIGN_OFF",
>                              "From:/SoB: email address mismatch: 'From: $author' != 'Signed-off-by: $authorsignoff'\n");
>
> And please keep replies on list.
>
Yes sure, I missed to cc the list.

I will fix the issues and get back to you with a new patch.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
