Return-Path: <SRS0=XjTA=CY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B417C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 12:03:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13E0C21D43
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 15 Sep 2020 12:03:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIMELpfe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13E0C21D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9465A87173;
	Tue, 15 Sep 2020 12:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5EiQwLiS5ekQ; Tue, 15 Sep 2020 12:03:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F51687024;
	Tue, 15 Sep 2020 12:03:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C5E9C0859;
	Tue, 15 Sep 2020 12:03:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 683D0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 57958204B0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4ykMcgdltWbE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:03:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com
 [209.85.166.178])
 by silver.osuosl.org (Postfix) with ESMTPS id 042BA1FEAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 12:03:42 +0000 (UTC)
Received: by mail-il1-f178.google.com with SMTP id a8so2745406ilk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 15 Sep 2020 05:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CfaBd1Efs+fr0WAt+V/T41dVtRutX500qu13nkv9XMo=;
 b=mIMELpfeqMzT6MvX0WsB239HoRkzLsdYJIgrEq5eU8Sen9AASMVBCgLI1kJh99yfFv
 Q9/VUecQFWsfGBn3NSBGhwVxVBaGYmgLOovSUXpiUH9zN0dOYsD9lRAz3WqL3ju0gH0B
 5boLn3gHfOHdnNGX/NdIF+UR24mw4DGoqzMSUWS5rwS38+c+BAgv5cqVo1CqYJB6T4ky
 EXxHfYKFALMcCGI6InQsnA/PtJYREq61tZyGC5coT+x9ic11Lvo+qrBW1j0MILOs2O2q
 MxSf0Nny7wupiH47ppPaDQdkb/1bKonxWAiZ2dg1A54pTD0jSRd8yUyspMJONwC7/7M7
 EozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CfaBd1Efs+fr0WAt+V/T41dVtRutX500qu13nkv9XMo=;
 b=G00qbyAvGlyY9a8HURLnigIm2ZXFCw2t+GlfDMl1YIrpmSTudzKIdiV1OIzTLQHyJg
 OiqGBXExJKIHASotTqGu16zvSSXDkmv4NT7e9nJT4DHj1XyfDWVe8pl8+uCgD+dzDbpc
 ZQlS+CzNI07fnw0GZBk9D7/UUkagB5XxzdAlH0Q0fFZY4wKQDUplDwwcXt6FU1bS71mF
 nEZ487NTuliGNVmZk4wJ0AuJS5Z9N61Fubt8m+D4hySFZWIyqoS+uz/PbzbXuhQQ2tEa
 HQ2G/AIsJAKFqwZMcAzdoUhqae8S06GJTdjpGmSbUfxca6cE0QSIsJI+9u8rHkDzMPRu
 GQGA==
X-Gm-Message-State: AOAM531iV94oPrPf3TZ2Zts0eHzjAXmx9tScjKEjbIEumvlNanxiwlwY
 tmwbwlYG+t/XqCHByc3SpL6h4MOlgBlNVhWuwmI=
X-Google-Smtp-Source: ABdhPJzKgLwnBVhi9vkKWm/zxCfEMT5BJrhY2LRMGJf1tXfTRFStWY+M1dy4UXcBQ6BJJ8LenTzG4atleeGyPCjlAhc=
X-Received: by 2002:a92:dc43:: with SMTP id x3mr16128142ilq.199.1600171421172; 
 Tue, 15 Sep 2020 05:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
In-Reply-To: <CAOY-YVmJEQZhhOnC16bYyiow8z+B0o5FOsvQKmmXFqaaM-SAug@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 15 Sep 2020 14:03:29 +0200
Message-ID: <CAKXUXMzL6B+b0a6yDUSDdhV24jOaQZDiodbBW8OwgU=RCfDE_w@mail.gmail.com>
To: Himadri Pandya <himadrispandya@gmail.com>
Cc: syzkaller <syzkaller@googlegroups.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Question regarding marking bugs as
	"invalid"
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

On Tue, Sep 15, 2020 at 1:52 PM Himadri Pandya <himadrispandya@gmail.com> wrote:
>
> Hi,
>
> Is it correct to mark bugs as "invalid" if they have reproducers but
> the reproducer doesn't trigger any issue on testing current status? If
> not, then what should be done about such bugs?
>
> Thanks & Regards,
> Himadri
>

Himadri,

if possible try to determine which commit fixed the issue the
reproducer triggered.

You can potentially bisect with the reproducer on the git history or
you can simply look in the git log of the affected files if someone
mentioned fixing something related to the trigger.

That helps to make sure we do not just close reproducers that just
need a lot of time, configuration or luck to hit a certain crash.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
