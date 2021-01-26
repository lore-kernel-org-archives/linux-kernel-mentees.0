Return-Path: <SRS0=tq4P=G5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45C0C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 20:27:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1C4E22241
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 Jan 2021 20:27:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1C4E22241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 45FA72035B;
	Tue, 26 Jan 2021 20:27:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mo1vA5BpTslv; Tue, 26 Jan 2021 20:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A60420109;
	Tue, 26 Jan 2021 20:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A6CCC0FA7;
	Tue, 26 Jan 2021 20:27:44 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B0E47C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 97C5B86E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxoXvjmNeVLB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:27:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A03F286DE2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 20:27:41 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id u11so21144195ljo.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 Jan 2021 12:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7BC90CD0PTIY5W4UOf1348/2Sa1Lnw1RkYhz1sW+sA=;
 b=NPg1HEvtCwWlJa993kKYIe+SG+enh875iXr3N0aD5t555WhYrGKysxVnXd3vA98soC
 PwvyIdUVKStnvrWaMl9LeolGj2KkqA9E0K7rlUTNdltYfKtHAY1Ygeg1kreGQPwKLRD/
 +tAgK8/6wxVyNx34CBJOURbgFmEpzEhoQf6ivV3NMGqljBqmGSHOYwTyV4FNkkKjQ/J4
 /higQVrTmor3NGlbv5rd37kp72cAcHb1aeglcLstefkAKug20su5P4PKDHCGQSRW3cdn
 xNKCDMxAZC5gQEHgPI51gNAdW3piWobR8vVgnuU+nj851o/qPdtc9fcOpLGHd+XmmJ93
 whPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7BC90CD0PTIY5W4UOf1348/2Sa1Lnw1RkYhz1sW+sA=;
 b=ajPQ33ePkKCRV9kv13bEdUdFo9CLSP4gU1/zHYabUSQFBVnYi+0OATzBvt1rBQVhZa
 a0bMteVfgiJNtYlpOqD4w/4EJ4F5CahRq2ssunGHRy4KuA1hXL5TrLnzS5V40AHj9EXI
 ilM7dp+sStoEPtfmkViVefONFL+i0T7K5EgQ2i6MjuF/NwZcbMi1GgMxIL/QcUSUCrKv
 QjqnbgXdURL7MiLFzkPrtbPX2m9Fx+qe7oFedP1orpfCN+wXlnk4abHaiRiOQ5whDuCt
 mgRGDWY3Hu5eXOGfDMPCHxxkeoSjqXK3LynYEd435M9DDrDKjojwZ0RvKuV8BI7FqJHR
 yOmQ==
X-Gm-Message-State: AOAM5326WU+ySZLvcmv1bJIdyN0v2PDAW9wPy5uRmRJfC5MGyd6PxgR4
 UuvXMOjL7XZxSgoGpotB7T/x9wc7nKUMMNjGLvc=
X-Google-Smtp-Source: ABdhPJzkVErijr+p+Mfq1XpcjOKKxt+JDm3KkQj0vMJ0bn3CLcDezRmve4eDY2+hbvIc/lBLGK95uMBqtC2cr6zsvzA=
X-Received: by 2002:a2e:9086:: with SMTP id l6mr3827824ljg.510.1611692859787; 
 Tue, 26 Jan 2021 12:27:39 -0800 (PST)
MIME-Version: 1.0
References: <20210126183521.26535-1-dwaipayanray1@gmail.com>
 <20210126183521.26535-2-dwaipayanray1@gmail.com>
 <9bfc9c21d93bb55419954114ed3a7e5cbdc84ddb.camel@perches.com>
In-Reply-To: <9bfc9c21d93bb55419954114ed3a7e5cbdc84ddb.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 27 Jan 2021 01:57:36 +0530
Message-ID: <CABJPP5Ap2=-suEZv+6OVONBPZjLEJEszG=O5ikDxHPiCcBRbFA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 1/3] checkpatch: add verbose
	mode
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

On Wed, Jan 27, 2021 at 1:41 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-01-27 at 00:05 +0530, Dwaipayan Ray wrote:
> > Add a new verbose mode to checkpatch.pl to emit additional verbose
> > test descriptions.
> >
> > The verbose mode is optional and can be enabled by the flag
> > --verbose.
> >
> > The test descriptions are itself loaded from the checkpatch
>
> descriptions are themselves, but themselves is unnecessary.
>
> The verbose descriptions are read from Documentation/dev-tools/checkpatch.rst
>
> > documentation file at Documentation/dev-tools/checkpatch.rst.
> > The descriptions in the documentation are in a specified format
> > enclosed within .. CHECKPATCH_START and .. CHECKPATCH_END labels.
> >
> > This serves a dual purpose as an external documentation to checkpatch
> > as well as enables flawless integration of the verbose mode.
>
> Using 'flawless' when describing code or documentation generally isn't true.
>
> > A subtle example of the format is as follows:
>
> What is subtle about an example?
>
> If there is something subtle about an example, there's also something
> wrong with the example.
>
> > Documentation/dev-tools/checkpatch.rst:
> >
> > .. CHECKPATCH_START
>
> Nak on the keyword uses.
>
> This should really just parse the input file whenever TYPE is found
> via some fixed format and save the verbose description after that.
>
> Use .rst Field Lists instead, and ideally, keep the list in alphabetic
> order or group by similar use.
>
> https://docutils.sourceforge.io/docs/user/rst/quickref.html#field-lists
>
> e.g.:
>
> :LINE_SPACING:
>         Vertical space is wasted given the limited number of lines an
>         editor window can display when multiple blank lines are used.
>
> :SPACING:
>         Whitespace style used in the kernel sources is described in
>         ref:`Documentation/process/Coding-Style.rst section 3.1.
>
> :TRAILING_WHITESPACE:
>         Trailing whitespace should always be removed.
>         Some editors highlight the trailing whitespace and cause visual
>         distractions when editing files.
>
> etc...
>
> > @@ -2185,6 +2235,11 @@ sub report {
> >               splice(@lines, 1, 1);
> >               $output = join("\n", @lines);
> >       }
> > +
> > +     if ($verbose && !$terse &&
> > +         exists $verbose_messages{$type}) {
> > +             $output .= $verbose_messages{$type} . "\n\n";
> > +     }
> >       $output = (split('\n', $output))[0] . "\n" if ($terse);
>
> Don't use unnecessary multiple tests of the same object, just reorder
> the code instead.  And also please use c-style function parentheses
> rather than bare tests.
>
>         if ($terse) {
>                 $output = ...
>         } elsif ($verbose && exists($verbose_messages{$type})) {
>                 $output .= ...
>         }
>

Thanks for the pointers!
Also for the output part can we do something to make the text
look a bit more nice? I think some of the verbose descriptions
can go a bit long.

Also will the verbose descriptions be limited to say single
paragraphs? If there are multiple paragraphs then the output
does appear a bit messy.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
