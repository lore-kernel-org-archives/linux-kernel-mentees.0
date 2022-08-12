Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B50C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 12 Aug 2022 19:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA20D833A8;
	Fri, 12 Aug 2022 19:41:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA20D833A8
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kPsTgBeX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjWveTRzxf49; Fri, 12 Aug 2022 19:41:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CD21E83332;
	Fri, 12 Aug 2022 19:41:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD21E83332
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A394AC0032;
	Fri, 12 Aug 2022 19:41:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 60107C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40A24418DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40A24418DD
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kPsTgBeX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rmFpiSnpq1VN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A0AB41886
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A0AB41886
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 19:41:47 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id p10so2186170wru.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Aug 2022 12:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc;
 bh=Iq/5xRoUiwhIFx5/vJDa4DTExyHthpSWn/1B/QHBuX8=;
 b=kPsTgBeX9cktKrXNkL/lPRmjzfAy4L6XD79mQmQG95/00rEk+ceM3GIn4BgNva38hg
 amUDp2pkk6KTBKklZzBmhq3a833FiUIfLr68tYN8bqJ73UZbCacqTMmc1q41irSUPPHv
 AhHuuw+LV+MiPtKSneGmZ6qWXS+1E7a/8hgazVTRHxk5jcSjaguDUBylbsrgybIH685R
 0hA3gK1l7201GHKEBLPIC6zeZzBqqL1Eu3/V529Q2pR6EjALlleAzg15z/+dBhpKNs/7
 xZfFKycaDbcDdlL/Ivv88WYV0K+poyzmg7JTSWHk7IsjkmRHzZqz0SP2qGp3bZ+ZsVLL
 opwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc; bh=Iq/5xRoUiwhIFx5/vJDa4DTExyHthpSWn/1B/QHBuX8=;
 b=pEUV3+u6Cu8kO/xroFsCH4WBd+2rpbjk54kmkZuqhmDmrULrjBM9mM9ZT226vADltz
 vbTB6n7ElVX0ZizBV455Uyk329k5hZfw7F3or1yhESan1ockRd/D9XObNCx7L/Ybe5Iw
 fnuk51W9DDGVbQ80ChPSXUSBesc7sNr+l3+5MOdTXvGwmwUsJLhVitpQp8uTo8Xq0r3P
 sAtgD8mWwRTMF8ekEcNDCuuacq1uKbZ45kJ/DmCe23HNkmV7C6z0H/KqQ6NuYLJ/FQx0
 kh0qSqA2jy7CyWRwa0t360sQFEEc9kBdvHNq+PWmedo7Ad83BSt08E7p3N2nSi8GBuJj
 hc2g==
X-Gm-Message-State: ACgBeo1zX9TkOlnyYjFbBYRvqoyarzekgvnGq83ogJjOsplQ+I4HgC0a
 njqECy3/O65VRCmhEWg0c0Q=
X-Google-Smtp-Source: AA6agR6x8ZPS33iAOgnu0Fc+ZWMdxOzvR4UNIdN9rN7SItiJdCgqQRnZcoqtuA5Q5vjzl9hwIbmQRg==
X-Received: by 2002:a05:6000:10d1:b0:220:5c89:50e5 with SMTP id
 b17-20020a05600010d100b002205c8950e5mr2999111wrx.335.1660333305255; 
 Fri, 12 Aug 2022 12:41:45 -0700 (PDT)
Received: from localhost ([84.255.184.228]) by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c2e4800b003a3561d4f3fsm384771wmf.43.2022.08.12.12.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Aug 2022 12:41:44 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 12 Aug 2022 22:41:35 +0300
Message-Id: <CM4B165JCMGL.1LA0ST6YL7QAS@Arch-Desktop>
To: "Starke, Daniel" <daniel.starke@siemens.com>
Subject: Re: [PATCH] tty: n_gsm: fix missing assignment of gsm->receive() in
 gsmld_attach_gsm()
From: "Mazin Al Haddad" <mazinalhaddad05@gmail.com>
X-Mailer: aerc 0.11.0-85-g6b1afc3ae3d8
References: <DB9PR10MB58813E33D3516BAB526156B1E0659@DB9PR10MB5881.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB58813E33D3516BAB526156B1E0659@DB9PR10MB5881.EURPRD10.PROD.OUTLOOK.COM>
Cc: "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "paskripkin@gmail.com" <paskripkin@gmail.com>,
 "syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com"
 <syzbot+e3563f0c94e188366dbb@syzkaller.appspotmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
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

On Wed Aug 10, 2022 at 12:08 PM +03, Starke, Daniel wrote:
> > Fix this by setting the gsm->receive() function when the line 
> > discipline is being attached to the terminal device, inside 
> > gsmld_attach_gsm(). This will guarantee that the function is assigned 
> > and a call to TIOCSTI, which calls gsmld_receive_buf(), will not
> > reference a null pointer.
>
> In my opinion there are only two possible ways to fix this:
> a) Move the gsm->receive initialization from gsm_activate_mux() to
> gsmld_attach_gsm().
> b) Avoid calling gsm->receive in gsmld_receive_buf() if not initialized.
>
> The current code might assume that gsm->receive is only called after MUX
> activation. Therefore, variant a) may break the code in other places.
> I see no need to initialize gsm->receive in gsm_activate_mux() and
> gsmld_attach_gsm().

Thanks for the feedback! I will send a v2 patch that implements a check
shortly. 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
