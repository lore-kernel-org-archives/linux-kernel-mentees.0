Return-Path: <SRS0=sDOq=IS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AB2C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 13:21:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04AA061937
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 20 Mar 2021 13:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04AA061937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B709283AA7;
	Sat, 20 Mar 2021 13:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ywR7OSCHJw5l; Sat, 20 Mar 2021 13:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC17783AD4;
	Sat, 20 Mar 2021 13:21:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B292CC000B;
	Sat, 20 Mar 2021 13:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62CF6C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 459A84033F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vzTtkf9fLBpF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:21:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72E054035A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 13:21:51 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v3so9071953ioq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 20 Mar 2021 06:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cCOjc0tcqOTnDsStbeZc6I4mtJqZyPE6ypRSG5G1MfU=;
 b=lTm+JHYVhc6j2CCXKqCWkv2eHWJ6IJsP4sIIp871trHteNWSDDuFg2T08gTq5bdthf
 lR2M/CWir8bvR7r4KLYoRMo6wshYnqSGgxtpESzcPozkMjE6EUwIgZYBfx6hWluLr7fp
 GqFrZa3oyJ8C1boZC4pSx6hGJoL/sxVzG8/396X1uyWsZgtMRGkvzm3y5Q8GM5RNbjxI
 jpvd7TSABaC1sW8eRtUFIJGsL5VlZxGRN66J0nW/JTnXu6AEIm25rDKreQfUWfR+XmOL
 /D1S74ZQ/O9nQliZPF2Xvhvh6ffatdKe1Y4cKA+5n9IqJGD9S9L29DSpJSzxefymIQz1
 vZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCOjc0tcqOTnDsStbeZc6I4mtJqZyPE6ypRSG5G1MfU=;
 b=USH58lMPvrX1whTdgC61Ag82W1/TiCvtCW3G4Fh5qaM51ErfLgCrqVfTtphSHEjGhW
 ++j/kzqviHgJduQJoyH50yX+NMTkTEbCMyR+YhqJa6cUEeAd0GDX18vIImswIwI7llyl
 TSpLN+s3dnBD2nWTtIRUJheBks55t2puqvltdCeotXq4DYE0JDZlyRzbAmM7bCR7YH+0
 BuRbmClBmXjbfbsZHKXpSX2Beygx383HqjHSFdlJuENTzzI8k9XksaYcSOJGm6qMsTyn
 Zame2GqghVjdLl/Oie30iwhGkkaKcJZrVvebs5p5lL3wia0hY64j8pyxjoRGyGxQAfep
 hXpQ==
X-Gm-Message-State: AOAM530g0QQTC3u+WOgnfS9R3/KwdohXohdzwAqUGZuhrz/1jzUiA/0l
 HKrMqQL3Z9kogpuCgwXDWNqiaI9Zg2lBYtNcR4U=
X-Google-Smtp-Source: ABdhPJzUtJgxvFkyPVHwFPLYLYWuKCv8cgnqpNG+Q7bRPRwPW9SsoGxHRxMfHlZoCSVXTxZFFYrnnthdSTKjJxXn2Gg=
X-Received: by 2002:a02:6a14:: with SMTP id l20mr5212666jac.12.1616246510459; 
 Sat, 20 Mar 2021 06:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com> <871rcg2p8g.fsf@meer.lwn.net>
 <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
 <878s6kto3g.fsf@meer.lwn.net>
 <CAKXUXMxWOvM5HRwmAAWEsqQc2k6_ReqRw0uD=VANLO5D7OpFtg@mail.gmail.com>
 <87o8fgpbpx.fsf@meer.lwn.net> <99a21e10-266e-b997-7048-c29a570afe0b@gmail.com>
 <30051ed8-33e4-a303-199c-f4bdcb0e448a@gmail.com>
In-Reply-To: <30051ed8-33e4-a303-199c-f4bdcb0e448a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 20 Mar 2021 14:21:39 +0100
Message-ID: <CAKXUXMyQRY9GC7sUG+_W5hQe3EFdvxKrYTEO7JL3E5LD3cCPKQ@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
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

On Sat, Mar 20, 2021 at 1:45 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> On 20/3/21 12:23 pm, Aditya wrote:
> > On 18/3/21 11:48 pm, Jonathan Corbet wrote:
> >> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
> >>
> >>> Yeah, and as this line-counting is really just a poor man's
> >>> heuristics, we might just be better to really turn this heuristics
> >>> into a dedicated cleanup warning script, then we can check for more
> >>> indicators, such as "does it contain the word Copyright" somewhere in
> >>> the kernel-doc comment, which tells us even more that this is not a
> >>> kernel-doc as we would expect it.
> >>
> >> I really don't think we need that kind of heuristic.  The format of
> >> kerneldoc comments is fairly rigid; it shouldn't be too hard to pick out
> >> the /** comments that don't fit that format, right?  Am I missing
> >> something there?
> >>
> >> Thanks,
> >>
> >> jon
> >>
>
> Hi Lukas and Jon!
> I have a question, should I clean up the files with '/**' like
> comments in only header lines? Or as we are planning for making it
> generic, for other lines as well?
>

Aditya, of course, if you can detect and come across some unintended
'/**' comments in some files, clean them in the same go (as you did
with ecryptfs).

I am just worried that if you extend it to the fully generic case,
that the list of cases simply explodes: showing many 1,000 cases
across various 1,000 files that need to be cleaned up, and such
clean-up work is just too much to get done by yourself.

The current list limited to comments in header lines seems to be a set
of patches that you can probably get done.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
