Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5182FC77B7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 10 May 2023 11:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD12B4213D;
	Wed, 10 May 2023 11:35:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD12B4213D
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=A7JK7Aa8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dn45ceh3II23; Wed, 10 May 2023 11:35:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6BFFF42120;
	Wed, 10 May 2023 11:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BFFF42120
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5732BC0037;
	Wed, 10 May 2023 11:35:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97356C002A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7209583F74
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:35:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7209583F74
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=A7JK7Aa8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CPZw_7zb-Gv2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:35:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AE2083C62
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE2083C62
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 11:35:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f4c6c4b425so2694775e9.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 10 May 2023 04:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683718546; x=1686310546;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvApClf6Vwq7pYYq456swXVsLdXe4Yk/kHkfI1zIbf0=;
 b=A7JK7Aa8+cE+lTIOQPBBguTGx4LVhzygAywBRaxRWDXJpKHRJStUaUY0rPCDStOCSq
 GBOwjR+1YuWTe1dVqZQcobgsVkrlYymiSSrIgo+y0ASEPz75m0AzfCcw0fQzFPjjjYS7
 d6bzOGfAsvxNKXSfg0xZdsHy5GLoUdan879eDcH7YNC+L+C7ZB2Q+noqlVV1W1Pk56KR
 7bEuYPaKJmyf9WpoT0p220LaMblPNU6x98SZYeR65vem9VFLS+ZxqbhOETZtq+tXPA5r
 PVytCKL5HNhUazNOxTgiBgva7e24kHjSXwKigglEJI+dTeP4GBSTvCjnBOWyCxdAaAqP
 0bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683718546; x=1686310546;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tvApClf6Vwq7pYYq456swXVsLdXe4Yk/kHkfI1zIbf0=;
 b=V34GveFOeZlWI22/kD1s5KkDBlBxz3YXbeAyWF27XnCdXxhm3jIG6DgxE2Q2HaaGHj
 hQ5MEFP937zG/WgaNRKpVOl1H+Kw7V7+jrYcvdk9AhfWDcDeGYUxHBNdBQ2y797RPGPE
 m9cmOJFxwZzjWDaH2P4wtXKXluw1CdLZJD7HgSBj/jnETMklL6nFUiS1phZ/MlXMpBq/
 Q4nnL1WAZRqrlIRvp5gFkkqgatVyvc+qGONb8qtqFjvJymFZNOIog9b5Nmj0RqtugdbM
 ITgJYTFvaGVvGi259rRBHqDJWgCc8SlNRoYheTAjjJqxZg7FmvTe27iPGrBrD8dHyXfw
 6LBQ==
X-Gm-Message-State: AC+VfDxF5wD8fcI9Xkc0QE3eEMMGKk2PcrGRm4SqZmArlAU2ySm0f1vI
 XLVr+cNlBieWE7pdy6yXVmA=
X-Google-Smtp-Source: ACHHUZ7wo+6G+OTP/f1njXi4NgMQmaiEiKJ9+AcmhQdxQJiCG8NzXngE14HdSos3iGEqNEoox2RfcQ==
X-Received: by 2002:a05:600c:2298:b0:3f4:2bce:eeff with SMTP id
 24-20020a05600c229800b003f42bceeeffmr3624831wmf.25.1683718545727; 
 Wed, 10 May 2023 04:35:45 -0700 (PDT)
Received: from localhost ([146.70.133.78]) by smtp.gmail.com with ESMTPSA id
 y10-20020a7bcd8a000000b003f16fc33fbesm22321946wmj.17.2023.05.10.04.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 04:35:45 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 10 May 2023 13:35:43 +0200
Message-Id: <CSIKESNNLX5D.4VDA3E6NBN3N@vincent-arch>
Subject: Re: [PATCH v1] drivers: pci: introduce configurable delay for
 Rockchip PCIe bus scan
From: "Vincenzo Palazzo" <vincenzopalazzodev@gmail.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>
X-Mailer: aerc 0.15.1
References: <20230509153912.515218-1-vincenzopalazzodev@gmail.com>
 <20230509211902.GA1270901@bhelgaas>
In-Reply-To: <20230509211902.GA1270901@bhelgaas>
Cc: kw@linux.com, heiko@sntech.de, robh@kernel.org, linux-pci@vger.kernel.org,
 shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 linux-rockchip@lists.infradead.org, broonie@kernel.org, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org, lpieralisi@kernel.org,
 linux-arm-kernel@lists.infradead.org, Dan Johansen <strit@manjaro.org>
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

> Hi Vincenzo,

Hi :)

> Thanks for raising this issue.  Let's see what we can do to address
> it.

Yeah, as I said in my cover letter, I am not happy with my solution,
but we should start somewhere to discuss it.

> > Add a configurable delay to the Rockchip PCIe driver to address
> > crashes that occur on some old devices, such as the Pine64 RockPro64.
> > 
> > This issue is affecting the ARM community, but there is no
> > upstream solution for it yet.
>
> It sounds like this happens with several endpoints, right?  And I
> assume the endpoints work fine in other non-Rockchip systems?  If
> that's the case, my guess is the problem is with the Rockchip host
> controller and how it's initialized, not with the endpoints.


Yeah, the crash is only reproducible with the Rockchip system, or better, 
the crash is reproducible only in some modern devices that use the old 
Rockchip driver mentioned in this patch.

> The only delays and timeouts I see in the driver now are in
> rockchip_pcie_host_init_port(), where it waits for link training to
> complete.  I assume the link training did completely successfully
> since you don't mention either a gen1 or gen2 timeout (although the
> gen2 message is a dev_dbg() that normally wouldn't go to the console).
>
> I don't know that the spec contains a retrain timeout value.  Several
> other drivers use 1 second, while rockchip uses 500ms (for example,
> see LINK_RETRAIN_TIMEOUT and LINK_UP_TIMEOUT).
>
> I think we need to understand the issue better before adding a DT
> property and a module parameter.  Those are hard for users to deal
> with.  If we can figure out a value that works for everybody, it would
> be better to just hard-code it in the driver and use that all the
> time.

Yeah, I see, I see. This makes sense. Is there any path that I can follow in 
order to better understand what's going on at the hardware level? In other 
words, how can I help to understand this issue better and provide a
unique solution for everybody?

Thanks for the nits in the patch, I will take a look with a fresh mind
later in the day.

Cheers!

Vincent.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
