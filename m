Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32E1C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:43:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F33362389F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 12:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F33362389F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4B50687A42;
	Thu, 17 Dec 2020 12:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdX0oa34Jkxa; Thu, 17 Dec 2020 12:43:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A1BB87A3E;
	Thu, 17 Dec 2020 12:43:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1887EC0893;
	Thu, 17 Dec 2020 12:43:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF487C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AD789871BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5xVDW7ISdkNY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:43:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C3BEE87032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 12:43:45 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id y19so56893550lfa.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 04:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UWQUtXrU5ffROweECn04iPP5neB1MVPW8OWIsHuB2Q0=;
 b=d1bFo6Ob6CtToa+lMy0JexeN7kL0XgbkLTMrQ6VUzeaaBG/mVExOoKNpvIJQ6VVUUf
 rQ4uqrXYUY65+g0u91lSdpyVcKVD31Bnhq784o6TDq4+yIkzUxgyyoO/5081H1E3pAdU
 DlaU3BV3sZ7PT9zBoi5LQjIndeEOpkW46a6x8kvSFS979TH7hOYtReiIQM+9D/x15brG
 rU9Fnb7zS4ZKUvNrak+sfo+jkt7SGth2LByeWUtcDgL1F1DI1Dz8iTi4ENiK+YYeCQjf
 QW79i/JBs/25KZPGSrwEBdqVuGq474AwrNJcdRHDA4BmwJnCPNFy1aUW7DkVRyWNKn0/
 yqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UWQUtXrU5ffROweECn04iPP5neB1MVPW8OWIsHuB2Q0=;
 b=XiWd6MP3pn3fTgyEyKiEAh5xNaUSsyI+LaMMq3n2mXayNwNybm2rmmaT99PvGRzSkf
 1bxloR2fCxFdHQIsCePitf60jNvpjuOxsHcjn9fiNwY1Wr9EmvII8TtJq6asPLtopFjX
 +4M9BBO1UIFCyPwErQH94QNc1jYTYoN3IwT5v1uFBRkk24683WkdlA1qlOTTAcAz/dnq
 dpxYPiGxXjNOQ32JX01ZY3JZx2bAjShDCTHx+7eEIscyOOlNqvsJdONzXBL07a4soliw
 TUo7Q5pxeDGp+1bB5zd29xm2N3P8Hf5Bhgz4kjSjkPSKhRxmPVcpPupNxIX8RayeFPuS
 olvw==
X-Gm-Message-State: AOAM533EmLyDvJMOHCEUzLa601IPgu9oZSNKZnNUZ6YhJVpfHbVy2Xix
 lFgCbXESSoPy8zoWH4k2q6n+j+nxoTQXa1Oyaa4=
X-Google-Smtp-Source: ABdhPJwgiThhewAzeWj35zi3Yt1aol/ChooAOUbNFtlN5Zs/jhs2UmbYTlZ3o4XTXqNEoGwhtTrnGUhgZVT3p5z9Dh4=
X-Received: by 2002:ac2:47e7:: with SMTP id b7mr11734119lfp.117.1608209023915; 
 Thu, 17 Dec 2020 04:43:43 -0800 (PST)
MIME-Version: 1.0
References: <20201217120634.19273-1-dwaipayanray1@gmail.com>
 <CAKXUXMzEbvv1fmtmijd6miQTm=oq--s_5gQ6QZ-tjh=752yrrA@mail.gmail.com>
In-Reply-To: <CAKXUXMzEbvv1fmtmijd6miQTm=oq--s_5gQ6QZ-tjh=752yrrA@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 17 Dec 2020 18:13:22 +0530
Message-ID: <CABJPP5DAz46Fwx2n85x0nKWO5LeTZ05O+=kh-NebOPBc6cWrPg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] acpi: Use DEVICE_ATTR_<RW|RO|WO>
	macros
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

On Thu, Dec 17, 2020 at 6:08 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
>
> On Thu, Dec 17, 2020 at 1:06 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>>
>> Instead of open coding DEVICE_ATTR(), use the
>> DEVICE_ATTR_RW(), DEVICE_ATTR_RO() and DEVICE_ATTR_WO()
>> macros wherever possible.
>>
>> This required a few functions to be renamed but the
>> functionality itself is unchanged.
>>
>> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
>
>
>
> Basically looks good. Send it out to the maintainers and await the feedback.
>
> It could be that this does not meet the naming conventions the maintainers have, but you will see.
>
> It is certainly worth a try and some discussion.
>

Sure I will do.

The problem is that the show and store functions must be in the form <name>_show
and <name>_store, otherwise they won't link. There are already existing uses
of DEVICE_ATTR_RW type macros, so hoping they would consider this.

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
