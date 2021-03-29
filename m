Return-Path: <SRS0=0o+h=I3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BA76C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 16:44:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7DA61935
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 29 Mar 2021 16:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7DA61935
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97D24401C1;
	Mon, 29 Mar 2021 16:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE_I1OvZBhqN; Mon, 29 Mar 2021 16:44:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6642B40191;
	Mon, 29 Mar 2021 16:44:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49F38C000C;
	Mon, 29 Mar 2021 16:44:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28826C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 16:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16C464011B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 16:44:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fM_PUxLfdLXC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 16:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A7D83400A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 16:43:58 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f16so16727965ljm.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Mar 2021 09:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EJA04ZTI6BF3T7RTrxt/PRfIkpOFj2/PcmhPczxlcIE=;
 b=THtoF59AVOFrR2jstQBNOoDcCB3dQWh93fHaqXEcvO6bOXhPRvN/8TTsypthmcU/UM
 7owCSX8NkHl8e8J+iFGtj+lVPrVQnLR8m9FfUaHm2usLQF3/Ihx9eug/2HcW6JcqmMWl
 e1dSxyzypN/4jCg4LVG1Mi4NjAQCkdAeAMupYwoMRAmdRzvfbSutokQwCvgD71J9KIRc
 ioKEB6E5pMQ9ODdDJg49OAZPraUF1oMBiKUKb6VxvUQtncu5rNH1r/20pJLezAxSuChl
 wnwTupu+GYlnlJB90p5n1z7OfAxBC4ffWz0Fe7ambJ9mbYDgBBWCP3J2ve8YMcp+/Ahx
 TziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EJA04ZTI6BF3T7RTrxt/PRfIkpOFj2/PcmhPczxlcIE=;
 b=tBFbExCloLZFfPbQhJTWO/Ea8nTboo11c8aboPlAh7ZDFpg3UeYj/nSu4kxNasG2TY
 BfROOOQwMDHbdrdRWEU2SxUqGpsGlumX+8NGF9OSdguF5e2sXTbT6Eauoaqa9zG0VZIq
 JfUKVT5DBnBvFjDpnyzKzPtyz4jXBgCWFStipNc7zLama7hD6EHW8Dr54eFbes4jqp6A
 vuTWDRJQMMyBXoyWxTBfANAM/znSE2bL2r41BofLe5ucm2OWjDPAjfokPoGzEStoEJ8A
 PuOv5pRmU7vU+EOXPM6cwNjelp2rjMzWVn2aR8PKkh7bCOm0jAEvPLXzGlCY/VqKmtxb
 FndQ==
X-Gm-Message-State: AOAM5326W5sSpIe8RRkTOdqccVPkyAu1Srr8XHv4p9lz6zwfjQZmaRT3
 diUHu8/fQawcnNLQOPCkXYPWM3v7gJIfRUms6ZU=
X-Google-Smtp-Source: ABdhPJzS8PQfFWyMazbBa7Hc/f4knOhxnZndQbdzqKAFN6z6q+U1344mkldKZH8fX2YKnlVG0Nr19E2tf6O0Uy6Gu1s=
X-Received: by 2002:a2e:9a4e:: with SMTP id k14mr18376958ljj.116.1617036236649; 
 Mon, 29 Mar 2021 09:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210329142604.28737-1-yashsri421@gmail.com>
In-Reply-To: <20210329142604.28737-1-yashsri421@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 29 Mar 2021 13:43:44 -0300
Message-ID: <CAOMZO5DLaw7uCBX03YgpY7ZvcjNW6gdsbOx9et+pgEGjRMm=dw@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: imx8mp: fix incorrect kernel-doc comment syntax
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, USB list <linux-usb@vger.kernel.org>,
 linux-doc@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

Hi Aditya,

On Mon, Mar 29, 2021 at 11:26 AM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/dwc3/dwc3-imx8mp.c follows this syntax, but the
> content inside does not comply with kernel-doc.
>
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc:
> "warning: expecting prototype for dwc3(). Prototype was for USB_WAKEUP_CTRL() instead"
>
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

It looks good, thanks:

Reviewed-by: Fabio Estevam <festevam@gmail.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
