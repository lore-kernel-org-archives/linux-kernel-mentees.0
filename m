Return-Path: <SRS0=q8LZ=HR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E4C3C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 15:50:42 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4D2B61494
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Feb 2021 15:50:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4D2B61494
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78F9487015;
	Mon, 15 Feb 2021 15:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDZRiSBNVetc; Mon, 15 Feb 2021 15:50:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CD7FC8700F;
	Mon, 15 Feb 2021 15:50:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B4C3CC0174;
	Mon, 15 Feb 2021 15:50:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EB88C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 15:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 94D9A867C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 15:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id givnXGthq1-V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 15:50:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 310D2814B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 15:50:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id r21so9453648wrr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Feb 2021 07:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qYv02kkDzygIz/c9kOz4zAZRF/qlhW6TZOluFWpeXaY=;
 b=JjLOlNL2WTq0Ismr3EVMEOfEVjfKUSqtfkQ1In8tOV+sJlej3MswyDj39mBRI4+5Qf
 agiRbXymc9s6rAoWpgd8V6xCi5uZiCzYJ5cja9oyAtWQ+CX2lldDVyr57oxdv3uQ1MrX
 iAWm4fCJqzuqSRHziqxyinAsNBk6SiSI94ITSbYJgy+/SjZ0DJeR0u0ermFMjwyGUlP1
 0s7HodiEOv4ZwI+n/AoVdqjxPy2Un4G9je3aJ3KX7Eh8BMWrviCoeAdfSjJQ44b9KJao
 TL1hUSjfTIoXBI7ClFcFDkUaCwAVFv9NA7F58wRH3euBOLy1h+tFHSNbDCEq/aKsuQPD
 bM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qYv02kkDzygIz/c9kOz4zAZRF/qlhW6TZOluFWpeXaY=;
 b=Se3UdnvKCiFO1vtoODqsUVhegEeNNZFJLj0zSvLQ1u+TD05BeS2uhnLfX883FMlWV4
 /GnEqs4bxrKEA0dFYR6yDPZpdnD92nc/5diOezO8TMwGE8EENcacy6c/AG4QbHj4uDu6
 JK6HoSMdLkvfJ1KVeUtnttQn0N3BNn0N7/0mXUkdIaCBizy9WZgX6Sf31QgqlMnMjKn7
 l17HIlpGtkc2Z4iJmyK+QgYCY9vIM8BLbZabOpErgVO/wETLYo1LaYPNKH2KND0hAO6S
 xYfEvAl0rCTmL1Xd8NNd6qhFNwxIT+wC5yZj+lGJOqzeWO1OJFGW9o7NCQv1WadlGaXO
 ERqQ==
X-Gm-Message-State: AOAM530PAShL6hTAW+8a/oMMgDigrx01AI7cFcf9GhXLHeks594GYIf2
 lxHl9g2pNNH08rkzPsC2e78Jt3UM1kMp5SGCmkE=
X-Google-Smtp-Source: ABdhPJwA1XGVnTWtihmdhv2mp/tRHTN0xJnmw+gRkdYClgm5YJknJdJ8Ml9KbUdZHifU5rsl6N3xKg4dTu2ruWrlPyQ=
X-Received: by 2002:a5d:620d:: with SMTP id y13mr19338833wru.88.1613404235605; 
 Mon, 15 Feb 2021 07:50:35 -0800 (PST)
MIME-Version: 1.0
References: <20210213131513.51386-1-dwaipayanray1@gmail.com>
 <20210213131513.51386-3-dwaipayanray1@gmail.com>
 <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
In-Reply-To: <b2e25e683a3e2f31d4dc2d666e082634e30643b3.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 15 Feb 2021 21:20:35 +0530
Message-ID: <CABJPP5As+68yMdX1CafXsam4rg56aCWUzsSNx6kHjtQnaJ_ofQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC v3 2/3] docs: add
	documentation for checkpatch
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

On Sun, Feb 14, 2021 at 10:27 PM Joe Perches <joe@perches.com> wrote:
>
> On Sat, 2021-02-13 at 18:45 +0530, Dwaipayan Ray wrote:
> > Add documentation for kernel script checkpatch.pl.
> > This documentation is also parsed by checkpatch to
> > enable a verbose mode.
> >
> > The message types in checkpatch are documented with rst
> > field lists. A total of 33 checkpatch type descriptions
> > are added.
>
> Alphabetic ordering isn't that great for these entries.
> Please group them by use:
>
> whitespace/code layout style:
> SPACING, TRAILING_WHITESPACE, LINE_SPACING
>
> commit message defects:
> BAD_SIGN_OFF, BAD_STABLE_ADDRESS_STYLE, COMMIT_COMMENT_SYMBOL, COMMIT_MESSAGE
>
> Allocation style:
> group: ALLOC_ARRAY_ARGS, ALLOC_SIZEOF_STRUCT, ALLOC_WITH_MULTIPLY
>
> > diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> []
> > +4 Type Descriptions
> > +-------------------
> > +
> > +This section contains a description of all the message types in checkpatch.
> > +
> > +.. Types in this section are also parsed by checkpatch.
> > +.. Please keep the types sorted alphabetically.
> > +
> > +:ALLOC_ARRAY_ARGS:
> > +  The first argument for kcalloc or kmalloc_array should be the
> > +  number of elements.  sizeof() as the first argument is generally
> > +  wrong.
>
> If you look at the generated .html file, the output format  is poor.
>
> It would probably be better to use
> **<TYPE>**
> for each of these blocks instead of
> :<TYPE>:
>
> and update the script appropriately.

Thanks, I will do these.

Also someone pointed out in the list that some lines in the patch contained > 80
columns. Checkpatch doesn't generate any warning for that. Is it something that
could be added to checkpatch or was it decided against at some point?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
