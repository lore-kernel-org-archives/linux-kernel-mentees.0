Return-Path: <SRS0=gXAh=HV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05199C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 18:34:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 844B864DA8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 18:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 844B864DA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14893606F4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 19 Feb 2021 18:34:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIlzgjfnL3cO
	for <linux-kernel-mentees@archiver.kernel.org>;
	Fri, 19 Feb 2021 18:34:39 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id E667C60703; Fri, 19 Feb 2021 18:34:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id C15FE606FC;
	Fri, 19 Feb 2021 18:34:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CA00C000E;
	Fri, 19 Feb 2021 18:34:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE48DC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 18:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DDB10861B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 18:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C4LD7-4g34mY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 18:34:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 199EB8614A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 18:34:34 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id a17so25240772ljq.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 19 Feb 2021 10:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CW5m+qZ7gBGEIF7vx7/oEhHdKGHAYAdRbwZI8t7kIYE=;
 b=ZgeD29lkmpDtX59gYUOmtcAy+UeK9HvtEwZKVB+GH3HdqKSkdR8D1GZdwSOgDOgkec
 XhlRqK7zYIeCXUsPN1DGiQ3zYhKfu+qt5TJNMt8OhYv+hoIdeVqb8xdN1mpR03VF5QLY
 eJLGUOiMesVen7LbSngnFulhJaFGGEF+nEoRuRayM3aZGYEXdzAUYHMxdQOnIO9jhcR9
 ZryxamRhs7jH/SRZWOghQgjyLDe3KIsByRvgyiH3tDy9pk34O1l4vnYqE0SBw0KWtmkq
 rKqaXAlGtoYtB5Qv43xJy/xn00lkEI7lOoyubm+NjZ0QjSFmhwn9cbHvE2kTBh683NtH
 W6Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CW5m+qZ7gBGEIF7vx7/oEhHdKGHAYAdRbwZI8t7kIYE=;
 b=DYH2WfczvXXQnmsuc1LLJz5F63+wfOH3AUZBT2/kAmEz1AWvUSlmL/9Is9T6V4ghdn
 O348JfCj0MsQOMJZJPL+QpVw8f7+Hf/vbmWEJqPptNUjViIlPsH/UPsg6W4+pVc/Hrwn
 A1VoUy85ugdJMI0PjxwmyIighLV9Ow6UpOTGgeGg6SjrN6m8bBYxk1/SWppGAzebrN95
 Q6jvPie4wOOkwCQKIdwrJN7enXommHy2TpL0d9v9Po2ZA6EEKpwC3DFa4AwcPq4AZ5aY
 DAcDcKfL7agEkkWlGaI//GAYP4kgDCgc0gzySwWezHLYWaU5uZc+eApz4seZEVBrFeVh
 2iYg==
X-Gm-Message-State: AOAM533nj9vIF2mGbFqufD+SukTnpWffDxXUS6SjrSe69lANCWK2Z6uA
 pGT8qfzGyvfmLO8ShE7orRwCuqSPzKmZRkCzsQk=
X-Google-Smtp-Source: ABdhPJxnFyATuq2qC795pWbKaHaXXI9idUixHlPBdO5otUNwcVgPOplvtCR8iRnGRawaLc721gPh7e+l9s8ev5wy8Sw=
X-Received: by 2002:a2e:8551:: with SMTP id u17mr2278991ljj.370.1613759672079; 
 Fri, 19 Feb 2021 10:34:32 -0800 (PST)
MIME-Version: 1.0
References: <20210217165434.69298-1-dwaipayanray1@gmail.com>
 <20210217165434.69298-3-dwaipayanray1@gmail.com>
 <02966e73a288d49372746d61547084e13a2fac29.camel@perches.com>
In-Reply-To: <02966e73a288d49372746d61547084e13a2fac29.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Sat, 20 Feb 2021 00:04:33 +0530
Message-ID: <CABJPP5DvMQZy2xbOEnsHHZ7o6BDYwDrPJfXhCFovCC0VhbnPfg@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v4 2/2] docs: add documentation
	for checkpatch
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

On Fri, Feb 19, 2021 at 11:25 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-02-17 at 22:24 +0530, Dwaipayan Ray wrote:
> > Add documentation for kernel script checkpatch.pl.
> > This documentation is also parsed by checkpatch to
> > enable a verbose mode.
> >
> > The checkpatch message types are grouped by usage. Under
> > each group the types are described briefly. 34 of such
> > types are documented.
>
> Of course with more to come as you are work on them... ;)
>

Yes sure I will be documenting all the types, albeit with a bit of time.

> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> []
> > +    This applies for all non-functional blocks.
> > +    However, there is one special case, namely functions: they have the
> > +    opening brace at the beginning of the next line, thus::
> > +
> > +      int function(int x)
> > +      {
> > +        body of function
> > +      }
> > +
> > +    Ref: `Documentation/process/coding-style.rst section 3`
>
> Ideally, these Ref: entries should use a form with the specific section
> to jump to.  For example:
>
>         Ref: `https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces`
>
> Perhaps "See: " might be better than "Ref: "
>
>         See: `https://www.kernel.org/doc/html/latest/process/coding-style.html#placing-braces-and-spaces`
>
> > +  **CODE_INDENT**
> > +    Code indent should use tabs instead of spaces.
> > +    Outside of comments, documentation and Kconfig,
> > +    spaces are never used for indentation.
> > +    Ref: `Documentation/process/coding-style.rst section 1`
>
>         See: `https://www.kernel.org/doc/html/latest/process/coding-style.html#indentation`
>
> etc...
>
>

Okay, I will convert the references.
Thanks for the review!

With regards,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
