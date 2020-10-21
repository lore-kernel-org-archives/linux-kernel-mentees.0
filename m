Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037B1C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 08:33:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2986322249
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 08:33:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LppJSM10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2986322249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91385872E9;
	Wed, 21 Oct 2020 08:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O+w-c0HhEOVo; Wed, 21 Oct 2020 08:33:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 70913871EA;
	Wed, 21 Oct 2020 08:33:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C3F3C088B;
	Wed, 21 Oct 2020 08:33:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 659E6C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 50E8385F97
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3YaDn-wO5L8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:33:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3C4CE85D11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:33:16 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id t15so1164302otk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zwpm2PfD1PoMEkSaTrtq7QS2AM6eOjCZf0fAoAResG4=;
 b=LppJSM10eJuC2YiFMMN2R1q2cEYfmVzgy9ICp+AGCsvQOQxyE/+5xYkdRCpmmzzvCZ
 xNE4GuM54XRbkee5KM6d2NNupj86GsZk/u2KNOVyDN0vCk/Fb72EbX/fJsFR/S5Kqtil
 8a+C5KK03F3ZVpIvwpNvpbg2NIkia2Yp+ZE9ThtS0RcVw+nLX+ztVsfXVNsEpt50uGi+
 7ftM5R+jqfA88Ci3iHK0U3/EDEK31ofGCoip+ycQnJz2VKNpHDi/7W61M59Lx6u3LHOq
 15S4wl01a82rN6b/MCzbRvgZ/0J5hlf/D4Oumh+4UUkLqAyBU64dGVU4u11fRXH5YfXS
 euOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zwpm2PfD1PoMEkSaTrtq7QS2AM6eOjCZf0fAoAResG4=;
 b=KRz9evFSV7swm2AAw9VKfkToJQ2CYYOm/7IJvtHfCfCjElLNFeSmH6QriQbpIxHx9q
 bKfW4rlTk6kJvfGLAf0EAoJ6cU+kOSs5zuMIBFrstf//p/4KpQ5+Y0QGLLwt6ZhOKx/P
 OygSNCnp+iQDwPeHMWrvldm797u8/9QHDrWhFhMpZk8WWoBIYruNKpYYz2+8yMVf3SNC
 8Ha+qFe+5x+hK3akJF5Ehi4V9JM2bo5Wn6LDkFo/+AZK64dlznuui8oUvE1fhQM1sOi2
 vrirEfpVhk0hG6iCLYGO1ADBwVmVate0ZtRtbyF6338z3ADMoUYteIxKlR3WCkFSttAH
 x1AQ==
X-Gm-Message-State: AOAM533xKW4BvwZCmHtE+99iGp8wq4KFCW9u6Yu4jZxhGwayu3LdH5G6
 4cTMDKDrhidYs6u/nrN8HAo7KKj6kaCI3NJa20o=
X-Google-Smtp-Source: ABdhPJwLDGqEg3xPKIdeQDjhNwAzyH1mALk/DkJ+89har1pp9Uux37ynGxYlJxe6VCGo+0I76AccMUZj0FhPLn62Hns=
X-Received: by 2002:a9d:1ca6:: with SMTP id l38mr1914049ota.30.1603269195280; 
 Wed, 21 Oct 2020 01:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5AF9s_qx=7Ory-4ZrwY7bEP9nAAtbzadozfwNPU_ymTEA@mail.gmail.com>
 <alpine.DEB.2.21.2010210717460.8328@felia>
In-Reply-To: <alpine.DEB.2.21.2010210717460.8328@felia>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 21 Oct 2020 14:02:47 +0530
Message-ID: <CABJPP5CQgkzYnq6KrwfAaaTbORLVSKqxdF=8-eM8stPtJOXOjQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Oct 21, 2020 at 11:01 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Tue, 20 Oct 2020, Dwaipayan Ray wrote:
>
> > Hi,
> > checkpatch seems to have problems parsing some types of
> > email comments. Some examples I could find were of the type:
> >
> > 1) address@example.com (Comment)
> > 2) "Name (Comment) " address@example.com
> > 3) address@example.com #comment
> >
> > These comments aren't processed currently which causes
> > false BAD_SIGN_OFF warnings.
> >
> > Examples are:
> >
> > WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com
> > (big endian system concerns)' might be better as 'David.Laight@aculab.com
> > (big endian system concerns)'
> >
> > WARNING:BAD_SIGN_OFF: email address 'stable@vger.kernel.org #4.20+'
> > might be better as 'stable@vger.kernel.org#4.20+'
> >
> > The earlier warning is very frequent in the kernel.
> >
> > I did send a patch solving (1 and 3),
> > https://lore.kernel.org/linux-kernel-mentees/a15a6cc0ddea068d78113f5e315eaba6f52b917a.camel@perches.com/
> >
> > Joe points out that comments and multiple comments can
> > exist at any part of email. (perhaps RFC 5322 Appendix A.5). So
> > that patch didn't solve the problem at the very root.
> >
> > What do you recommend be done?
> >
>
> I cannot say much of BIG value and insight.
>
> As of now, I think these cases should be handled correctly and the check
> for: is it the same name or is it the same email should work properly no
> matter where and which kind of comment is used (as described by RFC 5322
> as you pointed out).
>
> I might change my opinion when:
>
> 1. We have an evaluation on how many cases of BAD_SIGN_OFF (and related
> types) do we currently still observed among 100,000 commits and how many
> due to not handling comments properly?
>
> 2. We have a rough idea how complex this whole checking function will get.
> At the moment, I cannot say if it "just 10 lines of code addition" (even
> if they might be quite intrinsic to get right) or if we need hundreds of
> lines with thousand of special cases etc. (which I do not expect, but who
> knows which complexity might be involved, once we go into the details).
>
> So, I suggest to evaluate and prototype and then we can better judge if it
> is worth really going forward, discussing it with Joeand adding it to mainline.
>
>
> What do you think, Dwaipayan?
>

Hi,
I completely agree with you. We could run the evaluation first and
see what kinds of comment patterns are used. We could also keep
the RFC 5322 guidelines as a base and modify the code to recognize
the comment blocks as per the specifications.

It could get fairly complex, because comment blocks are allowed almost
anywhere. So maybe we should just solve the most
common ones first. That would help the committers largely.

I think Joe wanted a complete solution for it. So I guess i will try
to cover as many cases which doesn't increase the code complexity
much.

I will start with the evaluation. If others can help out too it will be great.
After it, we can determine what cases need to be handled and what
can be ignored.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
