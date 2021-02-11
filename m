Return-Path: <SRS0=BNSL=HN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_40,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D69FC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 16:12:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E79964E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 11 Feb 2021 16:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E79964E7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D961787382;
	Thu, 11 Feb 2021 16:12:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fz9K3rkZHHMI; Thu, 11 Feb 2021 16:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7AAFA872B9;
	Thu, 11 Feb 2021 16:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72EDBC0891;
	Thu, 11 Feb 2021 16:12:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 719BAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 583C96E548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXiSJF2JHs4K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:21 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
 id B110F6F4A6; Thu, 11 Feb 2021 16:12:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93D436E548
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 16:12:20 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id z18so5522575ile.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 11 Feb 2021 08:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lfKA7HtvAYHlhZamQoH6uLELqwsgsh90Qs+Wc1jtl5g=;
 b=o3hyq8aYz0yMxUMkhxTwguD5wEaCxE+gNssPt+Y8yC1fwD4cWW/AEay258VKqz+xAH
 koUypwfSpG+0iCIVLzJDorQIMFERTsYbanzSw5DlQsMwr5L/as5kgXmgoa4EepnlESPo
 WsDHHXs+goYpgzRIBOoWTyO2gI2k2PJeHBjr6s+7ZSnkbIFo+rpPFzY09Ccn/uxMqc8Y
 uFZO7F5kfGxDEQTf3Q3dDyi9CpAydYA8MGJWFAvgMAHcwLWBcj6quGVGEZ0jaeNTAiWK
 z9MROht/v/RmtooO2kh0STNoPq6FOToxZerrn3O25wM85pKkD72N3gS+lVjgn0vYpSEp
 /6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lfKA7HtvAYHlhZamQoH6uLELqwsgsh90Qs+Wc1jtl5g=;
 b=PWJVQ5G9BB2efXbAJN9iqk+9AGwMZdJlEHyynVz317Zl3xHh9VG4f96bmWvzinJ1un
 bM4lNmOKx1H7UeZfP2MEwUTqC0zMHz06YSW3M8yLZuVWP4aPVC7ln5G+3Ec1Epv+OFoW
 MlHHMtHa0yjODUwfzB4byaQIl+gr49wwMzgWNtyYS5VAsyCZ7P6nDeivbaK6xgS4Bl5e
 q90sXecdV1LtTuw9bmnPOb9g4NPwYFdfrmJUKsf2CeefW5BgycKNMYrRgXPC14IdwWNu
 ep4LLcTDYR11Zl5DSC0wbQatPXI3FIRGf6CaO6A6ngLFShcY7jb/SNgCJRWZzJvlLG70
 SSfQ==
X-Gm-Message-State: AOAM531uUZx6YKOqX2WvTYB4h03dkZXq5cy+CPzDSwlYFaxN6Eg6qZfR
 vUZlFHTWos3EehxjFqJMMnZMRJgZauIfpS3rL3M=
X-Google-Smtp-Source: ABdhPJzaKuj2pJdNtXkt4S4ORbSoLfLignsAb7Cks3u7pVI6DMCTNzYpCs8iKoNP1IEjGXytJeu75Xz3qfJ3vY0Iz/w=
X-Received: by 2002:a05:6e02:1aa8:: with SMTP id
 l8mr6255536ilv.251.1613059939738; 
 Thu, 11 Feb 2021 08:12:19 -0800 (PST)
MIME-Version: 1.0
References: <CAJsD1pND-BukPuet4E2e2b-6Ci0G-ey=PBNTY9OTnr2nniT9mg@mail.gmail.com>
In-Reply-To: <CAJsD1pND-BukPuet4E2e2b-6Ci0G-ey=PBNTY9OTnr2nniT9mg@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Thu, 11 Feb 2021 17:12:18 +0100
Message-ID: <CAKXUXMyE6ggb_Ke1enfyYtgdB5Kz-=Ddn_zi6DOWqKYbSuqAWA@mail.gmail.com>
To: khaled romdhanii <khaledromdhani216@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Thu, Feb 11, 2021 at 5:08 PM khaled romdhanii
<khaledromdhani216@gmail.com> wrote:
>
> Hi,
>
> I applied for subscription to the linux-kernel-mentee, under this ID
> 27f10f06cc9b8fefb944a94a693d341db61f650e.
> But I did not get any confirmation reply.
>
> Please, let me know if I am missing something?
>

Here is my first mail to let you know I will send a second mail just
to the list (without you personally in To:)

If you get the second mail, you are subscribed.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
