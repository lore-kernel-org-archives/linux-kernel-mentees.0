Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9641DC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:57:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E5FC2224A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 09:57:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eF2sR0pR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E5FC2224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9F7CB86DD7;
	Sat, 21 Nov 2020 09:57:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B4TpDb0f0WOs; Sat, 21 Nov 2020 09:57:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14EA786DB7;
	Sat, 21 Nov 2020 09:57:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 003F3C163C;
	Sat, 21 Nov 2020 09:57:16 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF672C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BD45C86DD7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GH8J-Yi1hA0C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:57:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0F1FA86DB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 09:57:14 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id y9so10885222ilb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 01:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pLMEP0YXoqWCB5IHJXkN8BPZ37vl4VjrLPjvfS28lpE=;
 b=eF2sR0pRUywmPlz4goRYhk8QiEFhSIoYJFItXqXIoDE09U7iUu9D1tahq0nEzp8QjA
 rBlyvvrv3lVncySz+TImWF4MUraAPF+Pt7anLlQn6stDcW5IUKkUFzy2KCbsTP+BIxri
 MsWX1lE3wuDbjgfyuJy5KwYRXDP881Tlc42iG0H712Tz8RoPtDA0DZEd/ayHZshcK1Gw
 CkaobWwzJvTapkPCYtCUcGxCQiD5PnpfmndnPq8G8L4j17YbhVXTThb9JheAAXlxGFCc
 OnfPBiKjpmdQ6jivLwVbT2uw+a+ZLnE+Wsa00scFzjdLDdMzkqhraQCgnRvssoidpboX
 dufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pLMEP0YXoqWCB5IHJXkN8BPZ37vl4VjrLPjvfS28lpE=;
 b=V+iN0for0Los5RryDdmn2Eun9eNcIb/0naRKwrxRZrJ0zcq+iRikeHtcb0vWZMRTP6
 sk44qM7Zs6iDL/W8UzzQaDx6ZYxWbqhT98xRln3vdbTJvQ5uCiJg8sApsa8pRUyXe5jm
 GYNA9JESUaf7/DSVBuZp91UiXQQ6wq5eaktMfJWu3aCtFhl7QO6eb5YlLOUxqkgQ1fpJ
 GP/3qWXl5sIeAbNzfE7dZUf4euCychSCNz783nBsJlMAK1F7wY4OI1AYILyJ6sePr9hU
 WlS4/lBaLoiOXQy/0KgVjtYh+bjwwvf7GKAQkiV5J7DSfRsVa34z7aQOm75Qafq9oyHA
 yFlQ==
X-Gm-Message-State: AOAM530E6P0HkdX7WOB7xvYSEK1KQXDbuRF21nwWuBKwM8fV9iiV45BQ
 Om5K+BXuHXRPZXYoul10/UwSaIIlThFKOnU7Pss=
X-Google-Smtp-Source: ABdhPJy7IyXM7U9HF2j+WyBsGp2FOXPyKc2e4KnenYQrEaRZQCUBV3qqxahxB+qiMLbB3HKt3oqFPuWKuOQoKSmgrS8=
X-Received: by 2002:a92:aacc:: with SMTP id p73mr12403184ill.64.1605952633390; 
 Sat, 21 Nov 2020 01:57:13 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMz71tNsU-vLUtqYNiYEji48hF2EdLhdq+qvPy6Mr1sroA@mail.gmail.com>
 <20201120101254.17712-1-yashsri421@gmail.com>
 <88ca7da2-9204-e061-7b67-1128a16a7852@gmail.com>
In-Reply-To: <88ca7da2-9204-e061-7b67-1128a16a7852@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 21 Nov 2020 10:57:02 +0100
Message-ID: <CAKXUXMy2J6+RSZ1oesVAD_9+fXpCUF8ANRfpmq486_zw+Mrhpg@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Documentation: MAINTAINERS: add
	information about parse-maintainers.pl
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

On Fri, Nov 20, 2020 at 11:16 AM Aditya <yashsri421@gmail.com> wrote:
>
> On 20/11/20 3:42 pm, Aditya Srivastava wrote:
> > parse-maintainers.pl is a script which can be used to automatically
> > order the contents of MAINTAINERS file in preferred order (i.e.
> > 'MRLSWQBCPTFXNK').
> >
> > But currently we don't have a documentation on it.
> >
> > Add documentation regarding the same in MAINTAINERS file.
> >
> > Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> > ---
> > the patch applies perfectly on latest next-20201119
> >
> >  MAINTAINERS | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5db753fa1295..7ad00af7acd4 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -136,6 +136,9 @@ Descriptions of section entries and preferred order
> >             printk, pr_info or pr_err
> >          One regex pattern per line.  Multiple K: lines acceptable.
> >
> > +This order can be generated automatically for you using
> > +``scripts/parse-maintainers.pl``.
> > +
> >  Maintainers List
> >  ----------------
> >
> >
>
> Rationale for my changes:
> I did not go into much detail of its working here.
> A bit detail on this can be to use 'scripts/parse-maintainers
> --sorted' which produces the sorted file in MAINTAINERS.new by
> default. The input and output default files can be changed using
> '--input' and '--output' options. However, here I have omitted these
> details as running with '--help' option already provides this
> information in detail.
> So just making user aware of the script should serve our purpose.
>
> What do you think?
>

It makes sense not to put that into MAINTAINERS.

Do you understand how to use ./scripts/parse-maintainers, though?

So if the warning with checkpatch is shown on a patch, what would you
need to execute to get a corrected patch?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
