Return-Path: <SRS0=GItZ=E5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C062C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 12:07:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62072076E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Nov 2020 12:07:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWre751T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62072076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4FBF0860F6;
	Mon, 23 Nov 2020 12:07:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JMnH5nqx2Ke9; Mon, 23 Nov 2020 12:07:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1EAD85A5D;
	Mon, 23 Nov 2020 12:07:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9CC0C0891;
	Mon, 23 Nov 2020 12:07:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3369EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 12:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0CD61204A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 12:07:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WX2aBCtBXb2r
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 12:07:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com
 [209.85.166.171])
 by silver.osuosl.org (Postfix) with ESMTPS id C6AFA203C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 12:07:12 +0000 (UTC)
Received: by mail-il1-f171.google.com with SMTP id y9so15679351ilb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Nov 2020 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BCZLbeEsAT9HfsBAxqxx8lAxTuEn+0C5JhaGN1Wq1E8=;
 b=QWre751Ts7Bop65rY6vDK5p9lR5i3LnsygVZObOn2dNICuK4abSlu2G34I25xn6YNK
 Z7WMFtyPdAWlY70MItw2JGQSi9atp3hU3Ou0WMMhkZriphCa4iu4QK9OwsWs3LzgsC1X
 xsg2ncoHIfIuJ6jRhdKomNagcu3j5efbET3b3ZGUXLrrZiijVTpyficVLnGn/MGvAxLG
 KXZqxGlJn/p0Hb4xn9ab0WygMHY6LCKnb9clsctKhRJaO9LFqaFcPGSTLyf+Lu+4N+9n
 4BUBzehjgSV6NCSoN8DhuPfyTW4zueqBQoFt47BEhFof1p1oQzH+J9D4niBQsAmOozOr
 C1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCZLbeEsAT9HfsBAxqxx8lAxTuEn+0C5JhaGN1Wq1E8=;
 b=Edsx8dJhZ0Gd9uh0pBcWjnuKUdYMQirvqHiffFiO+sDOvltgvZsfibJELIocp3V/nI
 TUwsUTHB1LaGRMjcEgUXc9DTdmOSsvUbZz1Xjucx3Q5Ifat9lpnv9eMSypCrSSUdYj/S
 kyuyk+kae7G4wMWx91i07ipwM2rVuescnNjABm4iwSs89ar7cI1j4O7he6S77FV02Y6W
 fMnZaoDuXbF4Wvyd0F8KTUcwFLXmtus7aKEw0u+wXIEhH1ardxw7BaHYFXF6qntScEZ/
 Xzj6qwYeVgv4YO88kalKlzZJmw8afb8qS8tVumRRiY8drB9AOXcsbIIqGgGc1ha79erw
 Z+Hw==
X-Gm-Message-State: AOAM531bY1KMnQFtKaKo8nLMtI+m1e9IVB9lbZHaUSP1ejNDWWUhrC8I
 EPL+XJ/200rzWJbvNSCozjpy/VYKakT24Kd80e4=
X-Google-Smtp-Source: ABdhPJxEz4daN/GP2oWyTtxRQt1MJzx0xQpQeRIsaM7jSucDgFI92OMrCrEGUdoBQb2/+6u5jMzsFn/GOBRMCGLep0M=
X-Received: by 2002:a92:512:: with SMTP id q18mr34358322ile.147.1606133232166; 
 Mon, 23 Nov 2020 04:07:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMxwPSELEwWT91-+P8azzjxiaoKY8SLKvZVFLUJznvUyBw@mail.gmail.com>
 <5ad7076b88de21faae79cdc718631a5af80d574f.camel@perches.com>
In-Reply-To: <5ad7076b88de21faae79cdc718631a5af80d574f.camel@perches.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 23 Nov 2020 13:07:07 +0100
Message-ID: <CAKXUXMzQdwvs+gfs1eD131jMQvkTPbghN=-CDLevrSX0CJBdmw@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] Alternative to checkpatch fix options
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

On Mon, Nov 23, 2020 at 12:48 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-11-23 at 10:33 +0100, Lukas Bulwahn wrote:
> > Dear Aditya and Dwaipayan,
> >
> > For creating fix options to checkpatch rules, please note that:
> []
> > it simply might be easier to invoke
> > clang-format with a limited rule set for specific formatting fixes
> > rather than trying to implement all of those syntactic fixes in
> > checkpatch itself.
> >
> > Aditya, Dwaipayan, can you please consider that option and investigate
> > the clang-format capability to do the fix before implementing that in
> > checkpatch?
>
> Which could be extremely cool if clang-format works on patch contexts.
> But as far as I know it does not.  clang-format-diff does.
>

I used the term "clang-format" in my mail as the overall term for
"clang-format" and "clang-format-diff".

> What maybe could happen is integration with checkpatch and the actual
> application of the patch to a temporary file and then using
> clang-format on the modified block similar to the integration of
> clang-format and vim or emacs with selected contexts.
>
> Maybe the integration of clang-format-diff could be done, but my
> reading of its help file seems to show the newly added line needs to
> be extracted without context. (ie: using -U0)
>
> Anyway, please do investigate the integration because as you've
> probably noticed, adding --fix rules to checkpatch can be painful.
>
> I'm not in any way against this concept or integration, but I do not
> expect this clang-format-diff integration to go particularly well
> unless the patch context provided is an entire statement.
>
> Maybe checkpatch could learn to apply patch series or could be
> integrated along with git to apply patch series to a test branch
> and clang-format-diff and the entire statement or function around
> any change could be extracted and again run through clang-format.
>
> I suggest you play with it and see what you can do.
>

I agree. It is by no means straightforward to run clang-format on a
patch (or on a git commit) and integrate it with checkpatch... it will
need a bit of exploration, investigation along those lines you
suggested.

Aditya, Dwaipayan, feel free to explore and use the mentees list to
exchange ideas and investigations.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
