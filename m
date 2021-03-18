Return-Path: <SRS0=jPrV=IQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A144CC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:52:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12D9E64E99
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 18 Mar 2021 17:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12D9E64E99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C62F14ED4C;
	Thu, 18 Mar 2021 17:52:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hjbPGiyJKA7c; Thu, 18 Mar 2021 17:52:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E804ED2B;
	Thu, 18 Mar 2021 17:52:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89A5FC000B;
	Thu, 18 Mar 2021 17:52:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0A4FC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE52B4ED49
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGqCsX4s8WH5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:52:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DF87F4ED2B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 17:52:16 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id f19so3208676ion.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 18 Mar 2021 10:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzB7p1mrH7Ut3wO2SVOFyueQFUpspybATe+7N0GIt5E=;
 b=nlPMmM1nr7ne9QnqA2MOiSNWZJAp0UGD6TTtjFevPK2dYkM4NZPqpoGrOf8VuzU8A1
 cOGMALs1RmCKHTTn1dCIJFc9rmoc9wE5GlMk5ROz0NJlKbE7hM6FxCOGjWSFfGDyaP7x
 4Y0OtmnWlT0/C5uiOo4Oeo5qFJBITt2foM1il26KjttwX/rc+KyPlPDEmMZ53lUi4D9n
 fbghgbFC0ZEnFK2vTHwdMm5cfMODBLMPpGKzDR3CiZs/ZMElLJkpJfN4eF9s8Jo6lLEi
 jYEuXDgsgRWSWPxk65e5YtouL4WNZMBwPqaSdm8yg9u6bQS6k6n+nGUgQJud2Lz930LL
 QDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzB7p1mrH7Ut3wO2SVOFyueQFUpspybATe+7N0GIt5E=;
 b=GPDmaM2wubxJY5FReoPqSUC4yRiLKcNb8UfNSKPVuSfhNH+WEdmizHrggU2FmIpOcb
 3htdJ2iMnIO/nz8V3xYddbg2wCfAwhPR+CJ8bc7ZxN75MBBNkimB71l4rU6yFIoxZNMV
 2AJRZtSIKz6Q+o4NcaTsDJyUuqIrZpKKEESUMdWD3kn06uZEsWqubFmigxzrBkLoZxQc
 fQNIO1Vj7WdxwvfoSoBoh/YZXfSrGacmH0SICFx8+EIM72CMcQLErSuadKg3sn23Zv2u
 tvcTmUTXFn7Dtx7YsGjJ2Ko+EBtdLznwLtR+AcADFx1TVGSUgx0pfXl3VSkt7IgQ+lzO
 MgtA==
X-Gm-Message-State: AOAM533178becu8TGRZJ+8gWvJRsIub5fWRnc+T2Aimve54LT8uAzow7
 l7ntO9c+PwjqcRqU8YHiqZ096NJmbuYasGTtHLQ=
X-Google-Smtp-Source: ABdhPJz0q7mAqubSJL6bw761i7nrOQaEBtfa+ohfLNR3XIF8GLlyxWZakMPiS/4d1zpr0iXS278aTJHm9JVkUjtNWx4=
X-Received: by 2002:a5e:cb4c:: with SMTP id h12mr10762093iok.183.1616089935999; 
 Thu, 18 Mar 2021 10:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210309125324.4456-1-yashsri421@gmail.com>
 <8959bf29-9ee1-6a1d-da18-f440232864f3@darmarit.de>
 <c673e76f-72db-bbee-39d6-f5428e765173@gmail.com> <871rcg2p8g.fsf@meer.lwn.net>
 <CAKXUXMzwTp1H_vokVEAJSnmm7jNHfWzhhmLfpcrrBD9b8ak+dA@mail.gmail.com>
 <878s6kto3g.fsf@meer.lwn.net>
In-Reply-To: <878s6kto3g.fsf@meer.lwn.net>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 18 Mar 2021 18:52:05 +0100
Message-ID: <CAKXUXMxWOvM5HRwmAAWEsqQc2k6_ReqRw0uD=VANLO5D7OpFtg@mail.gmail.com>
Subject: Re: [RFC] scripts: kernel-doc: avoid warnings due to initial
 commented lines in file
To: Jonathan Corbet <corbet@lwn.net>
Cc: Markus Heiser <markus.heiser@darmarit.de>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Aditya <yashsri421@gmail.com>
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

On Thu, Mar 18, 2021 at 5:37 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:
>
> > I wonder if we could extend kernel-doc (not your preferred option as
> > it seems) for a new dedicated warning message or maintain a separate
> > kernel-doc sanity checking script to emit a dedicated warning based on
> > some heuristics that suggests when a "header comment" is probably
> > unintentionally declared as a "kernel-doc comment" when it really
> > should not be.
> >
> > Jonathan, would you then prefer to have a separate kernel-doc sanity
> > checking script that then allows us to maintain checking for patterns
> > we already cleaned up?
>
> Having a warning in kernel-doc for "This comment starts with /** but
> isn't a kerneldoc comment" could be useful, I guess.  That is the real
> problem, not the fact that it appears at the top of the file.  I'm all
> for tools that help us to clean things up, but let's not add
> line-counting hacks to try to paper it over.
>

Yeah, and as this line-counting is really just a poor man's
heuristics, we might just be better to really turn this heuristics
into a dedicated cleanup warning script, then we can check for more
indicators, such as "does it contain the word Copyright" somewhere in
the kernel-doc comment, which tells us even more that this is not a
kernel-doc as we would expect it.

Aditya, would you like to try to turn this check into a separate script instead?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
