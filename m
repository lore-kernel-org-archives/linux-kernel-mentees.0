Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20F0C71153
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 28 Aug 2023 10:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51D1C60FFB;
	Mon, 28 Aug 2023 10:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D1C60FFB
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=nVU2W7l+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIlhlalLOVL8; Mon, 28 Aug 2023 10:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5FFEF60E35;
	Mon, 28 Aug 2023 10:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FFEF60E35
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33824C0071;
	Mon, 28 Aug 2023 10:22:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2294C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 10:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC3BD60EF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 10:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC3BD60EF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSwhK9kTiMXq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 10:22:37 +0000 (UTC)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CBE5660E35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 10:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBE5660E35
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-26f4bc74131so1951769a91.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 28 Aug 2023 03:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693218157; x=1693822957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yEaJWeBAVOoawr4c33mkvjoKOidJHOfAi0d6D3J7utQ=;
 b=nVU2W7l+NmxVDoUJL2WyJAGvhjit71AAHto0Hp6vd4G3o3tDeOnth7/rtm5+CafRBa
 FU3U4IbbtzjJjCAYNdlUnXH6Qj8Qep/bUf4KvB0lelGn7Mfoj68ULuvWwLzorZaYugdH
 zo6JmPxza0/p/K9y1/utstUzy9tLotzQs7+IHqzYSsqSykziMqaf9bYzdXqg533TtDlC
 zhUj7pc0ctVglVDy0VkYTk0Wwj3+F93yg8qP7HSKuF/uQhioRSMTd6PrqucIn8ItdWI4
 tuiDwcLZx1zFttMJHGWhTcB3L9v+mmWkzdByUKdjDjU287NRKzWpPd2bOJCtao/ZANpT
 lu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693218157; x=1693822957;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEaJWeBAVOoawr4c33mkvjoKOidJHOfAi0d6D3J7utQ=;
 b=c/fY/CH/qc4y5yhZ8PRheh6FFX/I5Eou9qB3MpUH6S8WQED4osI+DkVCvdI8xDKXSj
 NItdWbZo96NCep2FH7Lc6aGAshpW8ttS3nuBF8oZTAyvbUwRzuoWymzv/bayeWNjPb+P
 gxmgtqqCftZAl+q3mACAXJ3xpufpimS0CeqzGVdbCxS7K0Xe2gnZJhktUImhl5JYwRnI
 axCpYnHnLsJ7MUDpW4ZOR1UopZzsOTVcJ/JfX/gEej3agqtGgT1en3gWQSfKQFAKcn8G
 PUY9rLJMFAzduS2F/R63NTiIWFFQ6JYlYKyWcbTSCvOrsW7om2sAFXo+UGhoDTQDJifY
 aMdA==
X-Gm-Message-State: AOJu0Yyo3g7vnse8/5CX52jnG/LLV9jQkMZfNVm9ULyIrKsffcxJL/jm
 vaZmhHnzVCLSdyzULIIQUBZEWiMNdoleDvORejg=
X-Google-Smtp-Source: AGHT+IHunRJ8SKrwJgaP+51V2JJrecdxsMCTtZgn0eMB70U7pUC9syasL7KOaWROh+wvS8qj56tjawwSSP8Jbu9b7DA=
X-Received: by 2002:a17:90a:2a48:b0:269:68e7:bbb9 with SMTP id
 d8-20020a17090a2a4800b0026968e7bbb9mr38051213pjg.23.1693218157096; Mon, 28
 Aug 2023 03:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230828071829.64366-1-anshulusr@gmail.com>
 <2023082827-craftily-citric-06fa@gregkh>
 <CAPwwkU7+zHo2jpt+ovJDE1ca=K8AKyowyA5Z9pOFAy6iifVEwA@mail.gmail.com>
 <2023082801-cost-radiance-95fa@gregkh>
In-Reply-To: <2023082801-cost-radiance-95fa@gregkh>
From: Anshul <anshulusr@gmail.com>
Date: Mon, 28 Aug 2023 15:52:29 +0530
Message-ID: <CAPwwkU77=FvjtEFM9gzoMRLdporY8F7y1zXNky1Rj4cL0UpXHQ@mail.gmail.com>
Subject: Re: [PATCH] fixed formatting issues
To: Greg KH <gregkh@linuxfoundation.org>
Cc: richard.henderson@linaro.org, linux-kernel@vger.kernel.org,
 ink@jurassic.park.msu.ru, linux-alpha@vger.kernel.org, mattst88@gmail.com,
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

> Why are you changing coding style issues in this portion of the kernel?
> Do you have this hardware to test with?

I was exploring the source code and noticed a few discrepancies in the
coding style and followed to run `scripts/checkpatch.pl`.

> Normally coding style cleanups like this are only allowed in the
> drivers/staging/* portion of the kernel.  Unless you get approval from
> the maintainer of the subsystem you are changing, I wouldn't work on
> this as it's generally considered bad form.

I was not aware of that. I apologise in case my actions caused any
undue inconveniences, that was never my intention.

> Your name is only 1 word?
Yes, my legal name doesn't have a last name. I could change my From:
or Signed-off-by: lines to have "Anshul A" or add my informal last name
if that aligns better with kernel standards.

I appreciate your feedback and apologise for any problems caused,

Anshul
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
