Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7F3C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 20:05:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2898206D4
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 20:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ly6rY9rX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2898206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4576787250;
	Mon, 12 Oct 2020 20:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ee4S4xWZ-t01; Mon, 12 Oct 2020 20:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E589D8723C;
	Mon, 12 Oct 2020 20:05:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D10DDC0052;
	Mon, 12 Oct 2020 20:05:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4377C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8668A2010F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RjOhpwrZqO5O
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:05:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A1032002E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:05:34 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w204so4763756oiw.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hqSH8x5W7NZGOk9TjROMKcDZ6ZArabPzNYO3KI/Xelk=;
 b=Ly6rY9rXn8T/T+Q9vm/qvTdwTybWSpTpitDfB+oxqEAF00dj3MP5EG8bwb4v3NG8Yx
 duixobBiSXHesRcYIY1+cV4BY785pQOoL0LGfdh4BS0vEvbmS2CCAZaRydxo5tsWWdrG
 7oRTrV1G5UU02NwTsJ98g9JVtbk94Tet/MV5NR4tRh2jmocBR268OlANUu8KXsJvDc7b
 qup1PYSih7U++jtoLsBFFOGTrGWro0a00f2CgnY8dZ4LBdJbY0MdyJa+OhsUU0qibH53
 C0I5zGlSM+VyTyHHd1nO4mEcAC/RCmTy7JBVm2kUi7APl9zGfOI9l14rvL+dq3FczrCA
 4yFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hqSH8x5W7NZGOk9TjROMKcDZ6ZArabPzNYO3KI/Xelk=;
 b=dXqr8sHTDe+cC95Xb7EKIv7lcsipecMbUYR+uQooW884eC9n7ZZUAct1+y+KampFKl
 NWer0Pvcv2OZQlxJm3BcrxG9NOcOVO94cb3Dxt82WQgc6LF5afBC9CE474utxm6GYJXv
 5kMdcgHrkNzyDQ+c7BaKpJ9/9G5O1UaYP01JVjC/ULJt1TBiM1yPMIhcAk7hgsSjYcG3
 jnIokx7ZFXc2sPs3MAKR60PfU5be3am9CU5sh9RUwRTZj/j3rKNtNJ5FIMrNPR5N+G+V
 c/hJ/VNMi84rzvGWw4JyaAJlFB3OJkjzyZuSmPLY2e6Iv+PFrU6LnNAXWg8NFd3Fu1eZ
 uTWg==
X-Gm-Message-State: AOAM530EnopNWh0jvj9o4YXi9B/AHbQzU9SBGiKsnknK54pX/UOosLdY
 HxXWjiBa+E4ZXtv/zb6UNRXw9IYHRpS+cOWyGmM=
X-Google-Smtp-Source: ABdhPJyozjgpr4OLwQOijc8o27COB5X9Nla1R7vaKbbXyQx9tvtaXLLoRvX3dae0BSPVb9w0L58VrTzUTlUVtnVv/GA=
X-Received: by 2002:aca:2101:: with SMTP id 1mr1612073oiz.110.1602533133380;
 Mon, 12 Oct 2020 13:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201012191434.365769-1-dwaipayanray1@gmail.com>
 <CABJPP5CStDPHyV9MSgqueqfB8ZKdSgDZetXuRNbZZ1+Pk2aCdA@mail.gmail.com>
 <CAKXUXMzwHNhsi6+6J8Ajs-ZPe4McgJ+BgMfp7Apnznj_p55z0g@mail.gmail.com>
In-Reply-To: <CAKXUXMzwHNhsi6+6J8Ajs-ZPe4McgJ+BgMfp7Apnznj_p55z0g@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Tue, 13 Oct 2020 01:35:08 +0530
Message-ID: <CABJPP5BOOFofGcX8_92X+KdgU2++pveEHfcTccLhihO67W5Wsg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: formatted email
 should have a whitespace separating address and comment
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

On Tue, Oct 13, 2020 at 1:20 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
>
> The commit message header should be in imperative and it should be shorter. I think something up to sixty characters is preferred.
>
> Lukas

Okay, probably something like "checkpatch: add missing whitespace in
formatted email"?

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
