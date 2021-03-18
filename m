Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24EA4C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:03:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E5564DD8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:03:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E5564DD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7835F400BF;
	Thu, 18 Mar 2021 17:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l5Kae0WoQPXa; Thu, 18 Mar 2021 17:03:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id B33FD400B5;
	Thu, 18 Mar 2021 17:03:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E6E4C000A;
	Thu, 18 Mar 2021 17:03:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B4E5C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BD0A4328B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BFSSwAQhzkoQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:03:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47454400B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:03:23 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id t18so5524528iln.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHHiM/ItqAn4rSR71ej22kWQ0vY81ks2qnnMGgdZ67E=;
 b=SsbfvpLur2SdEW0nlOiPXuPgRifew2eISC8RDFKN47D7zXzxRgbpNMiAWDsarrK11+
 t5lv0CARkL1RlCpjnmHjOY1YVcKxOrzAxu3kSmk4gR8STWyv9TGmt2zp+w9RFWIIa2DA
 k3UacE8MNIkI7qflBda6h2KNqP0MX7GmLj7L1zFSsXJtrFyXwTn4tRh4bJHFrRgm9Kqp
 t8y5yOnP79oL/OL4iIFHnBi5Aqh9JZeQGSkc4KF4Ywr+kivfGozx4ataO8IltvcIawnH
 rpyvzPQ4CPS4crthLILToDwri8P8HElKTO4Em+GHHWL37fo2HvgTTzy3aII5SDLz+7a4
 pUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHHiM/ItqAn4rSR71ej22kWQ0vY81ks2qnnMGgdZ67E=;
 b=fu3Vuy7B+vh9ydZpvbykA2wlbv57V45ObImANKjWtEW8hWvCrf+7OuYNyWxyI6bDm9
 jQuBNjwh/8fwu+9F2aozYvHsfyJEAaRx+viyHn0dfJIo+dWLdD4F63tf8vGuW9bPsrCR
 YWxg+SfwRg2Fnt4ZhbTwDvvCGtn8UkZC7tWjiLEbAWvFJOabmMg4FBl+Dfin3Mejp/Jw
 kXgC9/JH4YmsDZvxqP5KFY/+EP4Akzpiw0tuDMo1kEvPJ9DYCRn4vSUbFtojKHqbSOco
 KO4xPD7m09divh29rkR0l+cv/19uPKdNTzuoS7byKpBDKVs2VhE6H6NAu6DQ2v7HC+Gn
 CGjw==
X-Gm-Message-State: AOAM531IDwmcMMowVjJszQQC5i1B0U77mxbZyZvv2z7nko4yAgn6sN62
 53m7c2KH8agZ8DFakIgl7gj6uR86o6W8pa6PRDk=
X-Google-Smtp-Source: ABdhPJxQ9Lo/ry32fvcKgQngZDlZn+Y272b0LjPJU8+71Om6KXLWhClx5bZXn7uPwE7Tdc2ZoxnqhQflJcTgako6YCw=
X-Received: by 2002:a05:6e02:1563:: with SMTP id
 k3mr11861004ilu.64.1616087002402; 
 Thu, 18 Mar 2021 10:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <CABJPP5AjUJ+OWqUy7cR1Ar2zcs6QuLizciGf64WVQ-027rS=bA@mail.gmail.com>
In-Reply-To: <CABJPP5AjUJ+OWqUy7cR1Ar2zcs6QuLizciGf64WVQ-027rS=bA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 18 Mar 2021 18:03:11 +0100
Message-ID: <CAKXUXMx-4p361gFewN61NEbrwTjVY9wZFg2i13VMZTUxiDJB=Q@mail.gmail.com>
Subject: Re: Checkpatch still worries about include/asm/ ?
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

On Thu, Mar 18, 2021 at 5:47 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Hello,
> include/asm/ got removed a long time back (probably v1.1.45).
> Checkpatch still worries about that:
>
> if ($realfile =~ m@^include/asm/@) {
> ERROR("MODIFIED_INCLUDE_ASM",
> "do not modify files in include/asm, change architecture specific
> files in include/asm-<architecture>\n" . "$here$rawline\n");
> }
>
> Can we remove this check?
>

Wow, v1.1.45... that must have been taking quite some digging in the
ancient dirt to find that out.

I agree, let us remove that rule.

Thanks for the documentation effort on checkpatch.pl and cleaning up
obsolete rules while documenting.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
