Return-Path: <SRS0=JFG5=JX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31C2C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4814B61006
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Apr 2021 07:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4814B61006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 148FB607E3;
	Mon, 26 Apr 2021 07:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogzrVGtmI1J3; Mon, 26 Apr 2021 07:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id F10626009C;
	Mon, 26 Apr 2021 07:30:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2825C000E;
	Mon, 26 Apr 2021 07:30:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D67BDC000B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0AD74023D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VK0qahfI66f2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:30:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E384B401E3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 07:30:36 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id e14so22110428ils.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Apr 2021 00:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LkEG60OsFu9FrrHqc7W5yrEHSQOTHViHA5vKzT1OWQA=;
 b=AkJh5L6KFuLrMJPqOmQ6dZtBRyNI88R6rUnFJmkG+uCyN9fN+oQoHG+LTGwZibS4NZ
 tIhtV4BBqMOQhSfon9LIPGjpKphc0acrJroi0tk5kG/618juMIwghkAq3NDXMy3wciBd
 FHuChsrfEhUw5cN4lEe6aeULDMy6SBg3AKlERV3dn+rZkMa2TmmL5noTWeFAn43kxdfx
 7nNrMgNG5AHzNq1xoc0Wzq4jAM+IXd3OhWqOa95I3Kk2Tr0Udnl1frFDogu6LznkjFaj
 78zJwz00+6GNumSpvmuxh5oqJMw46t6UJ/JJYgfhF24v72Ecx5wGAYPDrwSJJReTNQ7n
 vKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LkEG60OsFu9FrrHqc7W5yrEHSQOTHViHA5vKzT1OWQA=;
 b=F1uBWYLjrB2OjI2Eu/YcQhxcToqLUAoT/ABQBb29G5EEjtTBtBcLbqvHE7vzh9KFpd
 xpJoxIrOpj+xJkKne2lUQtkAVznRXrV3BsQj9I3gKUzDh75dzCyU46u5JAL4uVFxLsed
 3sYr7zRuHmgD0X7giptuKCzkqlpAgJVivfgQgKatEwm7blVYKBXDwGFy6Q4b+I7Jc4zN
 tV6CwFHSebljtNh316w2OTqeB+fbN4WYMmrc1gfUEbeiDMPwTqQjW/QyY/H1NPM1Jd9J
 B0bq4A8vmdRnY9f2UvlticqPc7u7gwsgZXpWi5hGzjL0nPpXelvOlCnTLCOv5fYZTp/y
 hogQ==
X-Gm-Message-State: AOAM530PqkLEL90gum3ItPqxoEc/t3W1vna3FndoavUj4ddu4uPYR6Xp
 JK4Vt6mFNy5wCAxdEQf80/SNhtdQc3E+fji7yLY=
X-Google-Smtp-Source: ABdhPJyNEVtxyhVT9miSaRKiIDK0onGJp3ASgUe1DrYYNhawVQT08Vu6Jbv7lfjF2SRy45fXZMdtjOKWE8HSiWaot3w=
X-Received: by 2002:a92:c048:: with SMTP id o8mr12819071ilf.147.1619422236053; 
 Mon, 26 Apr 2021 00:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <MN2PR02MB631763A2B44549BBC9A8939DA5479@MN2PR02MB6317.namprd02.prod.outlook.com>
 <CAKXUXMxJRthAWVsDR+m7OsJ_2O0UMv7SOLoAPE=spgSGZ741Eg@mail.gmail.com>
 <20210426102104.01c11e0a@gmail.com>
In-Reply-To: <20210426102104.01c11e0a@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 26 Apr 2021 09:30:25 +0200
Message-ID: <CAKXUXMxRUdavZnw03ZTZOf9L3T4Cwwms2-VJTas0GMfkmX8bpg@mail.gmail.com>
Subject: Re: LFX Mentorship summer intership
To: Pavel Skripkin <paskripkin@gmail.com>
Cc: "Wang, Haizhou" <hjw5074@psu.edu>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Mon, Apr 26, 2021 at 9:21 AM Pavel Skripkin <paskripkin@gmail.com> wrote:
>
> On Mon, 26 Apr 2021 09:12:03 +0200
> Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Hi!
>
> > Haizhou,
> >
> > please register on the LFX mentorship site
> > (https://mentorship.lfx.linuxfoundation.org/project/8f69e012-08d0-4e2b-baa7-9143b5f98823)
> > for this project and provide all required information there.
> >
> > Then subscribe to the linux-kernel-mentees mailing list (see CC), our
> > main channel for communication, and send an email with the following
> > subject and message in plain-text (not HTML):
>
> Dumb question: is this email required for all mentorships? I send an
> application to other linux kernel mentorship(bug fix), but I didn't find
> any inforamtion about sending an email.
>

This is certainly required for the mentorship Linux Kernel: Mining for
Maintainers; I do not know if the other mentors also ask to do that
for their mentorships and mentee selection.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
