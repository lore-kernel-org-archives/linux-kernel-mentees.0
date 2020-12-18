Return-Path: <SRS0=3x+R=FW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DFEC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 14:37:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B26F23AAA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 14:37:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B26F23AAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B88A887825;
	Fri, 18 Dec 2020 14:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE6U-XXYJ4lP; Fri, 18 Dec 2020 14:37:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1E313876F2;
	Fri, 18 Dec 2020 14:37:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02ABCC1787;
	Fri, 18 Dec 2020 14:37:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DA44C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 14:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 572A2874AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 14:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M4rQ91mlk4Qi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 14:36:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 88CE887357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 14:36:59 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id q75so2815753wme.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 06:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q0J71R1gf5OwwDw/EQFfSYRpM22Ir6aczrJMt4g1sQY=;
 b=j5NPUcrBbszn7/VeZ9lVir+pnwZ2rJmqdjGKnIx47Ks36ejar8sWkxybFgOJKw5YD5
 U4AB7Ah/YAnRHq55fJ8J/IgRa1LbLiT2ER7ZXTeqPsmSTE4T0WFnb+YijeEdjofw9iXP
 MmwVrhp3DnTxOI3kc4zaylvmFUgGaS8djBQTEjbLpmRfH3eMlLC1P2Jy7Pn6pGO/rgYm
 PvrElidGsVc7tfrGstcnpgXQ7PwUBJiA0fT9pudo0oHEi3eytRaGTCCjCRs3wK52lwYk
 DEdv/MCY5SAIzst7zDyvHkHlBzHVsp1SOXVFVGkd18ROkc1oc32XqU9kQ2l4GGYy/Msv
 5orw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q0J71R1gf5OwwDw/EQFfSYRpM22Ir6aczrJMt4g1sQY=;
 b=mFN1B/NKdwRVhDERKkoy8q1XieKC6ao6ee9X/ON3w+dnLdQlpIuCFIk82IFSnP7a1T
 suk5dDzJVq6z2k+p4B3Xw5G/0m5Hoy6TdYHBD4FzwAxZhvH3WYdLaXcmhGNUMp8uMNFK
 Q0DKx1csi/62nXY/tbafj//L4ZA8TPho7QJizDlnMLVgPTq7nMzQX/AI7gQnmwI/cVOP
 O7v8ujwrEuhybOA3+U4ZSwH/Ubf+QJjPDmNKvvLPjzvakm2htm25QtCH0HevDv1x75t6
 uYbLme2UhOfujTu5R69n+k5MvxaQvHzTgjN9pvQX2WwRABjhcQSSTipgq37UNJrOoGz8
 EVjQ==
X-Gm-Message-State: AOAM531rHh47dzy5B7LDSTS6WA1IoCTfHNRVeXl3JUI1+ugK86AkpQFb
 dMdeDCjdnZELJ1k6lcg7osVs5BKoLqoYHiCwDd8=
X-Google-Smtp-Source: ABdhPJyrt/ujHvghJO90zhizEofk8GDOdHjC2IrahDvxZvsMKPoyghvDdUDfYDFN6Hc9eTUgZt2Gw7DiRQFeQlQXVYc=
X-Received: by 2002:a05:600c:255:: with SMTP id
 21mr4503511wmj.69.1608302217900; 
 Fri, 18 Dec 2020 06:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20201217195902.67041-1-dwaipayanray1@gmail.com>
In-Reply-To: <20201217195902.67041-1-dwaipayanray1@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 18 Dec 2020 20:06:35 +0530
Message-ID: <CABJPP5BcUxzH7KmBXkTLh9V3r40AQQinWdzb-NA_4dDRZDe3MQ@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] scripts: mod: cleanup a few
	checkpatch.pl warnings
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

On Fri, Dec 18, 2020 at 1:29 AM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> Cleanup some warnings reported by checkpatch.pl to make
> the code more in line with the kernel coding style.
>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
> ---
>  scripts/mod/file2alias.c | 156 +++++++++++++++++++++------------------
>  1 file changed, 83 insertions(+), 73 deletions(-)
>

Lukas, If you have no problem with this cleanup patch, could I send it
out to the maintainers?

Thank you,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
