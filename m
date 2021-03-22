Return-Path: <SRS0=kSKC=IU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142A1C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:58:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7961761937
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 22 Mar 2021 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7961761937
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1854F60692;
	Mon, 22 Mar 2021 07:58:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6pVzmfdjkbC; Mon, 22 Mar 2021 07:58:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EE4A60647;
	Mon, 22 Mar 2021 07:58:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B130C000B;
	Mon, 22 Mar 2021 07:58:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03D04C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D960440299
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:58:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8LeoJ1siyFl7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:58:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18D0F400A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 07:58:26 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id t14so4137858ilu.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Mar 2021 00:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjUh4Z4RgtL8JiHYyK0/QcJ+H27AzC9BDYxiVNhWEJs=;
 b=gDmpA2wcGOdKsndiPNpCQMVszURZapp0/2vAvsTOrM+1Hdkr29I1zhNr5xbxWYOo7R
 QbpeIgzRuUPt6vL5KFcV3Eu16CbOdtoVtTG96sCYBEmr9M82+YMcQOgwMazPCwT4AA7Z
 s8YYEmbm+v50jR060SZUwFB6asvVS1rbu5JOnWx3jqWjLAO5bKDJip0QOlatx2YVwaxo
 SmtP0CUZHrVWM07n9GWu5th+keUvbTtuuQ7M4wUp+7s1wwYkJUqjvisMEnLs3zRtiF25
 Yb2yAeQYLnA1sIrGngMXD11GSgJpwwrzstMc0pfep9iZ/ndpxsNUJdSicK4dXNTiB5zj
 hgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjUh4Z4RgtL8JiHYyK0/QcJ+H27AzC9BDYxiVNhWEJs=;
 b=qmoP9RKrFAgo170OsOa5/xkVXhxS5H1/Uhh4njRQsGIXfK/vjjyE+ZftWOXoLU9bkj
 Akhhg+phpD5j1Aacqc6id3Z7o3LIrr4751WHdks+7dGllmbrMFyuqGAp7fKGQxTu0Cy/
 oRz2lrJNrGX2W4gDht1W4a2PRe9SR1QchbCX45hiDwG7fSemW0tVq8CnJFrxuu7xNpkz
 7hvUbK0uLTYP2xSOyn6JzUGJDGi46rGTcWVpusWy0RYe3+GKt0E0hIFe1DvoDWawCk8W
 BHk5dVoU9z9tY/oHngAcOLZGoFzvmeWDcHYXOYdNRTyxLvbG1NVt9m3v71vGXYQ1Pvbe
 hjaA==
X-Gm-Message-State: AOAM533+P6ZlrOGG81tqSxA0/TEX7oM15hzroHQSFlhQ2Y1+ZIEevytI
 yky9Lbw+T4+M9yiEnvreRXDljLqH0osv0+p4Lc8=
X-Google-Smtp-Source: ABdhPJx3Ln1xdYfCv8YMp26gx5fnnaR6GybQlF+UGKVEWdLK1cgXdwPCkT18clNyNDdSFYTeo7xuePmkbpxQ6qzTLnE=
X-Received: by 2002:a05:6e02:1563:: with SMTP id
 k3mr10238355ilu.64.1616399906275; 
 Mon, 22 Mar 2021 00:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210321112645.60823-1-dwaipayanray1@gmail.com>
 <CAKXUXMyye_xKQseT7p-iq81cWKV0_GOunwb=OZ67qJwUnrKRMA@mail.gmail.com>
 <CABJPP5DE7sUEW_E+vERizS4cJLEWYfZD9deDagt4S7k7V2KwgA@mail.gmail.com>
In-Reply-To: <CABJPP5DE7sUEW_E+vERizS4cJLEWYfZD9deDagt4S7k7V2KwgA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 22 Mar 2021 08:58:15 +0100
Message-ID: <CAKXUXMxxufFDF2KRvL3UyKf4E=cVYov=E6fTiUpkW4rAm-c3NQ@mail.gmail.com>
Subject: Re: [PATCH -next v3] docs: document all error message types in
 checkpatch
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

> > > +    See: http://lkml.iu.edu/hypermail/linux/kernel/1309.3/01646.html
> >
> > In general, use lore.kernel.org Links for emails.
> >
> > In this case:
> >
> > https://lore.kernel.org/lkml/CA+55aFycQ9XJvEOsiM3txHL5bjUc8CeKWJNR_H+MiicaddB42Q@mail.gmail.com/
>
> Thanks. For some reason, I didn't get that thread link by searching on
> lkml. Did you use something else to search for this?

I just used the subject line and then found it pretty quickly.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
