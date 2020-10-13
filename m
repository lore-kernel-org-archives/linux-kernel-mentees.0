Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84ED8C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 07:35:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD6EF2065C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 07:35:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2jK8ADv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD6EF2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 886C087437;
	Tue, 13 Oct 2020 07:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AiiN73SJ4aia; Tue, 13 Oct 2020 07:35:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 217088742E;
	Tue, 13 Oct 2020 07:35:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C15DC07FF;
	Tue, 13 Oct 2020 07:35:57 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B3EBC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 07:35:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 71C7B87437
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 07:35:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4a9jmWn2O_ZX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 07:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 348BF8742E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 07:35:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d28so18224462ote.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 00:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NydgkElo7XN0w7dOFhQcATjfq0XSR9/Rmc/KkVh/UNo=;
 b=g2jK8ADvml1TkUXLjZski7IS+ee6pe6Co5HzJixwVYoCWxRdgZLvBrx+0ANkHJmlQI
 tEURuNYGyPgVZS9+vZ/0wFPVXvmaPKDUsQihZobECvGyRja4cUgQ6uWgzBn8EoL20OMN
 QPkWLagE1eGUmi1PVsL71mPQiJm3/Fesw4Jo4WcEjoOe1qvJRy1ACtErYVrqWUqcKWEr
 eSlg4kkwkJKdLWX1B/YLurJSRBuL3JJBe2GG6BnImHa/Xyx9PZ/O8MkQ6aRpSqLyQeWn
 0CTcWuHN2Y+BpLTzD5AkV/4w8479HkoCDgOJcTXwVzr/10RHczHbAGDfcHvHpZtq93ig
 SV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NydgkElo7XN0w7dOFhQcATjfq0XSR9/Rmc/KkVh/UNo=;
 b=uVc9BA7yHb1eixwC2j6wii5upOFfyyC0M3rdB4c19w2rIgAK95CBJFrEYhDvz6shQ0
 tFL++EVN8tDv3O/gjll4dT4AnfVVwKTUWPHgAizXRBI7ExWquZrFfUREbheVbVyypq/d
 146WTLMTCxaCCpZ8S9zftnORHYu8Ok0PYQhFwHkn1gCEBDC4tmpOoABB5vPrKweIjPOU
 sQJ9HNyZBLgrLCZQndi6J+OKQhZ2I/4urm6PEqscuuyhv03g6/2IxOj8821PNmYe1Iye
 wlwjGcTYVPNzzZU2sDI3/gXcq2ic7xn0X8rAAvVm3eVcBmawkHZkfYOwY92aL9w/QF5+
 iOBg==
X-Gm-Message-State: AOAM532o9pDioEHBFt6qXjx8g9Kmwx1pxiqmeXgOSfw2C4MUhCN1mtQy
 xVL8e7WvqzOjNos0t7fW9NAsltwnOP9ut/t3H3I=
X-Google-Smtp-Source: ABdhPJwiKTvxH15gM58AG/oy+ufV+gstifJHwYzearYrKsKtzkZUwklzEu+aFfxpQSzivMzNcyzWj8nFt4pX67xcL4U=
X-Received: by 2002:a9d:6c4b:: with SMTP id g11mr18934047otq.265.1602574554214; 
 Tue, 13 Oct 2020 00:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20201013063642.39810-1-dwaipayanray1@gmail.com>
 <a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com>
In-Reply-To: <a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 13 Oct 2020 13:05:28 +0530
Message-ID: <CABJPP5CN3SHV+z2wM0ZW-2C6WggqhKPYkiTFnaYf_ERVBzXezQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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

On Tue, Oct 13, 2020 at 12:27 PM Joe Perches <joe@perches.com> wrote:
>
> On Tue, 2020-10-13 at 12:06 +0530, Dwaipayan Ray wrote:
> > Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
> > checks.") introduced new checks for author sign off. The format_email
> > procedure was modified to add comment blocks to the formatted email. But
> > no space was added between the email address and mail comment.
> >
> > This causes wrong email formatting in cases where the email is in the form
> > "author@example.com (Comment block)". The space between the address and
> > comment block is removed, which causes incorrect parsing of the
> > formatted email.
> >
> > An evaluation on checkpatch brought up this case. For example,
> > on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
> > the following warning was reported:
> >
> > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
> > system concerns)' might be better as 'David.Laight@aculab.com(big endian
> > system concerns)'
>
> Strictly, a comment or multiple comments can exist
> in any part of an email
>
> "John (Jon) Smith (Smitty) <jsmith@domain.tld> (tld is the best tld)
>
> > Add a single space in between the address and comment when the
> > extracted comment is not empty.
>
> So after the address is not necessarily the best
> location for a comment.
>
>

Yes I agree and in cases like that the check works perfectly.
But now consider the case when the name is empty:

Like:
jsmith@domain.tld (tld is the best tld).

In this case when the formatted email is generated, we have
the following: "jsmith@domain.tld(tld is the best tld)".
If this email is parsed again, the entire part is parsed as the email address,
which causes a mismatch later on.

It is for only this case that an extra white space is needed for the
parsing, probably because of how the comment is captured, for emails
with empty names:
  $formatted_email =~ /(\S+\@\S+)(.*)$/
So it depends on the whitespace after address to demarcate the comment.

Some more examples of what I intend to solve:
'<stable@vger.kernel.org> [5.3+]'
'<stable@vger.kernel.org> # v5.7+'
'David.Laight@aculab.com (big endian system concerns)'


Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
