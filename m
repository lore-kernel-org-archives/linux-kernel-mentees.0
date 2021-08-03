Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE725C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8469760EC0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 18:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8469760EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C52A404D8;
	Tue,  3 Aug 2021 18:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kob8JzoDN3m3; Tue,  3 Aug 2021 18:11:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 81D43404A2;
	Tue,  3 Aug 2021 18:11:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A0AEC0010;
	Tue,  3 Aug 2021 18:11:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38F74C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C93401E1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:11:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H0--YyDu9EvP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:11:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E378E40001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 18:11:39 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id a201so37825ybg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EEpochwuwdVgz0lbtUVy7qJqhgey2RXjnSm1Ha5JRHU=;
 b=LmpRGm9LRDQ+2OlV9oyJ3tWoXzWuWE7pE8RWySjcJoTUNaqUMRqTrivsL0eXgFXtOz
 bDxyFUvzH06rvLAUxBtuoxJonmH56R3IwDVZhfHDBhiLFjohIaTan82jCPIjkoRyNskZ
 IolRbT+tLBpIuJgr8z87xBSQ7OWIi7cRIAryvqFFQV6CsIvIomGy+9IkZlaVf7u6329o
 K/y7Q/a2/Tt6SXWejrbq7pGj3titxK5hbLqy0SmXdhlir8qTEImVL3Ygp4ba+0wT62Gc
 sOSQUKHjRcMpJfja8GHb/Dhxz+AcEYkybuipbUqgqVd24vg5VUbqMDmt4sEKAE2uuRzN
 Hnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EEpochwuwdVgz0lbtUVy7qJqhgey2RXjnSm1Ha5JRHU=;
 b=VIyzinmW0g8bkrCWcr7tMX94lhWNzNOGDnPZtMmAgzf3UshGlg814w3vb8/O3QJPSu
 hgKaGas5Wrpaj0YQQpjRz7HQOJxYcmuMzHBwQZ/tCxXlX7X3cT3M8Wrky2J+LKQ3MTLi
 eqUHfS0oZB7GyA9LF9UHYRUtQQNEfxWIanw6QSCPUlF+JBTsRpwQP3d42C6y+U6uhcaP
 RVlDLyvEdd+MceA8NXY7QNelVk18v1B17shfqxExbbSUduGvpwCGTvR6r/Y8Z7DzjdKk
 hBiRhgvEseL0Zf5fRGMwwJXvC9nkyMq+pMIKVY2sPAYUpgHi6rD9F+3FPlcB7jxev6S/
 yU9A==
X-Gm-Message-State: AOAM532n4NyFzKzdgzbUl6BF93lBa5ogJhtzrftyALaw7SESWoqX36hB
 l8f6gtkSWc1mdUHYuRRPtKwI+YlAKkbkq2wPAdw=
X-Google-Smtp-Source: ABdhPJwHRjtCqE98aWqIGS/hPMMezbOOHFhsmPPrOaylAWm8Vxhb7wN1VLU4HtgbzOeIqMHUebunbHnFCbqZqh++/5g=
X-Received: by 2002:a25:d290:: with SMTP id
 j138mr32038334ybg.151.1628014298779; 
 Tue, 03 Aug 2021 11:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142131.17192-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803142131.17192-1-utkarshverma294@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 3 Aug 2021 20:11:28 +0200
Message-ID: <CAKXUXMxJ9CKP1nftTWmP-UTaMMyuOtoNYz4SQYrDPP9PdaRp4A@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: Replace symbolic permissions by
 octal permissions
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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

On Tue, Aug 3, 2021 at 4:21 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> This fixed the below checkpatch issue:

Use imperative; you can drop "below" here.

> WARNING: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred.
> Consider using octal permissions '0644'.
>
> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Usually it is Suggested-by first, then Signed-off-by at the end.

Do you find a pointer for this order of tags on the commit message in
the documentation, e.g., in
Documentation/process/submitting-patches.rst?


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
