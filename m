Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5924C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:12:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E82D21D81
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 18:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qlOuxHbm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E82D21D81
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A37B9880F5;
	Wed, 14 Oct 2020 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id goHZfBtInqLQ; Wed, 14 Oct 2020 18:12:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EB7F880F7;
	Wed, 14 Oct 2020 18:12:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFE3AC0052;
	Wed, 14 Oct 2020 18:12:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96B97C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7E80B2E29F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TOiQzwlUVSUs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:12:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 354032E287
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 18:12:36 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id j7so111018oie.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U0lFqbPV6LL+3GwiEtkYs6HjlksJ2EhlSuzlNyHvcVI=;
 b=qlOuxHbmfnviwPmX1bO8wzlktBayGkF63uafDr9hY8kJpSdj62TG4fVsjjYAqfpLAa
 eOJ5o1ejC1jLEUerPLiWX0uEMYhoJYuzkgzzkiIqtSSiCWbK/3EEpaf0B/yNVgdY8Nar
 ztcHd11qcw/11sAAHy4cgnD/FmognMNYCAzSs4Ikk09go9gMAb6YcRUAQqnYiJr8d4sF
 3AP2w6pqyyMAlpAdB0HfJq0aBbm3oS9EJbvkqQJF+bkW9/4voYbutktNCc8J+JxAbOmT
 +T4w1o+1mc2hYRibZRAnv2L6cA/JlJd3EMbiMq/aQjHHl8rat5ISgCHmvH9XjPVlMCp4
 haew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U0lFqbPV6LL+3GwiEtkYs6HjlksJ2EhlSuzlNyHvcVI=;
 b=foNkHSgWunBEWZFT3rZxG2rwmeEeGVFqM8tTZw3CpKouTn03X1bPGag6iVMhr5o1Hh
 NTtgfZmSTzuXsnWVJgPFsyRW+pzm3f1wxqa9vXAZZpYnNnoX5IppGZIyR5KcWvLQE2St
 8TyhfkeerkLJCVcB2BYE1Jt7ucEgwq50JzMr2w0cOhy1dba7vL8lXAI3AnsMI2UQNx6T
 jq+FmdWD1ARARs+20pJ797eO+q6lfeb0i7Y1yq9P9pWRPzB7LIIBoZlWQ6IXjIT2RQ4Z
 IuUMX6Os2t6PiugQL7fPLkjVfzY5dUbuEz3Nzxf6xKO25Uy+aa6F2qp+ereHw1KYmOew
 K/hg==
X-Gm-Message-State: AOAM533T1gUztaP3DS5UP+607ycf0WdZub9XqH3nbY/4polKUuld2usp
 c4Ju2xQyeWKHWygQr61zs/F0jhYyZiGsdDlLx7g=
X-Google-Smtp-Source: ABdhPJyxMwz1sSrHmeyBcEN1SOXdjxpmftjPs/yczF6BkFgXoj8r52TWyGQI+aHhOYgz5zw1DFKyAE/muv0oTgqfIrs=
X-Received: by 2002:aca:420a:: with SMTP id p10mr355873oia.117.1602699155252; 
 Wed, 14 Oct 2020 11:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014163738.117332-1-dwaipayanray1@gmail.com>
 <ea011df1e30ce445d51e128287e2c6c38de20949.camel@perches.com>
In-Reply-To: <ea011df1e30ce445d51e128287e2c6c38de20949.camel@perches.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Wed, 14 Oct 2020 23:42:09 +0530
Message-ID: <CABJPP5DrSL7GoZUWc7P02CfLHfTBmfpLxrVOVQ08KH3pPontoA@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] checkpatch: add new exception
	to repeated word check
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

On Wed, Oct 14, 2020 at 11:33 PM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-10-14 at 22:07 +0530, Dwaipayan Ray wrote:
> > Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
> > moved the repeated word test to check for more file types. But after
> > this, if checkpatch.pl is run on MAINTAINERS, it generates several
> > new warnings of the type:
>
> Perhaps instead of adding more content checks so that
> word boundaries are not something like \S but also
> not punctuation so that content like
>
>         git git://
>         @size size
>
> does not match?
>
>
Hi,
So currently the words are trimmed of non alphabets before the check:

while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
my $first = $1;
my $second = $2;

where, the word_pattern is:
my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';

So do you perhaps recommend modifying this word pattern to
include the punctuation as well rather than trimming them off?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
