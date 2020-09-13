Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8FAC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:05:13 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A31A920829
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 11:05:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvvKtJT/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A31A920829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BB4E85F35;
	Sun, 13 Sep 2020 11:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TFhewTS8Wpvn; Sun, 13 Sep 2020 11:05:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E915D85F61;
	Sun, 13 Sep 2020 11:05:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4FC4C0864;
	Sun, 13 Sep 2020 11:05:11 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A125CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8FDA085F61
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WeFvPQU_d_Hy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:05:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B923585F35
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 11:05:09 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id z22so19261722ejl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 04:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=bz3eq0lG3ZOrg/uBk9srUOMASNFUslZglRnZtcEvrkI=;
 b=LvvKtJT/RRYH1QdIChuZdke8f4kP9xPN43H7wEn4iks6znR8EoMAP0+w0DTolTXkvB
 +MVRQC3LNLEPmINvYqrLKscsfsO8MEBPGfcaK0orGibpy991Y+oVXa/aMtqlms9xkE95
 MmuGASJ+b6tAof9EwGRtiwNp+OTFORi747Ft7WU8+4/JuDry3YhJprq8ibWV7Q+8vfV9
 QULVFAC30yceRx4EWVEHyfX+Ak9qQGgeA46MH6Y1IUSx1LdOfQoDrH9IGEZ6TZNVnijO
 EuxU+VFWyZdjT000xXrcIS/sGTS2p89TaqWJeaJ0vOgMO1BXhONHKctsEUJSrxEHZ5y+
 CbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=bz3eq0lG3ZOrg/uBk9srUOMASNFUslZglRnZtcEvrkI=;
 b=Op8F5c7HuD6R0ZlITPekM1D6fw5ZD1Air3QVpZTZehBqSEQfLX3XicwD/dobq+4L/u
 dLyvgFRQBhz7Fs/USPc0HeiCFF6x9nGNY+EcYSWC7r6iZmgF4prmMwXju7Qxh1TBJT7J
 pq963Ojad9LQIg+oP2x84hxTRliEBnpkSt8UHXU7ajrelIt0QvwTwHpRNA7z5JfhJWyq
 TKM6sLl0Se2mvOmLYfsvFQ25hs0E7MtQW6s+y4pgVWVQk6dx3t8bB8LUgTCY+qZM/WhB
 3acBrfFhj2g5aJ3fQu2QmVREBxSeyZFHitR3UDWEVQ+OMpjUwiyKsP3B1elkFf3cOPjZ
 Q+SA==
X-Gm-Message-State: AOAM530hcAIF75Z7G3DELTuqRhYIGu2Fn5R+vTCElUqet9yiQNum322Z
 F4f4PcEg8Cjcjff54K+anUQ=
X-Google-Smtp-Source: ABdhPJyPb7AcCRPTtYdJEldzvRCqxCtasoSlib4A9+9o44s/gNMvwyt2B2vxkKG34+amrRVA/jEnHg==
X-Received: by 2002:a17:906:7e42:: with SMTP id
 z2mr9637091ejr.206.1599995108001; 
 Sun, 13 Sep 2020 04:05:08 -0700 (PDT)
Received: from felia ([2001:16b8:2d3b:f900:79af:10ed:f757:91c8])
 by smtp.gmail.com with ESMTPSA id v17sm5292827ejj.55.2020.09.13.04.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 04:05:07 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sun, 13 Sep 2020 13:05:06 +0200 (CEST)
X-X-Sender: lukas@felia
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
In-Reply-To: <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2009131301570.22585@felia>
References: <CABJPP5CSa_QowD-O3_E5ndoQJvuBv=n2x5WG-acwQKE=rt5+Rw@mail.gmail.com>
 <alpine.DEB.2.21.2009110925160.9220@felia>
 <CABJPP5AWNpYyx5asMNZccqbq07ZW+pH+EwJ+KTZ+SSOAnWZwVQ@mail.gmail.com>
 <alpine.DEB.2.21.2009121252280.13082@felia>
 <CABJPP5DMF9OpZR0agobunb3i3hLGkqedbeL-YohNn0X6Juk64w@mail.gmail.com>
 <alpine.DEB.2.21.2009121419430.3770@felia>
 <CABJPP5BFNjBhdcvBWqDYnR-o2sZ0oY77bYr9PxducXW4Y=482Q@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2060476258-1599995107=:22585"
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] Linux kernel checkpatch.pl mentorship
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
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2060476258-1599995107=:22585
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

> 
> As you told, I applied the patch and compared the statistics. In my case however the statistics 
> vary. Before patching total no. of errors of type GIT_COMMIT_ID was 270, and after patching,
> the number went down to 251. This is in constrast to the author's finding but the number 
> reduces, so the patch works apparently.
> 
> I am posting the diff of statistics before and after the patch:
> 
> 99c99
> < COMMIT_LOG_LONG_LINE: 1059
> ---
> > COMMIT_LOG_LONG_LINE: 1057
> 126c126
> < GIT_COMMIT_ID: 270
> ---
> > GIT_COMMIT_ID: 251
> 142,143c142,143
> < Warnings generated: 25661
> < Errors generated: 4768
> ---
> > Warnings generated: 25659
> > Errors generated: 4749
> 
> As you can see, the warnings of type COMMIT_LOG_LONG_LINE decreased too.
>

Can you share the errors that have changed after the patch was applied?

- Which two cases of COMMIT_LOG_LONG_LINE have disappeared?
- Which cases of GIT_COMMIT_ID have disappeared?
- Which cases of GIT_COMMIT_ID are new?
- Which cases of GIT_COMMIT_ID have changed?


Lukas

--8323329-2060476258-1599995107=:22585
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--8323329-2060476258-1599995107=:22585--
