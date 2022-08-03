Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CCC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  3 Aug 2022 09:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D71401D9;
	Wed,  3 Aug 2022 09:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02D71401D9
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ktfWfi9f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzbFzngJYYlK; Wed,  3 Aug 2022 09:08:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C81224006B;
	Wed,  3 Aug 2022 09:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C81224006B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 928E3C0032;
	Wed,  3 Aug 2022 09:08:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33113C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:08:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 077FB8133E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:08:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 077FB8133E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ktfWfi9f
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHGaZMPknv2k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:08:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C337E80B4C
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C337E80B4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Aug 2022 09:08:23 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id v3so19842047wrp.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 03 Aug 2022 02:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=eY4En0BOoCCAmSsPwL6benyjn9C8gmoGwOJ68i//GxY=;
 b=ktfWfi9fm5svqAfZHc2jVFs1hbGL76kq7LzSPBTWV4/LXEgfwjkegtg4K7dQph3NJ3
 azFhlavNae0EwGRkaN1Vt2UrYrDjdUz+KliVY2AoGsaHs+pkQlbAv+2eOjVO4IEMSO39
 aP33PosL/KaFIiMHT5jGETdnvnw29gyPB1P8x01/mmfAb5WQMtTHANolV4LFEunjNjl1
 pRuWuILImn7YsjNSrp6d51iokdDa+L2dNuOlQXUsgad893j+0pvlWNfVZcbul8qkf7Of
 fs/xlyDK+SWJJNP5A6eAA+6+U2Cmyu2BnuGrYf4FiwWDA2Mx4zj6ku1zdLv5mqKosHW0
 5/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=eY4En0BOoCCAmSsPwL6benyjn9C8gmoGwOJ68i//GxY=;
 b=n9XpMsKnj96w4k6nN/ChCMtA97Xhav/DrQY96V/tpH8gF+IcXFiDbfcNZIgJemc2Vy
 9+7yWlXeZoNInefmA/cgwi0MqTDyANIb9ybvuq77iQrDSRmS6YkAckdGs1idEE85wNxl
 LG3FfFrqeN2FK/0AbbNulTxGrTXhFUgXu9SHAJiNIoA/2XHLKNv32PN+ZiKEfCguhKdV
 VtKhmcugvqoWkqsptfo6UGb2WwMOx91WHsaDMedL2bth96vnUrX/aFFnAZZJ2Em+G2L4
 fW1iyfLfXFOI+bZvHhc9Pjue/xY8N2VtbswtNvJ/E4+6r1BU/KI4TIYvwe13A8auZjFV
 dFHw==
X-Gm-Message-State: ACgBeo2tByp0YUEWCO+xJNj0iJblR0xFwZhpmKOx7TcMwQlJ+4ZEds3R
 kwF23xT0+Eb8xDwYxeUHIs4=
X-Google-Smtp-Source: AA6agR4OOuglI3wbuGQIpZljSvCvnlsY784WKuSRG/XiY5yyJSSk9WlaqsKsGjK+dXBjuSDtM32XSA==
X-Received: by 2002:a05:6000:982:b0:220:6e5e:1087 with SMTP id
 by2-20020a056000098200b002206e5e1087mr4708780wrb.82.1659517702033; 
 Wed, 03 Aug 2022 02:08:22 -0700 (PDT)
Received: from gmail.com (84-236-113-167.pool.digikabel.hu. [84.236.113.167])
 by smtp.gmail.com with ESMTPSA id
 y14-20020adffa4e000000b0021eb309c97dsm17172475wrr.25.2022.08.03.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 02:08:21 -0700 (PDT)
Date: Wed, 3 Aug 2022 11:08:19 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] x86/numa: Use cpumask_available instead of hardcoded
 NULL check
Message-ID: <Yuo7A0KYoNnbgwWT@gmail.com>
References: <20220731160913.632092-1-code@siddh.me>
 <YukFgFTaq4Aw+uht@gmail.com>
 <1825f63b142.8968bde3116633.1242410031840350968@siddh.me>
 <Yuo2UkkyaYtZ3rMZ@gmail.com>
 <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <18262ed2459.44b0d74d434377.3690496800292832933@siddh.me>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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


* Siddh Raman Pant <code@siddh.me> wrote:

> > Does 'allmodconfig' reproduce the warning for you:
> > 
> >   $ make allmodconfig
> >   $ make arch/x86/mm/numa.o
> > 
> > ?
> > 
> > If yes, then this could be due to gcc-12, as it doesn't reproduce with 
> > gcc-11 for me:
> > 
> >    gcc version 11.2.0 (Ubuntu 11.2.0-19ubuntu1) 
> > 
> > Thanks,
> > 
> >     Ingo
> > 
> 
> There is no reason why allmodconfig would trigger the warning, [...]

Well, unless I'm misreading your changelog, all the warning needs to 
trigger is CONFIG_CPUMASK_OFFSTACK=y.

> as it has CONFIG_CPUMASK_OFFSTACK=y, but the warning is because of the 
> other case.

What 'other case'? I've re-read the discussion and don't see it, but maybe 
I'm a bit daft this morning ...

> Did you try the config file I had linked to earlier?

Yes, and it didn't trigger the warning.

Thanks,

	Ingo
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
