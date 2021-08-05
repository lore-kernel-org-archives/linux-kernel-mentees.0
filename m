Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58D3AC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:53:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5C561157
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 13:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B5C561157
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C866060767;
	Thu,  5 Aug 2021 13:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfcBZ77XDhpt; Thu,  5 Aug 2021 13:53:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 28D6D60763;
	Thu,  5 Aug 2021 13:53:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 07C16C001A;
	Thu,  5 Aug 2021 13:53:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3B01C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A25C840372
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:53:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QidMqA5FOsb1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:53:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B801B4041A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 13:53:08 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n17so8567119lft.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 06:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZDqK2yEiWSOVCP1fsKTVf8sBPeIuILokeDMx91PUApg=;
 b=TK76m+T0M+0iKDRuQKrVNnOo3zmgOcxtmTbhJCqHVOtnfSrqWbTCiU7swnUw/zq92N
 Ev/3yygHY9rgpa+vubmIhwFucOakBeFMyqRRPHnzfP8fm7A1C1pRkWw2PHHxvCoHuOBE
 ZL/FAs3wfZE7mtnBGUvH0NeDNmaQrjANzRejVwjEm1DBtHGuk8Szu7UM+N+f7bko3oKE
 uF8cFJGt+ETmV0Rhv61sDwrH+dG89VpUXbhvlDtIh4OcUBA1aMGll09fnv1nZut0W95j
 kp7LJ2idJaLCgmKwktZsM9K/Ij8tXSCyL+rFEVbd7LAvQjSt5Zv5i5ZuzyCj8ngOUHRb
 AYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZDqK2yEiWSOVCP1fsKTVf8sBPeIuILokeDMx91PUApg=;
 b=sc8sw6oKo1JSVix3D5LgB+EYhcXNj1d7yDEGUL0wYxvvXIpHAeeF2Ma3lzDojs9/96
 YgAHvR52V+4tpBhVofVbvXbehbX+K20h5+4x36vemZF8loIXF6dRLG3UQBYbObH+5hYa
 DESF/U4yr7fCxKe/+j74b5sT3n5T89U1rzyV/VZPS9Iox8PoS0HLzXWbKyDvmwgC2dql
 RDqwMMQAgWIDKxO7EgZ1JW/bf4v3kOusjRzgRJ+dZlhRDxDgSTBzJlVRphmW+ajO7DHY
 GPu9qGECn5l4c69IZ5xPwG9uM88J5sy89s+/X04LYWd+VUkuBKQA5Cb61wDygWVk1+Np
 l3IA==
X-Gm-Message-State: AOAM530xUw1z8yJNu+iCyWSEqG4ilU9mZzG3K6nDSA3eepfXqzC8OioZ
 /9S1IfJLTb+rdqWYx14nJnrI9QXB3IgUUR4YlS0=
X-Google-Smtp-Source: ABdhPJxQTCTRD8AVDbKu+aEBoGfBtcQkuurPFXZx4+xV/B6z/8Zbag9sJ4tkmzip2bT+seiB1pnUeIMJLSMi7fnHhhM=
X-Received: by 2002:a05:6512:a8b:: with SMTP id
 m11mr3935590lfu.20.1628171586456; 
 Thu, 05 Aug 2021 06:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
 <20210803142109.17137-1-utkarshverma294@gmail.com>
In-Reply-To: <20210803142109.17137-1-utkarshverma294@gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Thu, 5 Aug 2021 19:22:54 +0530
Message-ID: <CABJPP5A9wjSpoYfX3j2v1dUGWv17hE6mNztuk5z2d5hyFuwohA@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix quoted string split across
 lines
To: Utkarsh Verma <utkarshverma294@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

On Tue, Aug 3, 2021 at 7:51 PM Utkarsh Verma <utkarshverma294@gmail.com> wrote:
>
> Fix checkpatch warning "quoted string split across lines".
>

You could write a line about why this change is required.
And that there are no functional changes.

> Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  drivers/usb/serial/iuu_phoenix.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> index 19753611e..f2c0dad91 100644
> --- a/drivers/usb/serial/iuu_phoenix.c
> +++ b/drivers/usb/serial/iuu_phoenix.c
> @@ -1195,13 +1195,10 @@ module_param(boost, int, S_IRUGO | S_IWUSR);
>  MODULE_PARM_DESC(boost, "Card overclock boost (in percent 100-500)");
>
>  module_param(clockmode, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, "
> -               "3=6 Mhz)");
> +MODULE_PARM_DESC(clockmode, "Card clock mode (1=3.579 MHz, 2=3.680 MHz, 3=6 Mhz)");
>
>  module_param(cdmode, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, "
> -                "4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
> +MODULE_PARM_DESC(cdmode, "Card detect mode (0=none, 1=CD, 2=!CD, 3=DSR, 4=!DSR, 5=CTS, 6=!CTS, 7=RING, 8=!RING)");
>
>  module_param(vcc_default, int, S_IRUGO | S_IWUSR);
> -MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 "
> -               "for 5V). Default to 5.");
> +MODULE_PARM_DESC(vcc_default, "Set default VCC (either 3 for 3.3V or 5 for 5V). Default to 5.");
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
