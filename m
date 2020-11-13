Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C11C61DD8
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:01:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F8720797
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 14:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATVndjXf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F8720797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4AEAD87561;
	Fri, 13 Nov 2020 14:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mE0MartUMiHU; Fri, 13 Nov 2020 14:01:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA3208755E;
	Fri, 13 Nov 2020 14:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C6505C0891;
	Fri, 13 Nov 2020 14:01:47 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B2E4C0800
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2BDED87561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJKy9efU1xo5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 281138755E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 14:01:44 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o11so9826064ioo.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 06:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l34uzIAlK5x2Ajn9Lk3gFgnFnL5Mq1YkGqPQ7H+C73I=;
 b=ATVndjXfWfdEXb35YElM9CO70GiAibR44Ak6+ci2E09UqAIUCfdO4e8Fcbi3leembR
 Hx2e/AvX/jFGsGuNOgXyP7bLSbXijILj5ouz0kVRjtb45sH7PLDqBQn86sxOPmd7r8Y3
 qmruFjd9DwFNnLZZ2u2DnU3HmEIAZWXfljAaWgNdiX0HjT0hhQ7S0jsAhrPP4k2Hn10m
 WXrqF08Qfu1Od2LtFuVf6GtZmAVAieSGKl8IdgE9uGWSo4CeIlaEbduehy1jYc1d+bq8
 julmSCLYq4mClzenp0BU84qjNiSvOlkfP7j7SdPfs0i7FkR2u6jeKDFQiZF77JF8R04v
 w0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l34uzIAlK5x2Ajn9Lk3gFgnFnL5Mq1YkGqPQ7H+C73I=;
 b=ZRB3G5hog8ueOdz/emJkw1d/Ohlat6xR4BVVAp2CDni67DPq+NNceQiepd+UZxYiWW
 volzQg7L1nbOxMBchOhlNrst1ZaJv+zGwpXJNgkcN332cLnONjDReJZ1JfyCBfq9JFTB
 QHuJUm80/SBb58ySckPZJa2gs5F5ausgGENjkJzuWQkaoSAmU4pk3K10H/nsxwwvfJpQ
 Ra6fY4euDN9tXu9LiKf7YdnCvBREGM7iSSLkYOrrphdcjFY9qAjcZLzBE4FgRq+QDLGQ
 5nPn2OE5vsaEnlUz7Dg1GMFeVMVom4HKL3pZp9FsDIhwMjjv9rCoUX1ntyLRf9pkfzNs
 7YjQ==
X-Gm-Message-State: AOAM532lpaIjejQwIHCBnAPBFEhdKfKh1g9nFedeiB2cAxNuUl7yxJLe
 b2WM4sQHxu5vT1tMcMQVONftDByBOWbiO6loumg=
X-Google-Smtp-Source: ABdhPJySdyP49nggcZw+V8Pfjenm0dkml54lN3fGxZcr8Wv+aV7QghMHO2dSkNvitlKJBVKgWfCRePTb3OBKOFDgEjE=
X-Received: by 2002:a05:6602:3353:: with SMTP id
 c19mr1870028ioz.114.1605276103498; 
 Fri, 13 Nov 2020 06:01:43 -0800 (PST)
MIME-Version: 1.0
References: <20201113123101.29057-1-dwaipayanray1@gmail.com>
 <CAKXUXMxS-hF=j8wbwzc4d3x_guaUPs+WH=pK_QAJPEHmxg=5vA@mail.gmail.com>
In-Reply-To: <CAKXUXMxS-hF=j8wbwzc4d3x_guaUPs+WH=pK_QAJPEHmxg=5vA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Fri, 13 Nov 2020 15:01:32 +0100
Message-ID: <CAKXUXMzmFjZv231eBgeESosyUzahg9Uv9sUqxZ-68cGjCkwLnQ@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: add new cases to
	commit handling
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

On Fri, Nov 13, 2020 at 2:37 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Fri, Nov 13, 2020 at 1:31 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
> >
> > Commit extraction in checkpatch fails in some cases.
> > One of the most common false positives is a split line
> > between "commit" and the git SHA of the commit.
> >
> > Improve commit handling to reduce false positives.
> >
> > Improvements:
> > - handle split line between commit and git SHA of commit.
> > - fix handling of split commit description.
> >
> > A quick evaluation of 50k commits from v5.4 showed that
> > the GIT_COMMIT_ID errors dropped from 1032 to 897. Most
> > of these were split lines between commit and its hash.
> >
>
> Can you send me the file of the evaluation, e.g., all contexts (two
> lines above and two lines below) around the warned line in the commits
> where the GIT_COMMIT_ID dropped?
>
> Then, I can do a quick sanity check as well.
>

Thanks, Dwaipayan; I checked your file sent off-list and it looks good
to not report on those cases.

Maybe we can now check the remaining 900 cases once again; are they
all true positives or is there still a big false positive class?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
