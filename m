Return-Path: <SRS0=+2S5=42=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AD4C10F27
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Mar 2020 12:43:37 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF70520674
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Mar 2020 12:43:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="Wlr9xGyw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF70520674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B88187F83;
	Mon,  9 Mar 2020 12:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dPLZKO5WyP60; Mon,  9 Mar 2020 12:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9D1CC86117;
	Mon,  9 Mar 2020 12:43:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD00C18D3;
	Mon,  9 Mar 2020 12:43:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03863C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Mar 2020 12:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E3898888C7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Mar 2020 12:43:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LqjJFx0LqX6i
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Mar 2020 12:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8821C888B9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Mar 2020 12:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1583757809;
 bh=4RIv9i/SqkuOMEcEXEmArSuhd0xYL7z8fjk+fLgtOhQ=;
 h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
 b=Wlr9xGywO3Fjk6tdn4GjNrWYzDCM9cW/n+sUOW0YqCLtRjs/2zm/JpXayUcKRj2uY
 Q9k9Kp0z5/60Ij8kr4GQSFcamo9uY9KxiW5Rm9AgzAds1sGg1tmKdaiQec5bZl+QMg
 za1aF5mJGEVBxlUdsFXN8PJ1fzMJd3Q39rK6uaSA=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.135.147.116]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MYZ8c-1iokuh0ADa-00VR5Y; Mon, 09
 Mar 2020 13:43:29 +0100
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>, cocci@systeme.lip6.fr
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <d239e6ed-8263-0015-3607-1350f62f1d38@web.de>
Date: Mon, 9 Mar 2020 13:43:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Language: en-US
X-Provags-ID: V03:K1:ig/xOfgqYJfxPbejMYI2Rqmrl6n9ocaMvMirDRWb2Aboj+F+LxC
 1BgRNrDktOMYofzC0kbPH4C8nEEXM8rilsxZhFbtD/tRX6jOx/SfVasnV/RR/mcDGi/t7Ss
 VKSMYplxroAsiIS9AzFkEfnfW2ppmdIpcVthrKqUwazk37LnSfwcneIhDQEUMSaYvwd/p8S
 RmmmHDqV4gT3ovzOKiMdQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tcue9jzqHgQ=:JQ/9PPUSJbihllXTcTvY4C
 6WYMwEfeMcKoL0q/Ftrb+yCgndjz4baQyegSLX7inpCYxPdVUZNkRkAdgy85dIiC/g9Xj0vGh
 tEa8fKIsjjDZ9ndGqsW6gdQhhGSELUP51PZn5nD8LwQ1DPVBCvq6kQPhpoIuML2ghPfvYAnuk
 NaY49mEo2otnOYdug1aySEIptHNaNGGzl/6oRe+OOjcPdsfZyNDQhFVNpWF1BquPSh1YjTMBJ
 N6SeuuWp7zrsSHy3/YzWRKYA3KP/09hxE+6KYEvQvpBwmHYcAyoXztGhEIfdXqMp/3PiMy3gK
 O6ZDCVLBBQ1B/7DBM1kfupLU5ppgCkpU7b4+RLB3LmUnKuSHs5GpJUnk21is9ZITHNFG+fb+f
 5co3+C/rfm8eXhHjrAT3OAVe+TSg4k5dkMyP1a4N2hjR9RWEBm3m3pMWsS3cvYjpN0cOpqcZU
 rqQpZV6RONIWLvE0TH/FYVR0CVGLigPdov2+KO4TNT5DKuod1Ak8NncAgWYbpkym7H5uI+uUZ
 wSuftOZQ/XgsRVljiDyA8xf5EjaBSoZzPjYU5GiBhjp5EvwNXVty2Jz6RFC0niq+9UsXTLv0O
 uMmgOg/YBLQD1TJZ+VkhqOocAOdu+oEjQ/B+8knTuowotAvleG3oQzNX4WjqIdMLRmgzB2sqN
 tBEmmF9ktfHow2frw3d3c6ZLroKe5eovNYD+zembYx3m0SbnBbMx/qxC/coWl68jewOT6QK4i
 FSsq9csiCyYXkF6a7HpudUd7XECcWRfGDEgtwIX28+8khV7uXREpJBdNiLDWSbtlmc5x9rXmg
 rlH05z+ykLmI02t99oPmu7rbzGqdhngk8JCxQdAdRRmZRQsel2OBJ3rBlidv08Hwjwa2FZxxt
 yGuT7FxcUBEKxX39Qi0K18R9r/D70vKGwKHbaRsYIGBivd1xjhDGf675CuKcdXO3TUlVqfNKM
 Fb4R5ICnJ0SbV9ReTpuMgeks3naoIh7sGgIC42CUSwM0VDQzLrTY9ART5PIjshgtKpO3pkne4
 dmVNLdyaByxiyTU7FeA9BiOzhhmRmzearpyDKKHSt/wfs4K03FEmLOrXBeQldrUcpyCPUEsq0
 Xrel9CCi8bmOJ3PTPwYsjvWbaOAV8ESX3JacLa6/lBVHTAyc7sDLcl5pHrvjtQUn4ocm+B6YK
 8lzk7jyZp2+XDcxNx02oAgdfo3m8+Ewp1G/oq2thT14dUEUZqXWW65ysqrPReaZrU2fq0bZ+s
 ay0ewOUuYx1Zk6bjt
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [Cocci] [PATCH 09/13] cocci: Reflect
 changes in SmPL visitor_ast in codebase
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

> as well as adding the additional arguments needed in the visitor

How do you think about to reconsider such a wording?

Regards,
Markus
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
