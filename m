Return-Path: <SRS0=BNSL=HN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59632C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 16:13:02 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F34D264E8B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 16:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F34D264E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B82F487382;
	Thu, 11 Feb 2021 16:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yBB2Q8Gbca7g; Thu, 11 Feb 2021 16:13:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AFEF2872B9;
	Thu, 11 Feb 2021 16:13:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9EBC0C0891;
	Thu, 11 Feb 2021 16:13:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D00A7C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B14546E548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGi3p6iXb2Ex
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:58 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id 1A7B06F4A6; Thu, 11 Feb 2021 16:12:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 709F56E548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:54 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id f20so6196061ioo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=KWagL2MyLNtz50vxcG9VyxlTNUVWZnkM5i85n3fC7SY=;
 b=lIq1zzepnoAADOdZwl5XLzuWFOqX6ECRJUZrx9XsLRh6KXv8TUHVp7cHAFbvXvh/7D
 gWbFq7VIu5jcqwZ3L0hpPi6pyp+3dsC4Ok6S0PCJdDjySP8SC8MMDCzSRCDenZZB1JzZ
 3KR8yZL7iV55URHCV8uJdN3guFzz4/40GaCwiwRicDHjleeydIDqO9rGw6jKwsyOMW8S
 WsrfKxKjL2/xl/xx1mQoOyb3PcKmLWAd+bTo1P2RJqxjZ4/zG94MxZh1O6ME/LmWIZB/
 s87SaHtTP5whLoMwYFVarXQ6skIymkc4jxaULcpDgSTiYerLRwvq8KNB21w3SdwblJTZ
 MELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=KWagL2MyLNtz50vxcG9VyxlTNUVWZnkM5i85n3fC7SY=;
 b=CfJDsK2iKh4oe5OFgQMNcYx5v8qfaHmvogQKA/qVeOiaje6VtGJ9JZDi7j9UyW210v
 kcu9mTgKb3P4s8rAmXKwVMF8cTnPmjAWgR0OvHrUhYA3JSbTefs2nf2hNXE/wCA3QGdv
 Y2AREpI+/7Kbzv3QH8HgN8ReUOOKsBBjid6Fk8NwvH5DehFOj6/kGrkl1lpUh2ak9UeU
 sY3JTWJlUtipICPJN+FA6ExSMXV1bJuQ8+X0uX28zLokpx554MIe6EfAK85VgWK4YL1G
 /PX0LgBKxB2SB50507blGR0avtuFU8Q2gmcSmf8ZIm9ZNesqgFRnkNXL45goMTb3L2XM
 hMqw==
X-Gm-Message-State: AOAM531Bw1CaS3AdL19ljqsOGAiuPQc6H+iU8djxAcBO8xhWNZicPatJ
 UeeAl4Cvshd40V7ATlJSAzd9tbhXGhVZgQNSPeZz60oI38I=
X-Google-Smtp-Source: ABdhPJxogGru2rJC0ku4vxMvQZzg/O2hFzbDi+60meJ4w2LmlPHK1KuewlYnHhSLMXQgpPoX5IMifqFHu6T1ORvitd0=
X-Received: by 2002:a5d:9cc7:: with SMTP id w7mr6051647iow.189.1613059973531; 
 Thu, 11 Feb 2021 08:12:53 -0800 (PST)
MIME-Version: 1.0
References: <CAJsD1pND-BukPuet4E2e2b-6Ci0G-ey=PBNTY9OTnr2nniT9mg@mail.gmail.com>
 <CAKXUXMyE6ggb_Ke1enfyYtgdB5Kz-=Ddn_zi6DOWqKYbSuqAWA@mail.gmail.com>
In-Reply-To: <CAKXUXMyE6ggb_Ke1enfyYtgdB5Kz-=Ddn_zi6DOWqKYbSuqAWA@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 11 Feb 2021 17:12:51 +0100
Message-ID: <CAKXUXMyLHY09X6=EY=ZT+wLqH65C+yiVmO5AAt5moCbW7+TV9w@mail.gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Request register confirmation
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

On Thu, Feb 11, 2021 at 5:12 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Thu, Feb 11, 2021 at 5:08 PM khaled romdhanii
> <khaledromdhani216@gmail.com> wrote:
> >
> > Hi,
> >
> > I applied for subscription to the linux-kernel-mentee, under this ID
> > 27f10f06cc9b8fefb944a94a693d341db61f650e.
> > But I did not get any confirmation reply.
> >
> > Please, let me know if I am missing something?
> >
>
> Here is my first mail to let you know I will send a second mail just
> to the list (without you personally in To:)
>
> If you get the second mail, you are subscribed.
>

And here is the second mail.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
