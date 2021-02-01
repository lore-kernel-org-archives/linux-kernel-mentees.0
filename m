Return-Path: <SRS0=YUr9=HD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC1BCC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 17:11:43 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55A4461481
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Feb 2021 17:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55A4461481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DEACE20516;
	Mon,  1 Feb 2021 17:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tnQtHBofoxii; Mon,  1 Feb 2021 17:11:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34C581FEDF;
	Mon,  1 Feb 2021 17:11:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21568C0FA7;
	Mon,  1 Feb 2021 17:11:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D88A5C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C866B86F12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:11:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GlmTNTOcKsvB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:11:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F101861C1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Feb 2021 17:11:36 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id s18so20546677ljg.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 01 Feb 2021 09:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pSPw/fBYIyhRfckoXNVPoWECxEnxFCcki9n6TzTl56c=;
 b=p4HKVnvrA0s7JvNr1TGoHlg2+K/dnjyGEXUGOrtnUC+Xt6iughcCUvwp62QPtoMzue
 2SUIZ9H6y7wNhVzeDOQBCZUUYl1uHaIiDwKwJcYHOgF+TK9JAYGdRO6lU04IzwylWg47
 N+DP7XE03GHXr8NYHzqXKq3AqFio8zCnZcA9hGeybCKrjdB86dq/aHSLvtl9GSl2WK41
 DAYZZbmo1ROti/RNCyxmhA/rrL+7SWLX+X2Dw5+2AMIVTNkWKzWJl6DohoT3Zf2yn2+4
 mRu68u/wFP/ssLicwA9AQ4MoEDHrljhhDuzpXsNod3ZL6vFkpVmYTitVbXb6iG9Vx5hY
 XLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pSPw/fBYIyhRfckoXNVPoWECxEnxFCcki9n6TzTl56c=;
 b=oJVQxkfYjFrnPKYFUBKlhnr5TN2OKkpIlMW4ommV3+L+2H4NVNYYnkiRbrJRwR2yYj
 W/p+jkpDeIdBDZmJ7AP9PqH3ML3syEWF5MbqFjrH5GhSpDmXQdvc98J28jDLK7vUhI27
 cWCt+q0Q5IGG5XSp9xjhH6wdFJ0v1xYv4xTbPG67rg0hpiyZ2z9uh/8cN4ly5pOFewPV
 +6vFynNLGgCaS3brWo+FOOs4gXBl+Uc8xKLVN9AAWc0rO6pi7YIs2KFpWYE42OoCpfQV
 E7+th1bxZNiA4avRaFRMSJbPAVrYmORzsSQadqkFr00jCOTbbHI6bZ/Ebijl3zzEUlEE
 O3ag==
X-Gm-Message-State: AOAM532FNOQ5dQzLXlaaKSgo8j5kKhsIDRzlHqKfGsvIoUkzRwLWODI7
 2B/cV6QPSCoKqLFDkP+2Tp914MzhArLKE7+DFB4=
X-Google-Smtp-Source: ABdhPJw8nSUGznpaS6dc1UPgQRIduQpA43hvr7kpNblSAILitmlqG44MzwQXd11rJwdPAAuWRaH7mVOIklRsAvjg+7Q=
X-Received: by 2002:a2e:7403:: with SMTP id p3mr10835574ljc.373.1612199494275; 
 Mon, 01 Feb 2021 09:11:34 -0800 (PST)
MIME-Version: 1.0
References: <CABJPP5AxB8-kafFEpsMydg8eMx8bH5ooT5g7r0fKWV2T2Hjtng@mail.gmail.com>
 <YBguQ/dENrfvtptJ@kroah.com>
 <CAKXUXMwtXTYfs_9Asnmpd09zsucg8tRehMi2Shv8V49H-rs4xA@mail.gmail.com>
In-Reply-To: <CAKXUXMwtXTYfs_9Asnmpd09zsucg8tRehMi2Shv8V49H-rs4xA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Mon, 1 Feb 2021 22:41:33 +0530
Message-ID: <CABJPP5Dt6KyoaMr-dS9425rozKoCyiPgx9WfoeY2541Aq3MF=w@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] Patches from the future - can checkpatch
	help?
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

On Mon, Feb 1, 2021 at 10:20 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Mon, Feb 1, 2021 at 5:37 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Feb 01, 2021 at 10:04:01PM +0530, Dwaipayan Ray wrote:
> > > Hi,
> > > on linux-next,
> > > $ git log --pretty=format:"%h%x09%ad" | awk '$6>2021 {print $1}'
> > > gives:
> > > 4a2d78822fdf
> > > 12ca45fea91c
> > > 09f2724a786f
> > >
> > > These are patches from the year 2085, 2037 and 2030 respectively.
> > >
> > > Would a checkpatch rule be helpful for these or are they too
> > > isolated to waste runtime on?
> >
> > Dates come from your email client, not the patch itself, how is
> > checkpatch going to catch this?
> >
>
> Dwaipayan, there are two ways:
> - We build a bot listening to mailing lists and check. I like that
> implementation idea for various other checks.
> - Stephen Rothwell could include this as a check on linux-next and
> inform the git author and committer.
>
> I am wondering though if that is worth the effort, three instances of
> a wrong date among 1M commits seems to be very seldom and the harm of
> that mistake is quite small as well.
>

I agree. I felt it was isolated as well but it might affect people who do
static analysis on the commits or such.

The idea of a bot seems nice though in general.
People do have all the style checking scripts at their disposal, but still
we see style issues on the list.

Something similar to the kernel test robot, but for style issues seems nice.
Is it something the community would like?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
