Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C78C433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  2 Jul 2022 08:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18796401FB;
	Sat,  2 Jul 2022 08:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18796401FB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FmkGdG3o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yol4CEWoW7yi; Sat,  2 Jul 2022 08:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1B550400F2;
	Sat,  2 Jul 2022 08:14:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B550400F2
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1927C0081;
	Sat,  2 Jul 2022 08:14:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE5B0C0080
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 08:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B28FE41758
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 08:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B28FE41758
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FmkGdG3o
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uTlzhjKd3GsM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 08:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22A1141737
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 22A1141737
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  2 Jul 2022 08:14:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a4so7496436lfm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 02 Jul 2022 01:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3FMVrwGowZV+I8k7FRjSiim84g6W36ScznnLfKwKhWs=;
 b=FmkGdG3oWrW6CkWDLlUg3xeFqfxIHDVqQZI/voImjU8j0WdU6S1wualsnCbNbWstUK
 4POQvj8xIH8LhFWoOSMgk/MheGVWtrh8MRuAwU4ubTd12WQqEvxblUmTxTixWx4WpyYm
 Mgy3zsIq3Hzl73JFUVc8d7HudGm2zsW7zeGg/8iNJ5oVpuj0VHsVa5AxfA07ocXoAJx3
 wk9QytbiE8dJhEZ2DoWxLKzesvozVhUEGNx7OZWn3e2B3DhcyRHUMNF/QJMcFTTAI8Dz
 +2lRaIJt/rMP3x7JJ44N/3Rz1TvoaMv4fOnKqxnbkUp5N22w+3o5t1L2jAS+fpPGI2i+
 EQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3FMVrwGowZV+I8k7FRjSiim84g6W36ScznnLfKwKhWs=;
 b=lMxeTpNXG0d/6dX8lx9x0fTvko1XrkVgsdy5Vfu7g2zfhhE94JGdnQCZ4NHfLKV41K
 CqSjb+DNYH7rRM+PHqSCbWkpX1XMLSjY1GqxzTVggno3BMD78LlM5SRGQ6y6MF7OTi2n
 61ojQGWhRhIqEQ7E+2hvZJYzzeR3AsJGB0aaL1zPjZZockw0VZthxudQleAze0a4gGDE
 cnmP+VrO6qlchmLLjRnjYGqvChQJez0nXuehwgoovk/6v5RLkt9U7nl9yyI5tKCioQ/D
 gdEKoUZMdkQ8UbSyOP0pVsMn4r34tFZN7odcEKtRPOzqPfg/ZJ1+8bsIbrpcRKHyV0jt
 tQpw==
X-Gm-Message-State: AJIora8dX4bDQuv1paoRIwNxmbbgGveR/THBCwX7l7SuVEYcvUQ+6L45
 0dQxdCbpI2ssHePRJGJkZvg=
X-Google-Smtp-Source: AGRyM1vWYfdGKTLhA2IAsJkF0O8oYMQuJhoPClraI1tGpKN4cE2zYqd1/cXHNQ1TFp0kgzK+t6mi8Q==
X-Received: by 2002:a05:6512:3c91:b0:47f:aa00:d39b with SMTP id
 h17-20020a0565123c9100b0047faa00d39bmr11582095lfv.81.1656749647618; 
 Sat, 02 Jul 2022 01:14:07 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.63])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a056512201700b0048162b71f9fsm498733lfb.301.2022.07.02.01.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 01:14:07 -0700 (PDT)
Message-ID: <ee159745-07d2-dca3-6be3-bef823090088@gmail.com>
Date: Sat, 2 Jul 2022 11:14:06 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFT PATCH] isdn: capi: Add check for controller count in
 detach_capi_ctr()
Content-Language: en-US
To: Soumya Negi <soumya.negi97@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20220701235014.13025-1-soumya.negi97@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220701235014.13025-1-soumya.negi97@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Hi Soumya,

Soumya Negi <soumya.negi97@gmail.com> says:
> Fixes Syzbot bug:
> https://syzkaller.appspot.com/bug?id=14f4820fbd379105a71fdee357b0759b90587a4e
> 
> This patch checks whether any ISDN devices are registered before unregistering
> a CAPI controller(device). Without the check, the controller struct capi_str
> results in out-of-bounds access bugs to other CAPI data strucures in
> detach_capri_ctr() as seen in the bug report.
> 
> Reported-by: syzbot+9d567e08d3970bfd8271@syzkaller.appspotmail.com
> 
> Signed-off-by: Soumya Negi <soumya.negi97@gmail.com>
> ---
>   drivers/isdn/capi/kcapi.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/isdn/capi/kcapi.c b/drivers/isdn/capi/kcapi.c
> index 18de41a266eb..6175ff7ec749 100644
> --- a/drivers/isdn/capi/kcapi.c
> +++ b/drivers/isdn/capi/kcapi.c
> @@ -563,6 +563,9 @@ int detach_capi_ctr(struct capi_ctr *ctr)
>   
>   	mutex_lock(&capi_controller_lock);
>   
> +	if (ncontrollers == 0)
> +		goto unlock_out;
> +

It seems like to fix the problem. Did you mean to return 0 in case of 
ncontrollers == 0? Maybe it's better to return an error to indicate that 
function was called wrongly.


On the other hand it means there are suspicious callers of that 
function. Maybe they should be fixed too.

I'd put a warning in case of `ncontrollers == 0`, to indicate that 
something is going completely wrong.




Thanks,
--Pavel Skripkin
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
