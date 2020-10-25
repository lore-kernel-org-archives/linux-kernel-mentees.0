Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64269C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 09:27:05 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFACE22259
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 09:27:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwjQIErU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CFACE22259
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B87786C6E;
	Sun, 25 Oct 2020 09:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zS-jZLMbqc14; Sun, 25 Oct 2020 09:27:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F0EF86142;
	Sun, 25 Oct 2020 09:27:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EAAFC0893;
	Sun, 25 Oct 2020 09:27:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37950C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 09:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1AFFD856B7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 09:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tPOPL4AYfF70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 09:27:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 072C686A4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 09:27:01 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id p5so8993574ejj.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 02:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Lt+9JQz/Rm6k2B3TWzYdWto1xYmQaoFeE5x5LE0ClHg=;
 b=fwjQIErU7zGfRkBZgrqalBnB3cvYOs/aEYLi2ryAkFWusQ8zKL0cHvnIoe6gAFzw2W
 xrXGjz1ZNSyRHe3PwrDd2cJB356MBj0dZYe/wcFxi0UbowysIVUoYCtZgSJ2AY2XyVkE
 IuHP60+Zb8cLX5msv5MPJFsRK4tx0tLwjBR6VkT3Tmmf+181E21pyb/W2pnunNUTHYQt
 z4qUVaqq7gfbqWke3Ow3QA0bG8Yy0oBEOnz4JxIfdPiImTjl58+DdT5IU9liRvkvM9Ha
 VRRU51jc7VMh7ttVG0QCBWCd7CgqivKxu7kDxfoDUhhNL0PvYBlubqmt3x7yMd/v0rLD
 bfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Lt+9JQz/Rm6k2B3TWzYdWto1xYmQaoFeE5x5LE0ClHg=;
 b=UzOxjuzcOz13cJnJusNadveBDe2XxLTEeIEewYfgEUJQI/4xtc1ryYu8yjCkDhCbxy
 dPZC53j7tRBoR+2dM5OPumFz5TmsUe1OuoiY0HAFkSZLJsPC77iYEzwcUecti81D+1Xm
 SMu7IHp+oq8gTLn9jiK5P6DGutf6KfMprzmiv/zcT6jiptcs96hPbXUACZ8Xb+UfVVJ6
 F57drjTd7Us0Py+X7sv1ARcfSUeFDAGxNyBRzOTWa+6IlAwt8NtQbgRp4nG8N4gWtobc
 t7tLSLi40mnClxdNo/tpr3wR45SCprr/XIorpMUcp93j4jb+IlNyhlVIddpTtLY/2nJP
 5RTQ==
X-Gm-Message-State: AOAM531sYsQIOKZMqBHQApzrsAa4bvupDBa52gp2f6xFtreCMnl0tm2+
 L26yqvO/MNEWsK8EkaNSobw=
X-Google-Smtp-Source: ABdhPJwhA5GMvlJ8WXGFzBZfmoIJVj056vHjIhuFIrK6i4QtYMzlJID3aCB/EbiTfwZaF4hvbqTkxw==
X-Received: by 2002:a17:906:d048:: with SMTP id
 bo8mr11035186ejb.80.1603618019273; 
 Sun, 25 Oct 2020 02:26:59 -0700 (PDT)
Received: from felia ([2001:16b8:2d75:ef00:fde5:ce9a:6dc:548e])
 by smtp.gmail.com with ESMTPSA id sb29sm3633098ejb.76.2020.10.25.02.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 02:26:58 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 25 Oct 2020 10:26:53 +0100 (CET)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BYmRrHng6taVVVyYgmD=N6iojUWH0Tk4v9ih+24vWFfA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010251022060.25172@felia>
References: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
 <alpine.DEB.2.21.2010210717460.8328@felia>
 <CABJPP5CQgkzYnq6KrwfAaaTbORLVSKqxdF=8-eM8stPtJOXOjQ@mail.gmail.com>
 <alpine.DEB.2.21.2010211053430.8328@felia>
 <CABJPP5BYmRrHng6taVVVyYgmD=N6iojUWH0Tk4v9ih+24vWFfA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1785422012-1603618018=:25172"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] checkpatch: improving comment parsing in
	email
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1785422012-1603618018=:25172
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Sun, 25 Oct 2020, Dwaipayan Ray wrote:

> On Wed, Oct 21, 2020 at 2:26 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> >
> >
> > On Wed, 21 Oct 2020, Dwaipayan Ray wrote:
> >
> > > On Wed, Oct 21, 2020 at 11:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Tue, 20 Oct 2020, Dwaipayan Ray wrote:
> > > >
> > > > > Hi,
> > > > > checkpatch seems to have problems parsing some types of
> > > > > email comments. Some examples I could find were of the type:
> > > > >
> > > > > 1) address@example.com (Comment)
> > > > > 2) "Name (Comment) " address@example.com
> > > > > 3) address@example.com #comment
> > > > >
> > > > > These comments aren't processed currently which causes
> > > > > false BAD_SIGN_OFF warnings.
> > > > >
> > > > > Examples are:
> > > > >
> > > > > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com
> > > > > (big endian system concerns)' might be better as 'David.Laight@aculab.com
> > > > > (big endian system concerns)'
> > > > >
> > > > > WARNING:BAD_SIGN_OFF: email address 'stable@vger.kernel.org #4.20+'
> > > > > might be better as 'stable@vger.kernel.org#4.20+'
> > > > >
> > > > > The earlier warning is very frequent in the kernel.
> > > > >
> > > > > I did send a patch solving (1 and 3),
> > > > > https://lore.kernel.org/linux-kernel-mentees/a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com/
> > > > >
> > > > > Joe points out that comments and multiple comments can
> > > > > exist at any part of email. (perhaps RFC 5322 Appendix A.5). So
> > > > > that patch didn't solve the problem at the very root.
> > > > >
> > > > > What do you recommend be done?
> > > > >
> > > >
> > > > I cannot say much of BIG value and insight.
> > > >
> > > > As of now, I think these cases should be handled correctly and the check
> > > > for: is it the same name or is it the same email should work properly no
> > > > matter where and which kind of comment is used (as described by RFC 5322
> > > > as you pointed out).
> > > >
> > > > I might change my opinion when:
> > > >
> > > > 1. We have an evaluation on how many cases of BAD_SIGN_OFF (and related
> > > > types) do we currently still observed among 100,000 commits and how many
> > > > due to not handling comments properly?
> > > >
> > > > 2. We have a rough idea how complex this whole checking function will get.
> > > > At the moment, I cannot say if it "just 10 lines of code addition" (even
> > > > if they might be quite intrinsic to get right) or if we need hundreds of
> > > > lines with thousand of special cases etc. (which I do not expect, but who
> > > > knows which complexity might be involved, once we go into the details).
> > > >
> > > > So, I suggest to evaluate and prototype and then we can better judge if it
> > > > is worth really going forward, discussing it with Joeand adding it to mainline.
> > > >
> > > >
> > > > What do you think, Dwaipayan?
> > > >
> > >
> > > Hi,
> > > I completely agree with you. We could run the evaluation first and
> > > see what kinds of comment patterns are used. We could also keep
> > > the RFC 5322 guidelines as a base and modify the code to recognize
> > > the comment blocks as per the specifications.
> > >
> > > It could get fairly complex, because comment blocks are allowed almost
> > > anywhere. So maybe we should just solve the most
> > > common ones first. That would help the committers largely.
> > >
> > > I think Joe wanted a complete solution for it. So I guess i will try
> > > to cover as many cases which doesn't increase the code complexity
> > > much.
> > >
> > > I will start with the evaluation. If others can help out too it will be great.
> > > After it, we can determine what cases need to be handled and what
> > > can be ignored.
> > >
> >
> > Go for it and share your results with the group once you have something
> > which others can review and help to evaluate.
> >
> > The requirement for future applicants to be selected is to show that they
> > can help you with their work on evaluations and their explanations.
> >
> > Lukas
> 
> Hi,
> Sorry I took a bit of time for this. It was awfully slow and I had to cancel
> it several times.
> 
> Nevertheless, here is my report.
> I ran checkpatch over 50,000 commits from v5.4.
> 
> There were:
> 1516 BAD_SIGN_OFF warnings.
> 
> out of which:
> 798 BAD_SIGN_OFF: email address <email1> might be better as <email2>
> warnings.
> 
> Since this was the potential error point, I dug deeper, and there were
> 293 BAD_SIGN_OFF: email address '<stable@vger.kernel.org> # .*' might
> be better as warnings.
>

Yeah, that is a default pattern for stable; that should be handled.
 
> There are 68 other potential warnings, some of which are are of type:
> 
> email address '"Kai Mäkisara (Kolumbus)" <kai.makisara@kolumbus.fi>' might be
>  better as '"Kai Mäkisara"(Kolumbus) <kai.makisara@kolumbus.fi>'
> 
> The name comment wasn't parsed properly due to the quotes handling.
>

Maybe you can address that as well.
 
> Recursive parantheses types like (john (dean)) were not found.
> 
> So I think for now, taking care of the correct name comment parsing
> for quoted names and proper comment parsing after the email address
> should fix most of the BAD_SIGN_OFF false positives.
> 
> What do you think?
>

I think both are worth the effort to add proper support to the script.

Once you have those patches, I can run another evaluation as well.

Lukas
--8323329-1785422012-1603618018=:25172
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-1785422012-1603618018=:25172--
